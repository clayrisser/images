all: build

build:
	@$(MAKE) -s -C docker build ARGS=$(ARGS)

pull:
	@$(MAKE) -s -C docker pull ARGS=$(ARGS)

push:
	@$(MAKE) -s -C docker push ARGS=$(ARGS)
