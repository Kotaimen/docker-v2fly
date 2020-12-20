#!/bin/sh

set -ex

# mapping docker platform to v2ray's Go archiecture
echo Build platform is "${BUILDPLATFORM}"
echo Target platform is "${TARGETPLATFORM}"
case ${TARGETPLATFORM} in
  "linux/arm64")
    GOARCH=linux-arm64-v8a
    ;;
  "linux/arm/v6")
    GOARCH=linux-arm32-v6
    ;;
  "linux/arm/v7")
    GOARCH=linux-arm32-v7a
    ;;
   "linux/amd64")
    GOARCH=linux-64
    ;;
   "*")
    exit -1
    ;;
esac

echo Go archiecture is "$GOARCH"

# download release and unpack it
wget -q https://github.com/v2fly/v2ray-core/releases/download/v${V2RAY_VERSION}/v2ray-${GOARCH}.zip -O v2ray.zip 
apk add --no-cache unzip
unzip v2ray.zip
chmod +x v2ray v2ctl
rm v2ray.zip
apk del unzip
