/* main.tf
   Alta3 Research - rzfeeser@alta3.com
   CHALLENGE 01 - terraform configuration file to deploy an nginx container */

# terraform block
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

# provider block
provider "docker" {}

# resource block - ensures an image will become present
resource "docker_image" "nginx" {
  name         = "nginx:1.19.6"
  keep_locally = true    // keep image after "destroy"
}

# resource block - ensures a container will become present
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"
  ports {
    internal = 80
    external = 2224
  }
}

