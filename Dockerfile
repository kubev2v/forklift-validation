FROM registry.access.redhat.com/ubi8/ubi-minimal

RUN curl -sL -o /usr/bin/opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64_static && chmod 0755 /usr/bin/opa
COPY policies /usr/share/opa/policies/
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
