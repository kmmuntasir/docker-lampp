SERVICE_NAME="php"

# Just the name
info:
	echo 'docker lampp'

# Start the containers
start:
	docker compose up -d

# Stop the containers
stop:
	docker compose down

# Restart the containers
restart: stop start

rebuild:
	docker compose down && docker compose up -d --build

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
