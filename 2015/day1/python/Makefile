VENV_PATH = ../../../.venv
VENV_PYTHON = $(VENV_PATH)/bin/python3
VENV_PYTEST = $(VENV_PATH)/bin/pytest
VENV_PIP = $(VENV_PATH)/bin/pip

all: $(VENV_PATH)
	@$(VENV_PYTHON) day1.py

test: $(VENV_PATH)
	@$(VENV_PYTEST) day1.py

$(VENV_PATH):
	python3 -m venv $(VENV_PATH)
	@$(VENV_PIP) install pytest

