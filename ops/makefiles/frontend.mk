# ops/makefiles/frontend.mk

.PHONY: frontend-setup frontend-build frontend-test frontend-run frontend-help

frontend-setup:
	@echo "Setting up frontend environment..."
	cd open-webui-frontend && npm install

frontend-build:
	@echo "Building frontend..."
	cd open-webui-frontend && npm run build

frontend-test:
	@echo "Running frontend tests..."
	cd open-webui-frontend && npm test

frontend-run:
	@echo "Running frontend..."
	cd open-webui-frontend && npm run dev

frontend-help:
	@echo "Frontend module commands:"
	@echo "  frontend-setup  - Set up the frontend environment"
	@echo "  frontend-build  - Build the frontend"
	@echo "  frontend-test   - Run frontend tests"
	@echo "  frontend-run    - Run the frontend development server"
