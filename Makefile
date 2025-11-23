# Makefile for building The Barry Book
# Builds LaTeX document and places all output in bin/

MAIN = main
OUTPUT_DIR = bin
LILYPOND_BOOK = lilypond-book
LILYPOND = lilypond
LILY_FLAGS = -I source/lilyjazz-styles

# LaTeX compiler
LATEX = pdflatex
BIBTEX = biber
LATEX_FLAGS = -output-directory=$(OUTPUT_DIR) -interaction=nonstopmode

.PHONY: all clean build force-rebuild

all: pdf

.PHONY: force-rebuild

pdf: force-rebuild
	@echo "Processing $(MAIN).lytex with lilypond-book..."
	@mkdir -p $(OUTPUT_DIR)
	@$(LILYPOND_BOOK) --pdf --output=$(OUTPUT_DIR) $(MAIN).lytex
	@echo "Building $(MAIN).pdf..."
	@$(LATEX) $(LATEX_FLAGS) -output-directory=$(OUTPUT_DIR) $(OUTPUT_DIR)/$(MAIN).tex || true
	@cd $(OUTPUT_DIR) && $(BIBTEX) $(MAIN) || true
	@$(LATEX) $(LATEX_FLAGS) -output-directory=$(OUTPUT_DIR) $(OUTPUT_DIR)/$(MAIN).tex || true
	@$(LATEX) $(LATEX_FLAGS) -output-directory=$(OUTPUT_DIR) $(OUTPUT_DIR)/$(MAIN).tex || true
	@find . -maxdepth 1 -name "tmp*" -type f -delete 2>/dev/null || true
	@find . -maxdepth 1 -name "*.tmp" -type f -delete 2>/dev/null || true
	@echo "Build complete! Output: $(OUTPUT_DIR)/$(MAIN).pdf"
	@open $(OUTPUT_DIR)/$(MAIN).pdf

clean:
	@echo "Cleaning build artifacts..."
	@rm -rf $(OUTPUT_DIR)
	@find . -maxdepth 1 -name "tmp*" -type f -delete 2>/dev/null || true
	@find . -maxdepth 1 -name "*.tmp" -type f -delete 2>/dev/null || true
	@echo "Clean complete!"

build: clean pdf

