# We're using php 8.2 image
# You are free to use any other version if you like
FROM php:8.2-apache

# Setting our work directory on the docker machine
WORKDIR /var/www/html

# Updating the system
RUN apt-get update -y

# Installing mariadb library
RUN apt-get install -y libmariadb-dev

# Installing mysqli php extension
RUN docker-php-ext-install mysqli