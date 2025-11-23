# Makefile for building The Barry Book
# Builds LaTeX document and places all output in bin/

MAIN = main
OUTPUT_DIR = bin

# LaTeX compiler
LATEX = pdflatex
BIBTEX = biber
LATEX_FLAGS = -output-directory=$(OUTPUT_DIR) -interaction=nonstopmode

.PHONY: all clean build pdf

all: pdf

pdf: $(OUTPUT_DIR)/$(MAIN).pdf

$(OUTPUT_DIR)/$(MAIN).pdf: $(MAIN).lytex
	@echo "Building $(MAIN).pdf..."
	@mkdir -p $(OUTPUT_DIR)
	@$(LATEX) $(LATEX_FLAGS) $(MAIN).lytex || true
	@cd $(OUTPUT_DIR) && $(BIBTEX) $(MAIN) || true
	@$(LATEX) $(LATEX_FLAGS) $(MAIN).lytex || true
	@$(LATEX) $(LATEX_FLAGS) $(MAIN).lytex || true
	@echo "Build complete! Output: $(OUTPUT_DIR)/$(MAIN).pdf"

clean:
	@echo "Cleaning build artifacts..."
	@rm -rf $(OUTPUT_DIR)
	@echo "Clean complete!"

build: clean pdf

