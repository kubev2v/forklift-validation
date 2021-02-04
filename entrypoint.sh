#!/bin/bash
set -e

CMD="/usr/bin/opa run --server"
if [ "$TLS_ENABLED" == "true" ]; then
  if [ -f "$TLS_CERT_FILE" ] && [ -f "$TLS_KEY_FILE" ]; then
    CMD="$CMD --tls-cert-file $TLS_CERT_FILE --tls-private-key-file $TLS_KEY_FILE"
  else
    echo "ERROR: TLS_CERT_FILE and/or TLS_KEY_FILE variables not defined correctly"
    exit 1 # terminate and indicate error
  fi
  if [ -f "$TLS_CA_CERT_FILE" ]; then
    CMD="$CMD --tls-ca-cert-file $TLS_CA_CERT_FILE"
  fi
fi
CMD="$CMD /usr/share/opa"

exec "$CMD"