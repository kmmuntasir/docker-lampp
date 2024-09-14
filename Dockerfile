# We're using php 8.2 image
# You are free to use any other version if you like
FROM php:8.2-apache

# Enable required Apache modules
RUN a2enmod rewrite expires headers

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

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Copy php.ini if it exists
RUN [ -f /var/www/html/php.ini ] && cp /var/www/html/php.ini /usr/local/etc/php/ || echo "php.ini not found, skipping."

# Copy apache-config.conf if it exists
RUN [ -f /var/www/html/apache-config.conf ] && cp /var/www/html/apache-config.conf /etc/apache2/sites-available/000-default.conf || echo "apache-config.conf not found, skipping."

# Set working directory
WORKDIR /var/www/html

# Expose port 80 for HTTP traffic
EXPOSE 80

# Final cleanup to minimize image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Ensure Apache starts with the latest configuration
CMD ["apache2-foreground"]
