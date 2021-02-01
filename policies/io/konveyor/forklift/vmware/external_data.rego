package io.konveyor.forklift.vmware

runtime            := opa.runtime()
provider           := input.provider
vm_moref           := input.vm_moref
inventory_hostname := concat(":", [runtime.env["FORKLIFT_INVENTORY_SERVICE_HOST"], runtime.env["FORKLIFT_INVENTORY_SERVICE_PORT"]])
inventory_url      := concat("/", ["https:/", inventory_hostname, "namespaces", provider.namespace, "providers", "vsphere", provider.name, "workloads", vm_moref])
#vm                 := http.send({"url": inventory_url, "method": "get", "tls_insecure_skip_verify": true}).body
vm                 := http.send({"url": inventory_url, "method": "get", "tls_client_cert_file": runtime.env["API_TLS_CERTIFICATE"], "tls_client_key_file": runtime.env["API_TLS_KEY"]. "tls_use_system_certs": "true"}).body

debug {
  trace(sprintf("** debug ** inventory_hostname: %v", [inventory_hostname]))
  trace(sprintf("** debug ** inventory_url: %v", [inventory_url]))
  trace(sprintf("** debug ** vm name: %v", [vm.name]))
}





