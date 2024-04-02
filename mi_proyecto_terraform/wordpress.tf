resource "docker_image" "wordpress" {
 name = "wordpress:latest"
 keep_locally = false
}

resource "docker_container" "wordpress" {
 name = "mi_wordpress"
 image = docker_image.wordpress.name
  ports {
   internal = 80
  }
 networks_advanced {
  name = docker_network.miRedDocker.name
 }
 env = [
  "WORDPRESS_DB_HOST	= docker_container.mariadb.name",
  "WORDPRESS_DB_NAME	= var.db_name",
  "WORDPRESS_DB_USER	= var.db_user",
  "WORDPRESS_DB_PASSWORD = var.db_password"
  ]
}
