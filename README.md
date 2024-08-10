# Re-packaging of v2fly (v2ray)

Upper stream: https://github.com/v2fly/v2ray-core,
Also includes custom rules from https://github.com/Loyalsoldier.

Architetures:

- `linux/amd64`
- `linux/arm64`

## Quick start

Build using buildx bake:

```shell
docker buildx create --use
docker buildx bake
```