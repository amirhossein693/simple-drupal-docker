FROM php:8-fpm
LABEL maintainer="amirhossein693@gmail.com"

RUN apt-get update && apt-get install -y \
        libpq-dev \
        libicu-dev \
        zlib1g-dev \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
        postgresql-client \
    && docker-php-ext-configure \
        gd --with-jpeg --with-freetype \    
    && docker-php-ext-install \
        gd \
        bcmath \
        opcache \
        pdo \
        pdo_pgsql \
    && docker-php-ext-enable \
        gd \
        bcmath \
        opcache \
        pdo \
        pdo_pgsql

COPY php.ini /usr/local/etc/php
        
