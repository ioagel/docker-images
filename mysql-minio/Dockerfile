ARG VERSION
FROM mysql:${VERSION}
LABEL author="Ioannis Angelakopoulos <ioagel@gmail.com>"

RUN curl https://dl.min.io/client/mc/release/linux-amd64/mc \
    -o /usr/local/bin/mc && \
    chmod +x /usr/local/bin/mc
