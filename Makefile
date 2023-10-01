SHELL := /bin/bash

export DOCKER_BUILDKIT=1

NGINX_HEALTHZ_VERION ?= 1.25-alpine

.PHONY: nginx-healthz
nginx-healthz:
	cd nginx-healthz && \
	docker build \
		--build-arg VERSION=$(NGINX_HEALTHZ_VERION) \
		-t ioagel/nginx-healthz:$(NGINX_HEALTHZ_VERION) \
		.
	docker push ioagel/nginx-healthz:$(NGINX_HEALTHZ_VERION)
