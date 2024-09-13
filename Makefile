SERVICE_NAME="php"

# Just the name
info:
	echo 'docker lampp'

# Generate SSL certificates
ssl:
	cd .docker_lampp && chmod +x generate_certificates.sh && ./generate_certificates.sh

# Perform cleanups
clean:
	cd .docker_lampp && chmod +x cleanup.sh && ./cleanup.sh

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
