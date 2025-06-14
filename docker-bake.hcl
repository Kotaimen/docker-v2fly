variable "V2FLY_VERSION" {
   default = "5.32.0"
}
group "default" {
   targets = [
      "v5"
   ]
}

target "v5" {
   context = "v5"
   dockerfile = "Dockerfile"
   args = {
      V2FLY_VERSION = "${V2FLY_VERSION}"
   }
   platforms = [
      "linux/amd64",
      "linux/arm64",
   ]
   tags = [
      "ghcr.io/kotaimen/v2fly:${V2FLY_VERSION}",
   ]
}
