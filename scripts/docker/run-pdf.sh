#!/usr/bin/env bash
# Full PDF build inside Docker (/workdir). Invoked by Makefile `make pdf`.

set -euo pipefail
cd /workdir

: "${MAIN:=main}"
: "${OUTPUT_DIR:=bin}"
: "${LOG_DIR:=${OUTPUT_DIR}/build-logs}"
: "${LILYPOND_BOOK:=lilypond-book}"
: "${LILYPOND_FLAGS:=-dwarning-as-error}"
: "${LILYBOOK_LILY_LOGLEVEL:=WARNING}"
: "${LATEX:=pdflatex}"
: "${BIBTEX:=biber}"
: "${MAKEGLOSSARIES:=makeglossaries}"
: "${LATEX_FLAGS:=-output-directory=${OUTPUT_DIR} -interaction=nonstopmode}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib.sh
source "${SCRIPT_DIR}/lib.sh"

on_exit() {
	local status=$?
	if [[ "$status" -ne 0 ]]; then
		summarize_failure
	fi
	cleanup
	exit "$status"
}
trap on_exit EXIT

mkdir -p "${OUTPUT_DIR}" "${LOG_DIR}"

echo ""
echo "================ lilypond-book (snippets) ================"
# shellcheck disable=SC2086
"${LILYPOND_BOOK}" --pdf --lily-loglevel="${LILYBOOK_LILY_LOGLEVEL}" \
	--process="lilypond ${LILYPOND_FLAGS}" \
	--output="${OUTPUT_DIR}" \
	-I /workdir -I /workdir/source -I /workdir/source/lilyjazz-styles \
	"${MAIN}.tex" 2>&1 | tee "${LOG_DIR}/lilypond-book.log"

echo "================ LaTeX / BibTeX / glossaries ================="
cp references.bib "${OUTPUT_DIR}/references.bib"
echo "Building ${MAIN}.pdf (pdflatex pass 1)..."
run_pdflatex_pass 1
( cd "${OUTPUT_DIR}" && "${BIBTEX}" "${MAIN}" ) >"/workdir/${LOG_DIR}/biber.log" 2>&1
( cd "${OUTPUT_DIR}" && "${MAKEGLOSSARIES}" "${MAIN}" ) >"/workdir/${LOG_DIR}/makeglossaries.log" 2>&1
cd /workdir
run_pdflatex_pass 2
run_pdflatex_pass 3

echo "Build complete! Output: ${OUTPUT_DIR}/${MAIN}.pdf"
