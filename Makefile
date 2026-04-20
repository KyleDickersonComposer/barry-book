# Makefile for building The Barry Book
# Builds LaTeX document and places all output in bin/

# Absolute repo root so lilypond-book → lilypond -I survives any cwd (e.g. CI Docker).
BOOK_ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

# Same image as CI (.github/workflows/main.yml).
DOCKER_LILYPOND_IMAGE ?= kyledickersoncomposer/docker-lilypond:latest

MAIN = main
OUTPUT_DIR = bin
LILYPOND_BOOK = lilypond-book

# LaTeX compiler
LATEX = pdflatex
BIBTEX = biber
MAKEGLOSSARIES = makeglossaries
LATEX_FLAGS = -output-directory=$(OUTPUT_DIR) -interaction=nonstopmode

.PHONY: clean docx open pdf require-pandoc

pdf:
	docker run --rm --platform linux/amd64 --pull missing \
		-v "$(BOOK_ROOT):/workdir" -w /workdir \
		$(DOCKER_LILYPOND_IMAGE) \
		sh -lc '\
			set -eu; \
			cleanup() { \
				find . -maxdepth 1 -name "tmp*" -type f -delete 2>/dev/null || true; \
				find . -maxdepth 1 -name "*.tmp" -type f -delete 2>/dev/null || true; \
			}; \
			trap cleanup EXIT; \
			mkdir -p $(OUTPUT_DIR); \
			echo "Processing $(MAIN).lytex with lilypond-book..."; \
			$(LILYPOND_BOOK) --pdf --output=$(OUTPUT_DIR) -I /workdir -I /workdir/source -I /workdir/source/lilyjazz-styles $(MAIN).lytex; \
			cp references.bib $(OUTPUT_DIR)/references.bib; \
			echo "Building $(MAIN).pdf..."; \
			$(LATEX) $(LATEX_FLAGS) $(OUTPUT_DIR)/$(MAIN).tex; \
			cd $(OUTPUT_DIR); \
			$(BIBTEX) $(MAIN); \
			$(MAKEGLOSSARIES) $(MAIN); \
			cd /workdir; \
			$(LATEX) $(LATEX_FLAGS) $(OUTPUT_DIR)/$(MAIN).tex; \
			$(LATEX) $(LATEX_FLAGS) $(OUTPUT_DIR)/$(MAIN).tex; \
			echo "Build complete! Output: $(OUTPUT_DIR)/$(MAIN).pdf"'

require-pandoc:
	@command -v pandoc >/dev/null 2>&1 || { \
		echo "pandoc is required for DOCX export."; \
		echo "Install it with: brew install pandoc"; \
		exit 1; \
	}

docx: pdf require-pandoc
	@echo "Exporting $(OUTPUT_DIR)/$(MAIN).docx for Google Docs spell checking..."
	cd $(OUTPUT_DIR) && pandoc \
		--standalone \
		--from=latex \
		--to=docx \
		--resource-path=.:.. \
		--metadata=title:"The Barry Book" \
		--output=$(MAIN).docx \
		$(MAIN).tex
	@echo "DOCX export complete! Output: $(OUTPUT_DIR)/$(MAIN).docx"

open:
	open $(OUTPUT_DIR)/$(MAIN).pdf

clean:
	@echo "Cleaning build artifacts..."
	@rm -rf $(OUTPUT_DIR)
	@find . -maxdepth 1 -name "tmp*" -type f -delete 2>/dev/null || true
	@find . -maxdepth 1 -name "*.tmp" -type f -delete 2>/dev/null || true
	@echo "Clean complete!"
