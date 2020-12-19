#!/bin/sh

# mapping docker "buildplaform" to v2ray's Go archiecture
echo BUILDPLATFORM is "$BUILDPLATFORM"
case ${BUILDPLATFORM} in
  "linux/arm64")
    GOARCH=linux-arm64-v8a
    ;;
  "limux/arm/v6")
    GOARCH=linux-arm32-v6
    ;;
  "limux/arm/v7")
    GOARCH=linux-arm32-v7a
    ;;
   # by default, build x64
   *)
    GOARCH=linux-64
    ;;
esac
echo Go archiecture is "$GOARCH"

# download release and unpack it
wget -q https://github.com/v2fly/v2ray-core/releases/download/v${V2RAYVERSION}/v2ray-${GOARCH}.zip -O v2ray.zip 
apk add --no-cache unzip
unzip v2ray.zip
chmod +x v2ray v2ctl
rm v2ray.zip
apk del unzip
