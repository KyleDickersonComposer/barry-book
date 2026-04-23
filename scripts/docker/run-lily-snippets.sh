#!/usr/bin/env bash
# LilyPond snippets only (lilypond-book), optional strict second pass. Invoked by `make lily` / `make lily-check`.

set -euo pipefail
cd /workdir

: "${MAIN:=main}"
: "${OUTPUT_DIR:=bin}"
: "${LOG_DIR:=${OUTPUT_DIR}/build-logs}"
: "${LILYPOND_BOOK:=lilypond-book}"
: "${LILYPOND_FLAGS:=-dwarning-as-error}"
: "${LILYBOOK_LILY_LOGLEVEL:=WARNING}"
: "${LILYBOOK_LOGLEVEL:=PROGRESS}"
: "${LILY_SNIPPET_STRICT:=0}"
: "${LILY_CHECK_JOBS:=8}"

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

if [[ "${LILY_SNIPPET_STRICT}" == "1" ]]; then
	echo ""
	echo "================ lily-check: drop cached lily-*.ly (force real recompile) ================="
	find "/workdir/${OUTPUT_DIR}" -type f -name "lily-*.ly" ! -path "*/lycheck-rerun/*" -print -delete 2>/dev/null || true
fi

echo ""
echo "================ lilypond-book (all snippets, loglevel=${LILYBOOK_LOGLEVEL}) ================="
# shellcheck disable=SC2086
"${LILYPOND_BOOK}" --pdf --loglevel="${LILYBOOK_LOGLEVEL}" --lily-loglevel="${LILYBOOK_LILY_LOGLEVEL}" \
	--process="lilypond ${LILYPOND_FLAGS}" \
	--output="${OUTPUT_DIR}" \
	-I /workdir -I /workdir/source -I /workdir/source/lilyjazz-styles \
	"${MAIN}.tex" 2>&1 | tee "${LOG_DIR}/lilypond-book.log"

if [[ "${LILY_SNIPPET_STRICT}" == "1" ]]; then
	echo ""
	echo "================ lily-check: lilypond each snippet (${LILY_CHECK_JOBS} jobs) ================="
	rm -rf "/workdir/${OUTPUT_DIR}/lycheck-rerun"
	mkdir -p "/workdir/${OUTPUT_DIR}/lycheck-rerun"
	cnt="$(find "/workdir/${OUTPUT_DIR}" -type f -name "lily-*.ly" ! -path "*/lycheck-rerun/*" 2>/dev/null | wc -l | tr -d ' ')"
	if [[ "${cnt}" -eq 0 ]]; then
		echo "No lily-*.ly under /workdir/${OUTPUT_DIR}; lilypond-book should have produced snippets."
		exit 1
	fi
	# shellcheck disable=SC2086
	find "/workdir/${OUTPUT_DIR}" -type f -name "lily-*.ly" ! -path "*/lycheck-rerun/*" -print0 |
		xargs -0 -P"${LILY_CHECK_JOBS}" -t -n1 lilypond ${LILYPOND_FLAGS} \
			-I/workdir -I/workdir/source -I/workdir/source/lilyjazz-styles \
			-o "/workdir/${OUTPUT_DIR}/lycheck-rerun"
fi

echo ""
echo "lilypond-book: snippets OK."
