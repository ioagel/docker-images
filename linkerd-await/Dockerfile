# This container is to run as init container in jobs/cronjobs when the app targeted is
# linkerd meshed and we want the linkerd proxy to stop and the job to complete gracefully!
# https://github.com/linkerd/linkerd-await#examples
FROM curlimages/curl:latest
ARG VERSION

RUN curl -sSLo /tmp/linkerd-await https://github.com/linkerd/linkerd-await/releases/download/release%2F${VERSION}/linkerd-await-${VERSION}-amd64 && \
  chmod 755 /tmp/linkerd-await
