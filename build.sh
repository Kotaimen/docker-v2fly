#!/bin/sh

set -ex

# Mapping docker platform to Go archiecture
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
echo V2ray version is "$V2RAY_VERSION"

# Get release 
wget -q https://github.com/v2fly/v2ray-core/releases/download/v${V2RAY_VERSION}/v2ray-${GOARCH}.zip -O v2ray.zip 
unzip v2ray.zip
chmod +x v2ray v2ctl 

# Update geoip & site data

# -- offical v2ray data --
# wget -q https://github.com/v2fly/geoip/releases/latest/download/geoip.dat -O geoip.dat
# wget -q https://github.com/v2fly/geoip/releases/latest/download/geoip-only-cn-private.dat -O geoip-only-cn-private.dat
# wget -q https://github.com/v2fly/domain-list-community/releases/latest/download/dlc.dat -O geosite.dat

# -- super powered rules --
wget -q https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat -O geoip.dat
wget -q https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat -O geoip-only-cn-private.dat


# delete unused files
rm -rf v2ray.zip *.json v2ctl systemd
