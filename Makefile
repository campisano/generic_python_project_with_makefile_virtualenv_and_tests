PYTHON=python3
PIP=pip3

PKG_FOLDER=app
TEST_FOLDER=tests
ENV_FOLDER=env

.PHONY: all
all: check test

.PHONY: check
check: pycheck
	@echo " -> Checking code..."
	@bash -c "source $(ENV_FOLDER)/bin/activate; \
	find $(PKG_FOLDER) $(TEST_FOLDER) -name '*.py' | xargs pylint --reports=n --disable=C; \
	deactivate"

.PHONY: test
test: clean pytest
	@echo " -> Preparing virtual env and running tests..."
	@bash -c "source $(ENV_FOLDER)/bin/activate; \
	pytest $(TEST_FOLDER); \
	deactivate"

.PHONY: clean
clean:
	@echo " -> Cleaning code..."
	@find . -name '*.pyc' -delete

pyenv: $(ENV_FOLDER)/bin/$(PYTHON)
$(ENV_FOLDER)/bin/$(PYTHON):
	@echo " -> Preparing virtual env folder..."
	@virtualenv --no-site-packages --always-copy --python $(PYTHON) $(ENV_FOLDER)

pydeps: pyenv requirements.txt $(ENV_FOLDER)/pydeps
$(ENV_FOLDER)/pydeps:
	@echo " -> Installing environment dependencies..."
	@bash -c "source $(ENV_FOLDER)/bin/activate; \
	$(PIP) install --quiet -r requirements.txt; \
	deactivate"
	@touch $(ENV_FOLDER)/pydeps

pycheck: pytest $(ENV_FOLDER)/bin/pylint
$(ENV_FOLDER)/bin/pylint:
	@echo " -> Installing pylint..."
	@bash -c "source $(ENV_FOLDER)/bin/activate; \
	$(PIP) install --quiet pylint; \
	deactivate"

pytest: pydeps $(ENV_FOLDER)/bin/pytest
$(ENV_FOLDER)/bin/pytest:
	@echo " -> Installing pytest..."
	@bash -c "source $(ENV_FOLDER)/bin/activate; \
	$(PIP) install --quiet pytest; \
	deactivate"

.PHONY: regen_reqs
regen_reqs:
	@echo " -> Forcing generation of new requirements.txt..."
	@bash -c "source $(ENV_FOLDER)/bin/activate; \
	$(PIP) freeze > requirements.txt; \
	deactivate"
