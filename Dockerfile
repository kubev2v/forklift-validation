FROM registry.access.redhat.com/ubi8/ubi-minimal:8.3-201

COPY opa-v0.27.1 /usr/bin/opa
COPY policies /usr/share/opa/policies/
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
