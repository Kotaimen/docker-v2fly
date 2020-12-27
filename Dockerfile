FROM alpine:3

ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG V2RAY_VERSION=4.32.1

WORKDIR /usr/local/bin

ADD download.sh .

RUN apk --no-cache --no-progress add unzip &&\
    \
    ./download.sh && \
    unzip v2ray.zip &&\
    chmod +x v2ray v2ctl &&\ 
    \
    apk del unzip &&\
    rm -rf v2ray.zip build.sh systemd v2ctl

ENTRYPOINT ["v2ray"]
