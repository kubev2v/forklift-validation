package io.konveyor.forklift.vmware

runtime          := opa.runtime()
ca_tls_cert_file := runtime.env["CA_TLS_CERTIFICATE"]
name             := input.name

debug {
	trace(sprintf("** debug ** vm name: %v", [name]))
  trace(sprintf("** debug ** ca_tls_cert_file: %v", [ca_tls_cert_file]))
}