variable "V2RAY_VERSION" {
	default = "4.34.0"
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
   tags = [
      "docker.io/kotaimen/v2fly:${V2RAY_VERSION}",
   ]
}
