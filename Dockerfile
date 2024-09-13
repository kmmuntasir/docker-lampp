# We're using php 8.2 image
# You are free to use any other version if you like
FROM php:8.2-apache

# Installing Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Copying your additional php.ini settings
# COPY php.ini /usr/local/etc/php/

# Enabling mod rewrites
RUN a2enmod rewrite
RUN a2enmod expires
RUN a2enmod headers

# Updating the system
RUN apt-get update -y

# Installing mariadb library
RUN apt-get install -y libmariadb-dev git curl zip unzip zlib1g-dev libxml2-dev libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12.0 imagemagick

# Installing php extensions
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install gd
RUN docker-php-ext-install opcache

# Copy custom Apache configuration
# COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

# Restart Apache
# RUN service apache2 restart

# Setting our work directory on the docker machine
WORKDIR /var/www/html

# Expose port 80
# EXPOSE 80
