FROM alpine:3

ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG V2RAY_VERSION=4.32.1

WORKDIR /var/lib/v2ray

ADD build.sh .

RUN source build.sh

RUN apk --no-cache --no-progress upgrade &&\
    apk --no-cache --no-progress add unzip &&\
    unzip v2ray.zip &&\
    chmod +x v2ray v2ctl &&\ 
    \
    apk del unzip &&\
    rm -rf v2ray.zip build.sh systemd v2ctl systemd

ENTRYPOINT ["./v2ray"]
