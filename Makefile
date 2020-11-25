all: test

test: opa-bin
	opa test policies --explain fails

# Find or download opa
opa-bin:
ifeq (, $(shell which opa))
	@{ \
	set -e ;\
	mkdir -p ${HOME}/.local/bin ; \
	curl -sL -o ${HOME}/.local/bin/opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64 ; \
	chmod 755 ${HOME}/.local/bin/opa ;\
	}
endif
