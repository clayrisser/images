NAME ?= ci-images-docker
REGISTRY ?= registry.gitlab.com/silicon-hills/community
VERSION ?= 0.0.1
IMAGE := $(REGISTRY)/$(NAME)

include docker.mk

.PHONY: postgres
postgres:
	@docker-compose up $(ARGS) postgres

.PHONY: keycloak
keycloak:
	@docker-compose up $(ARGS) keycloak

.PHONY: redis
redis:
	@docker-compose up $(ARGS) redis

.PHONY: deps
deps:
	@docker-compose up $(ARGS) deps

.PHONY: ~%
~%:
	@$(MAKE) -s $(shell echo $@ | $(SED) 's/^~//g') ARGS="-d"

.PHONY: %
%: ;
