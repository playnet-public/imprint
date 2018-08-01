###################### PlayNet Makefile ######################

NAME		:= imprint
REPO		:= playnet-public
GIT_HOST	:= github.com
REGISTRY	:= quay.io
IMAGE		:= playnet/imprint

VERSION		:= $(shell git describe --tags --always --dirty)
BRANCH 		:= $(shell git rev-parse --abbrev-ref HEAD)
REVISION 	:= $(shell git rev-parse HEAD)
REVSHORT 	:= $(shell git rev-parse --short HEAD)
USER 		:= $(shell whoami)

NAMESPACE	?= $(NAME)
DOCKER_CACHE ?= --no-cache

DOCKER_TAGS := -t $(REGISTRY)/$(IMAGE):$(VERSION) -t $(REGISTRY)/$(IMAGE):latest

-include .env

.PHONY: build

### MAIN STEPS ###

all: build upload restart clean

run: build
	docker run -it --rm -p 8080:80 $(REGISTRY)/$(IMAGE):latest

build:
	@docker build $(DOCKER_CACHE) --rm=true $(DOCKER_TAGS) \
	-f Dockerfile .

upload:
	docker push $(REGISTRY)/$(IMAGE)

restart:
	kubectl delete po -n $(NAMESPACE) -lapp=$(NAME)

clean:
	docker rmi -f $(shell docker images -q --filter=reference=$(REGISTRY)/$(IMAGE)*)

### HELPER STEPS ###

version:
	@echo $(VERSION)

