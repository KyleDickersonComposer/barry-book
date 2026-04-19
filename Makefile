# Makefile for building The Barry Book
# Builds LaTeX document and places all output in bin/

# Absolute repo root so lilypond-book → lilypond -I survives any cwd (e.g. CI Docker).
BOOK_ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

# Same image as CI (.github/workflows/main.yml). pdf-docker uses --pull never so each
# run is offline: the image stays on disk until you `make docker-pull-lilypond` or delete
# it. (Avoid `docker system prune -a` unless you mean to drop cached images.)
DOCKER_LILYPOND_IMAGE ?= kyledickersoncomposer/docker-lilypond:latest
# Optional: thin local tag from ./Dockerfile (make docker-book-image).
DOCKER_BOOK_IMAGE ?= barry-book

MAIN = main
OUTPUT_DIR = bin
LILYPOND_BOOK = lilypond-book
LILYPOND = lilypond
LILY_FLAGS = -I "$(BOOK_ROOT)" -I "$(BOOK_ROOT)/source" -I "$(BOOK_ROOT)/source/lilyjazz-styles"

# LaTeX compiler
LATEX = pdflatex
BIBTEX = biber
MAKEGLOSSARIES = makeglossaries
LATEX_FLAGS = -output-directory=$(OUTPUT_DIR) -interaction=nonstopmode

.PHONY: all clean build force-rebuild pdf-docker docker-book-image docker-pull-lilypond

all: pdf

.PHONY: force-rebuild

# Optional: tag ./Dockerfile (tiny layer on top of DOCKER_LILYPOND_IMAGE; same blobs, no extra gigabytes).
docker-book-image:
	docker build --platform linux/amd64 -t $(DOCKER_BOOK_IMAGE) -f "$(BOOK_ROOT)/Dockerfile" "$(BOOK_ROOT)"

# Refresh base image when CI / Hub updated latest (otherwise Docker keeps using local cache).
docker-pull-lilypond:
	docker pull --platform linux/amd64 $(DOCKER_LILYPOND_IMAGE)

# Build PDF in container. First time (or after prune): `make docker-pull-lilypond` once.
pdf-docker:
	docker run --rm --platform linux/amd64 --pull never \
		-v "$(BOOK_ROOT):/workdir" -w /workdir \
		$(DOCKER_LILYPOND_IMAGE) \
		make pdf
	@if command -v open > /dev/null 2>&1; then open "$(BOOK_ROOT)/$(OUTPUT_DIR)/$(MAIN).pdf"; fi

pdf: force-rebuild
	@mkdir -p $(OUTPUT_DIR)
	@echo "Processing $(MAIN).lytex with lilypond-book..."
	@$(LILYPOND_BOOK) --pdf --output=$(OUTPUT_DIR) -I "$(BOOK_ROOT)" -I "$(BOOK_ROOT)/source" -I "$(BOOK_ROOT)/source/lilyjazz-styles" $(MAIN).lytex
	@cp "$(BOOK_ROOT)/references.bib" "$(OUTPUT_DIR)/references.bib"
	@echo "Building $(MAIN).pdf..."
	@$(LATEX) $(LATEX_FLAGS) $(OUTPUT_DIR)/$(MAIN).tex
	@cd $(OUTPUT_DIR) && $(BIBTEX) $(MAIN)
	@cd $(OUTPUT_DIR) && $(MAKEGLOSSARIES) $(MAIN)
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
