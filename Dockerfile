FROM registry.access.redhat.com/ubi8/ubi-minimal:8.3-201

RUN curl -sL -o /usr/bin/opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64 && chmod 0755 /usr/bin/opa
COPY policies /usr/share/opa/policies/

ENTRYPOINT ["/usr/bin/opa", \
            "run", \
            "--server", \
            "--tls-cert-file", "/var/run/secrets/forklift-inventory-serving-cert/tls.crt", \
            "--tls-private-key-file", "/var/run/secrets/forklift-inventory-serving-cert/tls.key", \
            "/usr/share/opa"]