package io.konveyor.forklift.vmware

runtime            := opa.runtime()
provider           := input.provider
vm_moref           := input.vm_moref
inventory_hostname := concat(":", [runtime.env["FORKLIFT_INVENTORY_SERVICE_HOST"], runtime.env["FORKLIFT_INVENTORY_SERVICE_PORT"]])
trace(sprintf("** debug ** inventory_hostname: %v", [inventory_hostname]))
inventory_url      := concat("/", ["https:/", inventory_hostname, "namespaces", provider.namespace, "providers", "vsphere", provider.name, "workloads", vm_moref])
trace(sprintf("** debug ** inventory_url: %v", [inventory_url]))
vm                 := http.send({"url": inventory_url, "method": "get", "tls_insecure_skip_verify": true}).body
trace(sprintf("** debug ** vm name: %v", [vm.name]))





