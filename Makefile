SERVICE_NAME="php"

# Just the name
info:
	echo 'docker lampp'

# Build the containers
build:
	cd .docker_lampp && docker compose up -d --build

# Start the containers
start:
	cd .docker_lampp && docker compose up -d

# Stop the containers
stop:
	cd .docker_lampp && docker compose down

# Restart the containers
restart: stop start

rebuild: stop build

# Enter the node container
shell:
	docker exec -it ${SERVICE_NAME} bash

# Install dependencies
install:
	docker exec -it ${SERVICE_NAME} composer install

# Run any command
# Example: make command cmd="uname -r"
command:
	docker exec -it ${SERVICE_NAME} ${cmd}
