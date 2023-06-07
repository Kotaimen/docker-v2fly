FROM public.ecr.aws/docker/library/golang:1.17-alpine AS build

WORKDIR /build

RUN apk add --no-cache \
  git wget \
  gcc musl-dev
RUN git clone --depth 1 --branch dev-v4main https://github.com/v2fly/v2ray-core.git 

WORKDIR /build/v2ray-core

RUN go mod download -x

RUN mkdir -p build_assets && \
  go build -v -o build_assets/v2ray -trimpath -ldflags "-s -w -buildid=" ./main

WORKDIR /build/v2ray-core/build_assets

RUN wget -q https://github.com/v2fly/geoip/releases/latest/download/geoip-only-cn-private.dat -O geoip-only-cn-private.dat && \
  wget -q https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat -O geoip.dat && \
  wget -q https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat -O geosite.dat
  

FROM public.ecr.aws/docker/library/alpine:3

COPY --from=build /build/v2ray-core/build_assets/v2ray /bin/
COPY --from=build /build/v2ray-core/build_assets/geoip-only-cn-private.dat /etc/v2ray/
COPY --from=build /build/v2ray-core/build_assets/geoip.dat /etc/v2ray/
COPY --from=build /build/v2ray-core/build_assets/geosite.dat /etc/v2ray/
COPY --from=build /build/v2ray-core/release/config/config.json /etc/v2ray/config.jsonc

ENV V2RAY_LOCATION_ASSET /etc/v2ray/

ENTRYPOINT [ "v2ray", "-c", "/etc/v2ray/config.jsonc" ]
