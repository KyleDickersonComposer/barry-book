# Makefile for building The Barry Book
# Builds LaTeX document and places all output in bin/

# Absolute repo root so lilypond-book → lilypond -I survives any cwd (e.g. CI Docker).
BOOK_ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

MAIN = main
OUTPUT_DIR = bin
LILYPOND_BOOK = lilypond-book
LILYPOND = lilypond
LILY_FLAGS = -I "$(BOOK_ROOT)" -I "$(BOOK_ROOT)/source/lilyjazz-styles"

# LaTeX compiler
LATEX = pdflatex
BIBTEX = biber
LATEX_FLAGS = -output-directory=$(OUTPUT_DIR) -interaction=nonstopmode

.PHONY: all clean build force-rebuild

all: pdf

.PHONY: force-rebuild

pdf: force-rebuild
	@mkdir -p $(OUTPUT_DIR)
	@echo "Processing $(MAIN).lytex with lilypond-book..."
	@$(LILYPOND_BOOK) --pdf --output=$(OUTPUT_DIR) -I "$(BOOK_ROOT)" -I "$(BOOK_ROOT)/source/lilyjazz-styles" $(MAIN).lytex
	@echo "Building $(MAIN).pdf..."
	@$(LATEX) $(LATEX_FLAGS) $(OUTPUT_DIR)/$(MAIN).tex
	@cd $(OUTPUT_DIR) && $(BIBTEX) $(MAIN)
	@$(LATEX) $(LATEX_FLAGS) $(OUTPUT_DIR)/$(MAIN).tex
	@$(LATEX) $(LATEX_FLAGS) $(OUTPUT_DIR)/$(MAIN).tex
	@find . -maxdepth 1 -name "tmp*" -type f -delete 2>/dev/null || true
	@find . -maxdepth 1 -name "*.tmp" -type f -delete 2>/dev/null || true
	@echo "Build complete! Output: $(OUTPUT_DIR)/$(MAIN).pdf"
	@if command -v open > /dev/null 2>&1; then open $(OUTPUT_DIR)/$(MAIN).pdf; fi

clean:
	@echo "Cleaning build artifacts..."
	@rm -rf $(OUTPUT_DIR)
	@find . -maxdepth 1 -name "tmp*" -type f -delete 2>/dev/null || true
	@find . -maxdepth 1 -name "*.tmp" -type f -delete 2>/dev/null || true
	@echo "Clean complete!"

build: clean pdf
