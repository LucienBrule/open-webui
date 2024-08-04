# Makefile for Open WebUI

# Include .env file if it exists
-include .env

# Export all variables from .env
$(foreach var,$(shell sed -ne 's/^\([^#=]*\)=.*/\1/p' .env),$(eval export $(var)))

# Include other Makefile modules
define include_module
	$(eval include $(1))
endef

$(foreach module,$(wildcard ops/makefiles/*.mk),$(eval $(call include_module,$(module))))

# Function to read environment variables
define read_env
$(eval $(shell sed -e 's/[[:space:]]*#.*$$//g;s/^[[:space:]]*//g;s/[[:space:]]*$$//g' .env | sed -ne '/^[^#]/p' | sed -e "s/'/'\\\\''/g" | sed -e "s/\(.*\)=\(.*\)/\1='\2'/g" | sed -e 's/^/export /'))
endef

# Default target
.PHONY: all
all: help

# Help target
.PHONY: help
help:
	@echo "Open WebUI Development Environment"
	@echo "=================================="
	@echo ""
	@echo "Available modules:"
	@for file in ops/makefiles/*.mk; do \
		module_name=$$(basename $$file .mk); \
		echo "  $$module_name"; \
	done
	@echo ""
	@echo "For more information on a specific module, run 'make <module>-help'"
	@echo "For example: 'make docker-help' or 'make backend-help'"
	@echo ""
	@echo "Common Commands:"
	@echo "  make setup-dev     - Set up the development environment"
	@echo "  make build         - Build all services"
	@echo "  make test          - Run all tests"
	@echo "  make run           - Run the application"
	@echo ""

# Generate specific help targets for each module
$(foreach module,$(wildcard ops/makefiles/*.mk),\
	$(eval MODULE_NAME := $(basename $(notdir $(module))))\
	$(if $(filter $(MODULE_NAME)-help,$(MAKECMDGOALS)),\
		$(if $(findstring $(MODULE_NAME)-help:,$(shell cat $(module))),\
			,\
			$(eval .PHONY: $(MODULE_NAME)-help)\
			$(eval $(MODULE_NAME)-help:)\
			$(eval    $(MODULE_NAME)-help: ; @$(MAKE) -f $(module) help)\
		)\
	)\
)

# Top-level targets
.PHONY: setup-dev build test run show-env

setup-dev:
	@echo "Setting up development environment..."
	@$(MAKE) -f ops/makefiles/backend.mk backend-setup
	@$(MAKE) -f ops/makefiles/frontend.mk frontend-setup

build:
	@echo "Building all services..."
	@$(MAKE) -f ops/makefiles/backend.mk backend-build
	@$(MAKE) -f ops/makefiles/frontend.mk frontend-build

test:
	@echo "Running all tests..."
	@$(MAKE) -f ops/makefiles/backend.mk backend-test
	@$(MAKE) -f ops/makefiles/frontend.mk frontend-test

run:
	@echo "Running the application..."
	@$(MAKE) -f ops/makefiles/docker.mk docker-dev-up

show-env:
	@echo "Current environment settings:"
	@echo "PROJECT_ROOT: $(PROJECT_ROOT)"
	# Add other relevant environment variables

# Debug target
.PHONY: debug
debug:
	@echo "PROJECT_ROOT: $(PROJECT_ROOT)"
	@echo "Environment variables:"
	@env | sort

# Export environment variables for all targets
include .env
export