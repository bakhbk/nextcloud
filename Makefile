.PHONY: up down setup

setup:
	./setup.sh

up:
	docker compose --env-file .env up -d
	./add-trusted-domain.sh

down:
	docker compose --env-file .env down
