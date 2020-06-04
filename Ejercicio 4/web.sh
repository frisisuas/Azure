#!/bin/bash
apt update && apt -y upgrade
apt-get -y install apache2
echo "<H1>Pagina creada mediante script</H1>" > /var/www/html/index.html
