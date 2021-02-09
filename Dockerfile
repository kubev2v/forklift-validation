FROM registry.access.redhat.com/ubi8/ubi-minimal:8.3-201

COPY opa-0.26.0 /usr/bin/opa && chmod 0755 /usr/bin/opa
COPY policies /usr/share/opa/policies/
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
