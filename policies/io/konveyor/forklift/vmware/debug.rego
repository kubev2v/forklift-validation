package io.konveyor.forklift.vmware

runtime          := opa.runtime()
ca_tls_cert_file := runtime.env["CA_TLS_CERTIFICATE"]

debug {
	trace(sprintf("** debug ** input: %v", [input.input]))
	trace(sprintf("** debug ** vm name: %v", [input.name]))
  trace(sprintf("** debug ** ca_tls_cert_file: %v", [ca_tls_cert_file]))
}