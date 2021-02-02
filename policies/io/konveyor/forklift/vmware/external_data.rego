package io.konveyor.forklift.vmware

runtime                         := opa.runtime()
provider                        := input.provider
vm_moref                        := input.vm_moref
forklift_inventory_service_port := runtime.env["FORKLIFT_INVENTORY_SERVICE_PORT"]
namespace                       := runtime.env["NAMESPACE"]
ca_tls_cert_file                := runtime.env["CA_TLS_CERTIFICATE"]
inventory_service               := runtime.env["INVENTORY_SERVICE"]
inventory_hostname              := concat(".", [inventory_service, namespace, "svc", "cluster", "local"])
inventory_socket                := concat(":", [inventory_hostname, forklift_inventory_service_port])
inventory_url                   := concat("/", ["https:/", inventory_socket, "namespaces", provider.namespace, "providers", "vsphere", provider.name, "workloads", vm_moref])
vm                              := http.send({"url": inventory_url, "method": "get", "tls_ca_cert_file": ca_tls_cert_file}).body

debug {
	trace(sprintf("** debug ** inventory_hostname: %v", [inventory_hostname]))
	trace(sprintf("** debug ** inventory_url: %v", [inventory_url]))
	trace(sprintf("** debug ** ca_tls_cert_file: %v", [ca_tls_cert_file]))
	trace(sprintf("** debug ** vm name: %v", [vm.name]))
}





