SHELL := /bin/bash

export DOCKER_BUILDKIT=1

MYSQL_VERSION = 8.0
NGINX_HEALTHZ_VERION := 1.25-alpine
MYSQL_MINIO_VERSION := $(MYSQL_VERSION) # follows mysql versions
MYSQL_RSYNC_VERSION := $(MYSQL_VERSION) # follows mysql versions
LINKERD_AWAIT_VERSION := 0.2.7
MAVEN_VERSION := 3.9.5

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

.PHONY: mysql-rsync
mysql-rsync:
	cd mysql-rsync && \
		docker build \
			--build-arg VERSION=$(MYSQL_RSYNC_VERSION) \
			-t ioagel/mysql-rsync:$(MYSQL_RSYNC_VERSION) \
			.
	docker push ioagel/mysql-rsync:$(MYSQL_RSYNC_VERSION)

# image to cleanly shutdown jobs/cronjobs in the context of linkerd
.PHONY: linkerd-await
linkerd-await:
	cd linkerd-await && \
		docker build \
			--build-arg VERSION=v$(LINKERD_AWAIT_VERSION) \
			-t ioagel/linkerd-await:$(LINKERD_AWAIT_VERSION) \
			.
	docker push ioagel/linkerd-await:$(LINKERD_AWAIT_VERSION)

.PHONY: minio-client
minio-client:
	cd minio-client && \
		docker build \
			-t ioagel/mysql-minio \
			.
	docker push ioagel/mysql-minio

# jdk 8 with maven
.PHONY: maven-jdk8
maven-jdk8:
	cd maven-jdk8 && \
	docker build \
		--build-arg MAVEN_VERSION=$(MAVEN_VERSION) \
		-t ioagel/maven-jdk8:$(MAVEN_VERSION) \
		.
	docker push ioagel/maven-jdk8:$(MAVEN_VERSION)
