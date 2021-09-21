#pull base layer
FROM php:8.0-fpm

#update os dependencies and packages
RUN apt-get update && apt-get install sudo && apt-get install -y --no-install-recommends \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    libzip-dev \
    unzip \
    git \
    libonig-dev \
    curl 
# && apt-get install -y apt-utils 
# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions for php
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd

#download composer
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php

#composer version verfication
RUN HASH=`curl -sS https://composer.github.io/installer.sig` \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

#install composer
RUN sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
 
#copying configs
#COPY .php.ini /etc/php/8.0/fpm/php.ini

EXPOSE 9000
CMD ["php-fpm"]