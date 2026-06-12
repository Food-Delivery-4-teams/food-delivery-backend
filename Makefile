.PHONY: up down logs seed reset psql redis-cli mc 

up:       ## start full stack in background 
		docker compose up -d 
		@echo "✓ Stack running. Postgres:5432  Redis:6379  MinIO:9001  Mailhog:8025"

down:     ## stop stack (volumes preserved) 
		docker compose down 

 
logs:     ## tail all service logs 
		docker compose logs -f


seed:     ## load demo/dummy data into Postgres 
		 docker compose exec -T postgres psql -U $(DB_USER) -d $(DB_NAME) < init/postgres/seed.sql

reset:    ## DANGER — wipe volumes and start fresh 
		 docker compose down -v && docker compose up -d 

psql:     ## drop into Postgres shell 
		 docker compose exec postgres psql -U $(DB_USER) -d $(DB_NAME) 

redis-cli: ## drop into Redis shell 
		 docker compose exec redis redis-cli 

ps:       ## show running services 
		docker compose ps 

