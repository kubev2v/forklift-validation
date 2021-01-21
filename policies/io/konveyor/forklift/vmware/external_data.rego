package io.konveyor.forklift.vmware

runtime            := opa.runtime()
provider           := input.provider
vm_moref           := input.vm_moref
inventory_hostname := runtime.env["INVENTORY_HOSTNAME"]
inventory_url      := concat("/", ["https:/", inventory_hostname, "namespaces", provider.namespace, "providers", "vsphere", provider.name, "workloads", vm_moref])
vm                 := http.send({"url": inventory_url, "method": "get", "tls_insecure_skip_verify": true}).body





