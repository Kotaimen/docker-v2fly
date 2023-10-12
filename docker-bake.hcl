variable "V2FLY_VERSION" {
   default = "5.8.0"
}
group "default" {
   targets = [
      // "v4", 
      "v5"
   ]
}

target "v4" {
   context = "v4"
   dockerfile = "Dockerfile"
   platforms = [
      "linux/amd64",
      "linux/arm64",
      "linux/arm/v7"
   ]
   tags = [
      "docker.io/kotaimen/v2fly:v4",
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
