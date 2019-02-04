PYTHON=python3
PIP=pip3
PYTEST=pytest
PYLINT=pylint

PKG_FOLDER=app
TEST_FOLDER=tests

all: check test

check: pycheck
	@echo " -> Checking code..."
	@bash -c "source env/bin/activate; \
	find $(PKG_FOLDER) $(TEST_FOLDER) -name '*.py' | xargs $(PYLINT) --reports=n --disable=C; \
	deactivate"

test: clean pytest
	@echo " -> Preparing virtual env and running tests..."
	@bash -c "source env/bin/activate; \
	$(PYTEST) $(TEST_FOLDER); \
	deactivate"

.PHONY: clean
clean:
	@echo " -> Cleaning code..."
	@find . -name '*.pyc' -delete

pyenv: env/bin/$(PYTHON)
env/bin/$(PYTHON):
	@echo " -> Preparing virtual env folder..."
	@virtualenv --no-site-packages --always-copy --python $(PYTHON) env

pydeps: pyenv requirements.txt env/pydeps
env/pydeps:
	@echo " -> Installing environment dependencies..."
	@bash -c "source env/bin/activate; \
	$(PIP) install --quiet -r requirements.txt; \
	deactivate"
	@touch env/pydeps

pycheck: pytest env/bin/$(PYLINT)
env/bin/$(PYLINT):
	@echo " -> Installing $(PYLINT)..."
	@bash -c "source env/bin/activate; \
	$(PIP) install --quiet $(PYLINT); \
	deactivate"

pytest: pydeps env/bin/$(PYTEST)
env/bin/$(PYTEST):
	@echo " -> Installing $(PYTEST)..."
	@bash -c "source env/bin/activate; \
	$(PIP) install --quiet $(PYTEST); \
	deactivate"

regen_reqs:
	@echo " -> Forcing generation of new requirements.txt..."
	@bash  -c "source env/bin/activate; \
	$(PIP) freeze > requirements.txt; \
	deactivate"
