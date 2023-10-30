ARG VERSION
FROM mysql:${VERSION}
LABEL author="Ioannis Angelakopoulos <ioagel@gmail.com>"

RUN microdnf -y update && \
    microdnf install -y openssh-clients rsync && \
    microdnf clean all
