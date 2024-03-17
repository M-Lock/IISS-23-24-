#Entregable Docker-compose
##Drupal + MySQL
Para este docker-compose, utilizamos las imágenes mas recientes de ambos servicios. Dentro del servicio Drupal, indicamos que el host utilizará el puerto 81 para conectarse con el servicio.
El volumen se instalará en /var/www/html, dado que, como se explica en la página de la imagén, es el lugar donde la mayoria de usuarios monta dicho contenedor.
En environment, definiremos las distintas variables de entorno que el servicio necesita para funcionar, en este caso, toda la información relativa a la base de datos MySQL que utilizará.
Por último, restart:always, es totalmente opcional, pero es una buena práctica en caso de que el servicio caiga sin que lo apaguemos manualmente.

Para MySQL definiremos el volumen en /var/lib/mysql , dado que es donde MySQL escribe por defecto sus ficheros de datos, lo que nos permitirá la persistencia de sus datos.
En environment, definiremos las variables para la conexión con drupal, que dependerán de las utilizadas durante la descripción de dicho servicio. Solo ROOT_PASSWORD es obligatoria, 
pero para el correcto funcionamiento de ambos servicios, añadimos  USER, PASSWORD y DATABASE, que deben contener los mismos valores estipulados en las variables de Drupal

##Wordpress + MariaDB
Al igual que en la solución anterior, utilizaremos las imágenes más recientes de ambos servicios. 
Para wordpress, el proceso es identico al de Drupal, definiendo las variables de entorno que necesitaremos para el correcto funcionamiento del servicio.
Indicaremos que el puerto al que debe conectarse el host es el 82, tal y como se indica en el enunciado.

Para configurar MariaDB, utilizaremos las mismas variables que con MySQL. Cabe destacar dos aspectos importantes de la configuración. En la documentación oficial de MariaDB, se indica que solo
es necesaria una variable MARIADB_ROOT_PASSWORD para el correcto funcionamiento del servicio. Sin embargo, durante el desarrollo de la practica, el uso de dicha variable a llevado a errores
en la conexión de wordpress con la base de datos. Además, el nombre que recibe el servicio (db en nuestro caso) es el valor que debe contener la variable WORDPRESS_BD_HOST, y no el nombre de
la imagen utilizada.

Finalmente, añadiremos la definición de la red al final del archivo, así como dentro de ambos servicios. No es necesario indicar ninguna clase de controlador de la red, ya que utilizaremos el
que docker coloca por defecto, dado que no se especifica nada en el enunciado de la práctica.