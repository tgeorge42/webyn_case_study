FROM php:8.2-apache

RUN docker-php-ext-install pdo pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN curl -sS https://get.symfony.com/cli/installer | bash && \
    mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

WORKDIR /var/www/html
COPY . .

RUN rm -rf var/cache/* && composer clear-cache

RUN composer install

EXPOSE 8000

CMD symfony server:start --no-tls --port=8000 --allow-all-ip
