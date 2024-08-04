# ops/makefiles/backend.mk

.PHONY: backend-setup backend-build backend-test backend-run backend-help

backend-setup:
	@echo "Setting up backend environment..."
	cd open-webui-backend && poetry install

backend-build:
	@echo "Building backend..."
	cd open-webui-backend && poetry build

backend-test:
	@echo "Running backend tests..."
	cd open-webui-backend && poetry run pytest

backend-run:
	@echo "Running backend..."
	cd open-webui-backend && poetry run uvicorn open_webui.main:app --reload

backend-help:
	@echo "Backend module commands:"
	@echo "  backend-setup  - Set up the backend environment"
	@echo "  backend-build  - Build the backend"
	@echo "  backend-test   - Run backend tests"
	@echo "  backend-run    - Run the backend server"
