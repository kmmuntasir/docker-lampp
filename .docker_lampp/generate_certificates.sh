#!/bin/bash

mkdir -p certs
openssl req -x509 -nodes -days 1024 -newkey rsa:2048 -keyout certs/selfsigned.key -out certs/selfsigned.crt -subj "/C=US/ST=State/L=City/O=Company/OU=Org/CN=localhost"