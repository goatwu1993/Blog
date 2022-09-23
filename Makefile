GIT = $(shell which git)
GIT_BRANCH = $(shell git rev-parse --abbrev-ref HEAD)
GIT_COMMIT = $(shell git rev-parse --short HEAD)
GIT_COMMIT_TIME = $(shell git log -n 1 --pretty=format:"%ad" --date=iso)
PIP = $(shell which pip)

.PHONY: help
help: ## Show help messages
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-40s\033[0m %s\n", $$1, $$2}'

.PHONY: install-ci
install-ci: install-ci-pkgs install-hooks ## Install ci tools

.PHONY: reinstall-ci
reinstall-ci: uninstall-ci install-ci ## Reinstall ci tools

.PHONY: install-ci-pkgs
install-ci-pkgs: ## Install ci packages
	# Install ci packages
	@$(PIP) install -q pre-commit

.PHONY: install-hooks
install-hooks: .pre-commit-config.yaml install-ci-pkgs ## Install packages for git hooks
	# Install git hooks
	@pre-commit install -c $< -t pre-commit -t commit-msg -t pre-push 2>&1 >/dev/null

.PHONY: uninstall-hooks
uninstall-hooks: ## Uninstall hooks
	# Remove all hooks
	@pre-commit uninstall -t pre-commit -t commit-msg -t pre-push
	@pre-commit gc

.PHONY: uninstall-ci
uninstall-ci: uninstall-hooks uninstall-commit-message-template ## Uninstall ci tools
	# Uninstall all hooks

.PHONY: format
format: install-ci ## Format code
	# Foramtting
	@pre-commit run --all-files
