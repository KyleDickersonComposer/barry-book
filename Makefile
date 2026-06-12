BOOK_ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
DOCKER_LILYPOND_IMAGE ?= kyledickersoncomposer/docker-lilypond:latest
MAIN = main

.PHONY: run pdf open clean docx require-pandoc

run:
	make pdf
	make open

pdf:
	@mkdir -p bin/tmp-ly
	docker build -t barry-book .
	docker run --rm \
		-v "$(BOOK_ROOT)/bin:/out" \
		-v "$(BOOK_ROOT)/bin/tmp-ly:/workdir/bin/tmp-ly" \
		barry-book cp bin/main.pdf /out/main.pdf
	
require-pandoc:
	@command -v pandoc >/dev/null 2>&1 || { \
		echo "pandoc is required for DOCX export."; \
		echo "Install it with: brew install pandoc"; \
		exit 1; \
	}

docx: pdf require-pandoc
	@echo "Exporting bin/$(MAIN).docx for Google Docs spell checking..."
	cd bin && pandoc \
		--standalone \
		--from=latex \
		--to=docx \
		--resource-path=.:.. \
		--metadata=title:"The Barry Book" \
		--output=$(MAIN).docx \
		../$(MAIN).tex
	@echo "DOCX export complete! Output: bin/$(MAIN).docx"
open:
	open bin/$(MAIN).pdf
clean:
	rm -rf bin
