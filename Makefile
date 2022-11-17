GOPATH:=$(shell pwd)
MICROSERVICE:=kc_rslfe_fe
MICROSERVICE_BIN:=kc_rslfe
GO:=go 
GOFLAGS:=-v -p 1


CLOUD_TARGETS:=bin/${MICROSERVICE_BIN}


default: ${CLOUD_TARGETS}


bin/${MICROSERVICE_BIN}:
	@echo "========== Compiling $@ =========="
	sh -c '$(GO) build $(GOFLAGS) -o $@ git.kaiostech.com/cloud/kc_rslfe/${MICROSERVICE}'


clean:
	@echo "Deleting generated binary files ..."; for binary in ${CLOUD_TARGETS}; do if [ -f "$${binary}" ]; then rm -f $${binary} && echo $${binary}; fi; done