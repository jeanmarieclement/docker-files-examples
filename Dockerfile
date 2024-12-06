# Utilizza l'immagine di base di PHP 8.3 con Apache
FROM php:8.3-apache

# Installa le estensioni PHP necessarie
RUN apt-get update \
    && apt-get upgrade  \
    && apt-get install -y zlib1g-dev g++ git libicu-dev zip libzip-dev \
    && pecl install apcu \
    && docker-php-ext-install intl opcache mysqli pdo pdo_mysql \
    && docker-php-ext-enable apcu \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip

RUN a2enmod rewrite

WORKDIR /var/www/html
