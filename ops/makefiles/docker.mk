# ops/makefiles/docker.mk

.PHONY: docker-build docker-dev-up docker-dev-down docker-help

docker-build:
	@echo "Building Docker images..."
	docker-compose build

docker-dev-up:
	@echo "Starting development environment..."
	docker-compose up -d

docker-dev-down:
	@echo "Stopping development environment..."
	docker-compose down

docker-help:
	@echo "Docker module commands:"
	@echo "  docker-build    - Build Docker images"
	@echo "  docker-dev-up   - Start the development environment"
	@echo "  docker-dev-down - Stop the development environment"
