# Variables
APP_ENV=dev
APP_PORT=8000
BACKEND_DIR=backend
FRONTEND_DIR=frontend
NETWORK=project_network

# Règle par défaut : build, run et stop
all: build up

# Construire les images Docker pour le backend et le frontend
build:
	docker-compose build

# Lancer les services (backend et frontend)
up:
	docker-compose up -d

# Lancer le backend uniquement
up-back:
	docker-compose up -d backend

# Lancer le frontend uniquement
up-front:
	docker-compose up -d frontend

# Arrêter les services
down:
	docker-compose down

# Recréer les services et les relancer (utile après des changements de configuration ou de Dockerfile)
restart:
	docker-compose down && docker-compose up -d

# Nettoyer les images Docker inutilisées
clean:
	docker system prune -af

clean_files:
	rm -rf $(BACKEND_DIR)/var/cache/*
	rm -rf $(BACKEND_DIR)/var/log/*
	rm -rf $(BACKEND_DIR)/var/sessions/*
	rm -rf $(FRONTEND_DIR)/node_modules
	rm -rf $(FRONTEND_DIR)/dist
	rm -rf $(FRONTEND_DIR)/.angular

# Lancer les tests PHPUnit du backend dans le conteneur Docker
test:
	docker-compose exec backend php bin/phpunit

# Stopper et supprimer les services (frontend et backend)
stop:
	docker-compose stop

# Recréer les services sans le cache
rebuild:
	docker-compose build --no-cache && docker-compose up -d

.PHONY: all build up stop down clean test restart rebuild
