FROM registry.access.redhat.com/ubi8/ubi-minimal:8.3-201

ENV OPA=opa-0.26.0
COPY "$OPA" /usr/bin/ && chmod 0755 /usr/bin/$OPA
COPY policies /usr/share/opa/policies/
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["$OPA"]
