package io.konveyor.forklift.vmware

runtime := opa.runtime()

provider_type      := input.provider_type
provider_name      := input.provider_name
provider_namespace := runtime.env["POD_NAMESPACE"]
inventory_hostname := runtime.env["INVENTORY_HOSTNAME"]
inventory_base_url := concat("/", ["https:/", inventory_hostname, "namespaces", provider_namespace, "providers", provider_type, provider_name])

vm_response := http.send({
    "url": concat("/", [inventory_base_url, "vms", input.vm_moref]),
    "method": "get",
    "tls_insecure_skip_verify": true
})
vm := vm_response.body

host_response := http.send({
    "url": concat("/", [inventory_base_url, "hosts", vm.host.id]),
    "method": "get",
    "tls_insecure_skip_verify": true
})
host := host_response.body

cluster_response := http.send({
    "url": concat("/", [inventory_base_url, "clusters", host.parent.id]),
     "method": "get",
     "tls_insecure_skip_verify": true
})
cluster := cluster_response.body
