SHELL := /bin/bash

export DOCKER_BUILDKIT=1

NGINX_HEALTHZ_VERION ?= 1.25-alpine
MYSQL_MINIO_VERSION ?= 8.1 # follows mysql versions

.PHONY: nginx-healthz
nginx-healthz:
	cd nginx-healthz && \
	docker build \
		--build-arg VERSION=$(NGINX_HEALTHZ_VERION) \
		-t ioagel/nginx-healthz:$(NGINX_HEALTHZ_VERION) \
		.
	docker push ioagel/nginx-healthz:$(NGINX_HEALTHZ_VERION)

.PHONY: mysql-minio
mysql-minio:
	cd mysql-minio && \
	docker build \
		--build-arg VERSION=$(MYSQL_MINIO_VERSION) \
		-t ioagel/mysql-minio:$(MYSQL_MINIO_VERSION) \
		.
	docker push ioagel/mysql-minio:$(MYSQL_MINIO_VERSION)
