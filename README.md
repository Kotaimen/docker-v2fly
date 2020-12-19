# v2fly Multiarch Docker 

## Quick start

```
docker buildx create --name v2fly
docker buildx use v2fly
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v6,linux/arm/v7 .
```
