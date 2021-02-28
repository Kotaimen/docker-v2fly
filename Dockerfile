FROM alpine:3

ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG V2RAY_VERSION=4.32.1

WORKDIR /usr/local/bin

ADD download.sh .
ADD config.jsonc /etc/v2ray/

RUN ./download.sh 
ENTRYPOINT ["v2ray", "-c", "/etc/v2ray/config.jsonc"]
