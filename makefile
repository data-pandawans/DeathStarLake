.PHONY: setup-local
setup-local:
	@echo "Starting setup for local environment"
	@python3 -m venv env
	@source ./env/bin/activate
	@echo "Installing libs"
	@make install-requirements
	@sleep 2
	@echo "All setup configured"

.PHONY: activate-environment
activate-environment:
	@echo "Activating local environment"
	@source ./env/bin/activate

.PHONY: install-requirements
install-requirements:
	@echo ""
	@echo "Installing packages"
	@echo "=========="
	@python3 -m pip install -r requirements.txt