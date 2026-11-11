VENV    := .venv
PYTHON  := $(VENV)/bin/python
CONFIG  ?= config.json
MAIN    := pac-man.py
MAZEGEN ?= mazegenerator-2.1.0-py3-none-any.whl

.PHONY: install run debug clean lint lint-strict test

$(VENV):
	@if command -v uv >/dev/null 2>&1; then \
		uv venv $(VENV); \
	else \
		python3 -m venv $(VENV); \
	fi

install: $(VENV)
	@if command -v uv >/dev/null 2>&1; then \
		PIP="uv pip install --python $(PYTHON)"; \
	else \
		PIP="$(PYTHON) -m pip install"; \
	fi; \
	$$PIP -r requirements-dev.txt && \
	if [ -f "$(MAZEGEN)" ]; then \
		$$PIP "$(MAZEGEN)"; \
	else \
		echo "WARNING: $(MAZEGEN) not found. Place the assigned" \
			"A-Maze-ing wheel at the repo root (or run" \
			"'make install MAZEGEN=path/to/file.whl')."; \
	fi

run:
	$(PYTHON) $(MAIN) $(CONFIG)

debug:
	$(PYTHON) -m pdb $(MAIN) $(CONFIG)

clean:
	find . -path ./$(VENV) -prune -o -type d -name __pycache__ -exec rm -rf {} +
	rm -rf .mypy_cache .pytest_cache build dist

lint:
	$(PYTHON) -m flake8 .
	$(PYTHON) -m mypy . --warn-return-any --warn-unused-ignores \
		--ignore-missing-imports --disallow-untyped-defs --check-untyped-defs

lint-strict:
	$(PYTHON) -m flake8 .
	$(PYTHON) -m mypy . --strict

test:
	$(PYTHON) -m pytest tests
