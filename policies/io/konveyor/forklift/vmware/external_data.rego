package io.konveyor.forklift.vmware

runtime := opa.runtime()

provider_type      := input.provider_type
provider_name      := input.provider_name
provider_namespace := runtime.env["POD_NAMESPACE"]
inventory_hostname := runtime.env["INVENTORY_HOSTNAME"]
inventory_base_url := concat("/", ["https:/", inventory_hostname, "namespaces", provider_namespace, "providers", provider_type, provider_name])

default is_test = false

is_test {
    not is_null(runtime.env["ENVIRONMENT"])
    runtime.env["ENVIRONMENT"] == "test"
}

vm = inventory_vm {
    not is_test
    inventory_vm := http.send({
        "url": concat("/", [inventory_base_url, "vms", input.vm_moref]),
        "method": "get",
        "tls_insecure_skip_verify": true
    }).body
}

host = inventory_host {
    not is_test
    inventory_host := http.send({
        "url": concat("/", [inventory_base_url, "hosts", vm.host.id]),
        "method": "get",
        "tls_insecure_skip_verify": true
    }).body
}

cluster = inventory_cluster {
    not is_test
    inventory_cluster := http.send({
        "url": concat("/", [inventory_base_url, "clusters", host.parent.id]),
        "method": "get",
        "tls_insecure_skip_verify": true
    }).body
}
