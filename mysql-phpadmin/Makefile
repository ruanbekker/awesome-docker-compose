# Thanks: https://gist.github.com/mpneuried/0594963ad38e68917ef189b4e6a269db
.PHONY: help

help: ## Prints the help menu
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help


# DOCKER TASKS
up: ## Starts the containers in detached mode
	docker-compose up -d

down: ## Stops the containers
	docker-compose down --remove-orphans

open: ## Opens the phpmyadmin in a new tab (os depending)
	open http://localhost:18080

clean: ## Stops the containers and deletes the mysql data
	docker-compose down --remove-orphans
	rm -rf ./data


