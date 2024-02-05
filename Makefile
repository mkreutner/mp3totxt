#!make
include .env

# HELP
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

gen-pass: ## Generate an encrypt password from prompt
	@clear
	@./tools/system/gen_encrypt_password.sh

build: ## Build images
	@docker compose build
up: ## Start containers stack (dettached)
	@docker compose up -d
down: ## Stop containers stack 
	@docker compose down
destroy: ## Stop containers stack and remove volumes
	@docker compose down -v
ps: ## List all container
	@docker container ps -a

python-cli: ## Connect to python-cli
	@docker compose exec python-cli bash
python-batch: ## Run the batch in python-cli
	@docker compose exec python-cli /etc/poetry/bin/poetry run python /code/speech_2_text.py

