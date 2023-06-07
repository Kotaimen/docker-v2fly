# Re-packaging of v2fly (v2ray)

Upper stream: https://github.com/v2fly/v2ray-core,
Also includes custom rules from https://github.com/Loyalsoldier.

Architetures:

- `linux/amd64`
- `linux/arm64`
- `linux/arm/v7`

## Quick start

Build using buildx bake:

```shell
docker buildx create --use
docker buildx bake
```

## Push to ECR via RegSync

```shell
docker container run -i --rm \
  -e ECR_PASSWORD1=(aws --profile=bose_cn_networking ecr get-login-password --region cn-north-1) \
  -e ECR_PASSWORD2=(aws --profile=kotaimen ecr get-login-password --region cn-north-1) \
  -v "$(pwd)/regsync.yaml:/home/appuser/regsync.yaml" \
  ghcr.io/regclient/regsync:latest -c /home/appuser/regsync.yaml once
```
