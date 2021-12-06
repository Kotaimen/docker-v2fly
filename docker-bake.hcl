variable "V2RAY_VERSION" {
	default = "4.44.0"
}

group "default" {
	targets = ["v2fly"]
}

target "v2fly" {
   context = "."
   dockerfile = "Dockerfile"
   platforms = [
      "linux/amd64", 
      "linux/arm64", 
      "linux/arm/v6", 
      "linux/arm/v7"
   ]
   args = {
      V2RAY_VERSION = "${V2RAY_VERSION}"
   }
   tags = [
      "docker.io/kotaimen/v2fly:${V2RAY_VERSION}",
      "docker.io/kotaimen/v2fly:latest"
   ]
}
