# Task runner for common project commands. All Flutter/Dart calls go through
# fvm so everyone uses the pinned SDK version.
#
# Usage: make <target>   (run `make` or `make help` to list targets)

.PHONY: help get gen watch analyze format test coverage run-dev run-prod clean

help: ## List available targets
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'

get: ## Install dependencies
	fvm flutter pub get

gen: ## Run code generation (freezed, retrofit, injectable, ...)
	fvm dart run build_runner build

watch: ## Run code generation continuously on file changes
	fvm dart run build_runner watch

analyze: ## Run static analysis
	fvm dart analyze

format: ## Format the codebase
	fvm dart format lib test

test: ## Run all tests
	fvm flutter test

coverage: ## Run tests with coverage report
	fvm flutter test --coverage

run-dev: ## Run the app with the dev flavor
	fvm flutter run --flavor dev -t lib/main_dev.dart

run-prod: ## Run the app with the prod flavor
	fvm flutter run --flavor prod -t lib/main_prod.dart

clean: ## Clean build artifacts and reinstall dependencies
	fvm flutter clean
	fvm flutter pub get
