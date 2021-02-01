package io.konveyor.forklift.vmware

runtime                         := opa.runtime()
provider                        := input.provider
vm_moref                        := input.vm_moref
forklift_inventory_service_host := runtime.env["FORKLIFT_INVENTORY_SERVICE_HOST"]
forklift_inventory_service_port := runtime.env["FORKLIFT_INVENTORY_SERVICE_PORT"]
api_tls_cert_file               := runtime.env["API_TLS_CERTIFICATE"]
api_tls_key_file                := runtime.env["API_TLS_KEY"]
ca_tls_cert_file                := runtime.env["CA_TLS_CERTIFICATE"]
inventory_hostname              := concat(":", [forklift_inventory_service_host, forklift_inventory_service_port])
inventory_url                   := concat("/", ["https:/", inventory_hostname, "namespaces", provider.namespace, "providers", "vsphere", provider.name, "workloads", vm_moref])
#vm                 := http.send({"url": inventory_url, "method": "get", "tls_insecure_skip_verify": true}).body
vm                              := http.send({"url": inventory_url, "method": "get", "tls_client_cert_file": api_tls_cert_file, "tls_client_key_file": api_tls_key_file, "tls_ca_cert_file": ca_tls_cert_file}).body

debug {
  trace(sprintf("** debug ** inventory_hostname: %v", [inventory_hostname]))
  trace(sprintf("** debug ** inventory_url: %v", [inventory_url]))
  trace(sprintf("** debug ** api_tls_cert_file: %v", [api_tls_cert_file]))
  trace(sprintf("** debug ** api_tls_key_file: %v", [api_tls_key_file]))
  trace(sprintf("** debug ** ca_tls_cert_file: %v", [ca_tls_cert_file]))
  trace(sprintf("** debug ** vm name: %v", [vm.name]))
}





