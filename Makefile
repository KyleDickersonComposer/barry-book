# Makefile for building The Barry Book
# Builds LaTeX document and places all output in bin/

# Absolute repo root so lilypond-book → lilypond -I survives any cwd (e.g. CI Docker).
BOOK_ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

# Same image as CI (.github/workflows/main.yml).
DOCKER_LILYPOND_IMAGE ?= kyledickersoncomposer/docker-lilypond:latest

MAIN = main
OUTPUT_DIR = bin
LILYPOND_BOOK = lilypond-book

# Promote LilyPond warnings (including bar checks: "warning: barcheck failed") to fatal errors.
# Without this, barcheck issues still produce a PDF and exit 0.
LILYPOND_FLAGS ?= -dwarning-as-error

# lilypond-book hides each snippet’s LilyPond stderr unless this is set (default was none).
LILYBOOK_LILY_LOGLEVEL ?= WARNING

# Second pass in make lily-check: parallel lilypond on each extracted lily-*.ly.
LILY_CHECK_JOBS ?= 8

# LaTeX compiler
LATEX = pdflatex
BIBTEX = biber
MAKEGLOSSARIES = makeglossaries
LATEX_FLAGS = -output-directory=$(OUTPUT_DIR) -interaction=nonstopmode

docker-pull:
	docker pull --platform linux/amd64 $(DOCKER_LILYPOND_IMAGE)

# Environment passed into scripts/docker/run-*.sh (see those files for the full pipeline).
DOCKER_RUN = docker run --rm --platform linux/amd64 --pull missing \
	-v "$(BOOK_ROOT):/workdir" -w /workdir
DOCKER_ENV_COMMON = \
	-e MAIN=$(MAIN) \
	-e OUTPUT_DIR=$(OUTPUT_DIR) \
	-e LILYPOND_BOOK=$(LILYPOND_BOOK) \
	-e LILYPOND_FLAGS="$(LILYPOND_FLAGS)" \
	-e LILYBOOK_LILY_LOGLEVEL=$(LILYBOOK_LILY_LOGLEVEL) \
	-e LATEX=$(LATEX) \
	-e BIBTEX=$(BIBTEX) \
	-e MAKEGLOSSARIES=$(MAKEGLOSSARIES) \
	-e LATEX_FLAGS="$(LATEX_FLAGS)"

.PHONY: _lily_snippets check-ly clean docx docker-pull lily lily-check open pdf require-pandoc

pdf:
	$(DOCKER_RUN) $(DOCKER_ENV_COMMON) \
		$(DOCKER_LILYPOND_IMAGE) \
		bash /workdir/scripts/docker/run-pdf.sh

# Strict LilyPond pass: clears cached lily-*.ly (so lilypond-book cannot skip stale snippets), then
# lilypond-book, then runs lilypond again on each extracted snippet in parallel (full stderr per file).
check-ly:
	@$(MAKE) lily-check

lily-check:
	@$(MAKE) _lily_snippets LILYBOOK_LOGLEVEL=PROGRESS LILY_SNIPPET_STRICT=1

# Verbose snippet run (maps generated files to .lytex in the log).
lily:
	@$(MAKE) _lily_snippets LILYBOOK_LOGLEVEL=DEBUG

# Internal: do not call directly unless LILYBOOK_LOGLEVEL is set (PROGRESS or DEBUG).
# LILY_SNIPPET_STRICT=1 (make lily-check): delete cached lily-*.ly, then per-snippet lilypond re-run.
_lily_snippets: LILYBOOK_LOGLEVEL ?= PROGRESS
_lily_snippets: LILY_SNIPPET_STRICT ?= 0
_lily_snippets:
	$(DOCKER_RUN) $(DOCKER_ENV_COMMON) \
		-e LILYBOOK_LOGLEVEL=$(LILYBOOK_LOGLEVEL) \
		-e LILY_SNIPPET_STRICT=$(LILY_SNIPPET_STRICT) \
		-e LILY_CHECK_JOBS=$(LILY_CHECK_JOBS) \
		$(DOCKER_LILYPOND_IMAGE) \
		bash /workdir/scripts/docker/run-lily-snippets.sh

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
	@find . -maxdepth 1 -name "tmp*" -type f -delete 2>/dev/null
	@find . -maxdepth 1 -name "*.tmp" -type f -delete 2>/dev/null
	@echo "Clean complete!"
