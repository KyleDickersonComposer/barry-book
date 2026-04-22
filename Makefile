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
			LOG_DIR="$(OUTPUT_DIR)/build-logs"; \
			cleanup() { \
				find . -maxdepth 1 -name "tmp*" -type f -delete 2>/dev/null || true; \
				find . -maxdepth 1 -name "*.tmp" -type f -delete 2>/dev/null || true; \
			}; \
			summarize_failure() { \
				echo ""; \
				echo "================ FATAL SUMMARY ================"; \
				found=0; \
				for file in "$$LOG_DIR/lilypond-book.log" "$$LOG_DIR/pdflatex-pass1.log" "$$LOG_DIR/biber.log" "$$LOG_DIR/makeglossaries.log" "$$LOG_DIR/pdflatex-pass2.log" "$$LOG_DIR/pdflatex-pass3.log" "$(OUTPUT_DIR)/$(MAIN).log" "$(OUTPUT_DIR)/$(MAIN).blg"; do \
					[ -f "$$file" ] || continue; \
					matches="$$(awk "BEGIN{IGNORECASE=1; ctx=0} /warning:|^! |fatal error|error:|undefined control sequence|emergency stop|ERROR -|unrecognized option|non-zero exit status/ {print NR \":\" \$$0; ctx=2; next} ctx>0 {print NR \":\" \$$0; ctx--;}" "$$file" || true)"; \
					[ -n "$$matches" ] || continue; \
					found=1; \
					echo "-- $$file --"; \
					printf "%s\n" "$$matches"; \
					if [ "$$file" = "$$LOG_DIR/lilypond-book.log" ]; then \
						failing_ref="$$(awk "match(\$$0, /[[:alnum:]_\/.-]*lily-[0-9a-f]+\\.ly:[0-9]+:[0-9]+:/) {print substr(\$$0, RSTART, RLENGTH); exit}" "$$file" || true)"; \
						if [ -n "$$failing_ref" ]; then \
							gen_ly="$$(printf "%s" "$$failing_ref" | sed -E "s/:([0-9]+):([0-9]+):$$//")"; \
							gen_line="$$(printf "%s" "$$failing_ref" | sed -E "s#.*:([0-9]+):([0-9]+):#\\1#")"; \
							stem="$${gen_ly%.ly}"; \
							owner_tex="$$(grep -R -l "$${stem}-systems.tex" "$(OUTPUT_DIR)" 2>/dev/null | head -n 1 || true)"; \
							echo "Likely generated snippet: $(OUTPUT_DIR)/$$gen_ly:$$gen_line"; \
							if [ -n "$$owner_tex" ]; then \
								source_guess="$$(printf "%s" "$$owner_tex" | sed -E "s#^$(OUTPUT_DIR)/##; s#\\.tex$$#.lytex#")"; \
								echo "Likely source file: $$source_guess"; \
							else \
								echo "Likely source file: (unable to map automatically; inspecting source text matches)"; \
								note_line="$$(awk "hit && !seen {print; seen=1; exit} /fatal error: barcheck failed/ {hit=1}" "$$file" | sed -E "s/^[[:space:]]+//; s/[[:space:]]+$$//" || true)"; \
								if [ -n "$$note_line" ]; then \
									source_hits="$$(grep -R -n -F "$$note_line" chapters frontmatter source main.lytex preface.lytex 2>/dev/null | head -n 5 || true)"; \
									if [ -n "$$source_hits" ]; then \
										echo "Source text matches:"; \
										printf "%s\n" "$$source_hits"; \
									fi; \
								fi; \
							fi; \
						fi; \
					fi; \
				done; \
				if [ "$$found" -eq 0 ]; then \
					echo "No fatal diagnostics were extracted from known logs."; \
					echo "Check $(OUTPUT_DIR)/build-logs/ and $(OUTPUT_DIR)/$(MAIN).log for full output."; \
				fi; \
				echo "==============================================="; \
			}; \
			on_exit() { \
				status=$$?; \
				if [ "$$status" -ne 0 ]; then \
					summarize_failure; \
				fi; \
				cleanup; \
				exit "$$status"; \
			}; \
			trap on_exit EXIT; \
			mkdir -p $(OUTPUT_DIR); \
			mkdir -p "$$LOG_DIR"; \
			echo "Processing $(MAIN).lytex with lilypond-book..."; \
			$(LILYPOND_BOOK) --pdf --process="lilypond -dwarning-as-error" --output=$(OUTPUT_DIR) -I /workdir -I /workdir/source -I /workdir/source/lilyjazz-styles $(MAIN).lytex >"$$LOG_DIR/lilypond-book.log" 2>&1; \
			cp references.bib $(OUTPUT_DIR)/references.bib; \
			echo "Building $(MAIN).pdf..."; \
			$(LATEX) $(LATEX_FLAGS) $(OUTPUT_DIR)/$(MAIN).tex >"$$LOG_DIR/pdflatex-pass1.log" 2>&1; \
			( cd $(OUTPUT_DIR) && $(BIBTEX) $(MAIN) ) >"/workdir/$$LOG_DIR/biber.log" 2>&1; \
			( cd $(OUTPUT_DIR) && $(MAKEGLOSSARIES) $(MAIN) ) >"/workdir/$$LOG_DIR/makeglossaries.log" 2>&1; \
			cd /workdir; \
			$(LATEX) $(LATEX_FLAGS) $(OUTPUT_DIR)/$(MAIN).tex >"$$LOG_DIR/pdflatex-pass2.log" 2>&1; \
			$(LATEX) $(LATEX_FLAGS) $(OUTPUT_DIR)/$(MAIN).tex >"$$LOG_DIR/pdflatex-pass3.log" 2>&1; \
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
