terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

resource "docker_image" "mariadb" {
  name = "mariadb:latest"
  keep_locally = false
}

resource "docker_container" "mariadb" {
  name = "mi_mariadb"
  image = docker_image.mariadb.name

  ports {
    internal = 3306
  }
  networks_advanced {
    name = docker_network.miRedDocker.name
  }
  volumes {
    volume_name    = docker_volume.volumenDocker.name
    container_path = "/var/lib/mysql"
  }
  env = [
    "MYSQL_DATABASE       = var.db_name",
    "MYSQL_USER           = var.db_user",
    "MYSQL_PASSWORD       = var.db_password",
    "MYSQL_ROOT_PASSWORD  = var.db_root_password"
  ]
}

