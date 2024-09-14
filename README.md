# docker-lampp
A simple starting point if you want to run a lampstack on docker but don't want to fiddle around :)


## How to use

1. Clone this repository
2. Run `make clean` to remove any existing certificates
3. Run `make ssl` to generate a self-signed certificate
4. Run `make start` to start the container
5. Place your project files in the root directory and access them via `https://localhost`