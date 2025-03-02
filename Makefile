APP_ENV=dev
APP_PORT=8000
BACKEND_DIR=backend
FRONTEND_DIR=frontend
NETWORK=project_network

all: build up

build:
	docker-compose build

up:
	docker-compose up -d

up-back:
	docker-compose up -d backend

up-front:
	docker-compose up -d frontend

down:
	docker-compose down

restart:
	docker-compose down && docker-compose up -d

clean:
	docker system prune -af

clean_files:
	rm -rf $(BACKEND_DIR)/var/cache/*
	rm -rf $(BACKEND_DIR)/var/log/*
	rm -rf $(BACKEND_DIR)/var/sessions/*
	rm -rf $(FRONTEND_DIR)/node_modules
	rm -rf $(FRONTEND_DIR)/dist
	rm -rf $(FRONTEND_DIR)/.angular

test:
	docker-compose exec backend php bin/phpunit

stop:
	docker-compose stop

re:
	docker-compose build --no-cache && docker-compose up -d

.PHONY: all build up stop down clean test restart rebuild
