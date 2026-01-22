.PHONY: clean pull pre_commit build_runner env start detect_branch_duplicate_code" 

help: ## Show commands that can be use by make
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "  %-30s %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo ""
	@echo "Run 'make [target] --help' to get more information about a specific target."

changes_pull:
	@echo "Pulling latest changes"
	git pull

## Default commands
build_runner: ## Shortcut for build_runner
	@echo "Generating files with build_runner"
	dart run build_runner build --delete-conflicting-outputs

start_web: ## Start App in dev mode
	flutter run -d chrome --web-port=8080

clean: ## Cleaning environment
	@echo "Cleaning up..."
	flutter clean

start_env: ## Starting flutter app with the specified .env config. Use: make start_env env=<envName>, where envName == .env.<envName>. This will OVERWRITE your .env file
ifeq (,$(wildcard ./.env.${env}))
	$(error Config .env.${env} does not exist!)
else
	@cp .env.${env} .env
	@echo .env is overwritten with .env.${env}
	flutter run
endif

pull: changes_pull deps_get build_runner ## Pulling latest changes with dependencies

deps_get: ## Get dependencies 
	@echo "Getting dependencies"
	flutter pub get
	flutter pub outdated --no-show-all

pre_commit: ## Format code & Analyze & Run tests
	dart format . && flutter analyze && flutter test


## Code quality checks
GIT_CHANGED_FILES := $(shell git diff --name-only main...) ## Command to identify changed files between main branch and current working directory using git
FILTERED_FILES := $(shell git ls-files $(GIT_CHANGED_FILES) | grep -v '^D' 2>/dev/null) ## Filter out deleted files from the changed files

ALL_FILES := $(shell git ls-files)
UNCHANGED_FILES := $(filter-out $(FILTERED_FILES),$(ALL_FILES))

#### Test coverage
COVERAGE_FILE := coverage/lcov.info
REPORT_DIR := coverage/html

project_test_coverage: ## Generate project coverage report
	flutter test --coverage 
	remove_from_coverage -f $(COVERAGE_FILE) -r \.g\.dart$ 
	genhtml $(COVERAGE_FILE) -o $(REPORT_DIR)

branch_test_coverage: ## Generate coverage report based on the changes made in the current branch
	flutter test --coverage
	remove_from_coverage -f $(COVERAGE_FILE) -r \.g\.dart$ $(foreach file,$(UNCHANGED_FILES), -r $(file))
	genhtml $(COVERAGE_FILE) -o $(REPORT_DIR)

#### Duplicate code
SOURCE_DIR := lib
REPORT_FILE := duplicate_code_report
IGNORE_FILES := "**/*.freezed.dart,**/*g.dart,lib/config/**,**/*.json,test/**"

detect_project_duplicate_code: ## Generate project duplicate code report
	jscpd $(SOURCE_DIR) --reporters html --ignore $(IGNORE_FILES) --output $(REPORT_FILE) --min-lines 10

detect_branch_duplicate_code: ## Generate branch duplicate code report based on the changed files in the current branch
	jscpd $(FILTERED_FILES) --reporters html --ignore $(IGNORE_FILES) --output $(REPORT_FILE) --min-lines 10