# Utilisation de l'image PHP avec Apache
FROM php:8.2-apache

# Installation des extensions PHP nécessaires
RUN docker-php-ext-install pdo pdo_mysql

# Installation de Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Installation de Symfony CLI
RUN curl -sS https://get.symfony.com/cli/installer | bash && \
    mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

# Copie des fichiers du backend
WORKDIR /var/www/html
COPY . .

RUN rm -rf var/cache/* && composer clear-cache

# Installation des dépendances
RUN composer install

# Exposer le port 8000
EXPOSE 8000

# Commande pour démarrer le serveur Symfony
CMD symfony server:start --no-tls --port=8000 --allow-all-ip
