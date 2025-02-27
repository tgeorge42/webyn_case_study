# Makefile pour le projet Symfony

# Variables
APP_ENV=dev
APP_PORT=8000
BACKEND_DIR=backend

# Règle par défaut
all: build run

# Construire le projet
build:
	cd $(BACKEND_DIR) && composer install

# Lancer le serveur
run:
	cd $(BACKEND_DIR) && symfony server:start --port=$(APP_PORT)

# Arrêter le serveur
stop:
	symfony server:stop

# Nettoyer les fichiers non utilisés
clean:
	rm -rf var/cache/*
	rm -rf var/log/*
	rm -rf var/sessions/*

.PHONY: all build run stop clean
