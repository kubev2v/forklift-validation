FROM registry.access.redhat.com/ubi8/ubi-minimal:8.3-201

#ENV OPA=opa-0.26.0
COPY policies /usr/share/opa/policies/
COPY entrypoint.sh /
COPY opa-0.26.0 /usr/bin/
RUN chmod 0755 /usr/bin/opa-0.26.0

ENTRYPOINT ["/entrypoint.sh", "opa-0.26.0"]
#CMD [$OPA]
