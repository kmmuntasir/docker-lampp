# We're using php 8.2 image
# You are free to use any other version if you like
FROM php:8.2-apache

# Update the system's package list and install dependencies
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    libmariadb-dev \
    git \
    curl \
    zip \
    unzip \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libxml2-dev \
    imagemagick && \
    rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd mysqli opcache

# Install Xdebug
RUN pecl install xdebug && \
    docker-php-ext-enable xdebug

# Enable required Apache modules
RUN a2enmod rewrite expires headers ssl

# Set working directory
WORKDIR /var/www/html

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Copy .ini and .conf from .docker_lampp directory if it exists
COPY php.ini /usr/local/etc/php/
COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

# Copy SSL certificates into the container
COPY default-ssl.conf /etc/apache2/sites-available/default-ssl.conf
COPY certs/selfsigned.crt /etc/ssl/certs/selfsigned.crt
COPY certs/selfsigned.key /etc/ssl/private/selfsigned.key

# Set correct permissions for SSL key and certificate
RUN chmod 600 /etc/ssl/private/selfsigned.key && \
    chmod 644 /etc/ssl/certs/selfsigned.crt

# Enable SSL site
RUN a2ensite default-ssl.conf

# Expose ports 80 (HTTP) and 443 (HTTPS)
EXPOSE 80 443

# Expose port 9003 for Xdebug (default Xdebug 3 debugging port)
EXPOSE 9003

# Ensure Apache starts with the latest configuration
CMD ["apache2-foreground"]