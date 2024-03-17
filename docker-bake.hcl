variable "V2FLY_VERSION" {
   default = "5.14.1"
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
      // "linux/arm/v7"
   ]
   tags = [
      "docker.io/kotaimen/v2fly:${V2FLY_VERSION}",
   ]
}
