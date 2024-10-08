.DEFAULT_GOAL := help

SHELL := /bin/bash

.PHONY: help
help: ## Help
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build: install test ## Launches the complete workflow (install, test)


.PHONY: install
install: ## Install all the dependencies
	@echo "------------------"
	@echo "Installing dependencies"
	@echo "------------------"
	@mvn -B compile
	@echo "All dependencies installed"
	@mvn -Binstall -Dmaven.test.skip=true -DskipTests -pl !testAT -pl !testIT -Dmaven.wagon.http.retryHandler.count=3
	@echo "Repository dependency installed"

.PHONY: test
test: ## Launches testUT without testAT or testIT
	@echo "------------------"
	@echo "Running test"
	@echo "------------------"
	@mvn -B test -pl !testAT -pl !testIT
	@echo "All tests passed"

.PHONY: parallel-test
parallel-test: ## Launches test in Parallel configuration
	@echo "------------------"
	@echo "Running test"
	@echo "------------------"
	@parallel --gnu -a tests.parallel || false
	@echo "All tests passed"

.PHONY: deploy
deploy: ## Deploy the generated artifacts to artifactory
	@echo "------------------"
	@echo "Deploy artifacts"
	@echo "------------------"
	@mvn antrun:run@attach-shaded-jar deploy -Dskip=true -Dmaven.shade.skip=true -Dmaven.main.skip=true -Djacoco.skip=true -Dmaven.javadoc.skip=true -Dmaven.test.skip=true -DskipTests -Dmaven.install.skip=true -Dspring-boot.repackage.skip=true -Ddocker.skip=truemvn antrun:run@attach-shaded-jar deploy -B ${profilesOpt} -Dskip=true -Dmaven.shade.skip=true -Dmaven.main.skip=true -Djacoco.skip=true -Dmaven.javadoc.skip=true -Dmaven.test.skip=true -DskipTests -Dmaven.install.skip=true -Dspring-boot.repackage.skip=true -Ddocker.skip=true -Dmaven.resources.skip=true -DskipAnnotationProcessing=true -DretryFailedDeploymentCount=2 -pl !testAT

.PHONY: docker
docker: ## Build and deploy a docker image to Github Packages
	@echo "------------------"
	@echo "Generate docker"
	@echo "------------------"
	@docker login docker.pkg.github.com --username "${{ github.actor }}" --password "${{ secrets.GITHUB_TOKEN }}"
	@docker build -t docker.pkg.github.com/fjpaniagua/ada_library_java_example/ada_library_java_example:latest . -f ada_library_java_example_step_function-lib/src/main/resources/Dockerfile
	@docker push docker.pkg.github.com/fjpaniagua/ada_library_java_example/ada_library_java_example:latest