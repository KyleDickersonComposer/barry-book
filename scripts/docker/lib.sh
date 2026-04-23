#!/usr/bin/env bash
# Shared helpers for Docker book builds (sourced from run-*.sh; cwd must be /workdir).

_script_dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
# shellcheck source=failure-summary.sh
source "${_script_dir}/failure-summary.sh"

cleanup() {
	find . -maxdepth 1 -name "tmp*" -type f -delete 2>/dev/null || true
	find . -maxdepth 1 -name "*.tmp" -type f -delete 2>/dev/null || true
}

# Run pdflatex; if it exits non-zero but wrote a PDF and the log only shows the known
# lilyglyphs fancyexamples.inp + keyval false positive, return 0 so `make pdf` succeeds.
run_pdflatex_pass() {
	local pass="$1"
	local log="${LOG_DIR}/pdflatex-pass${pass}.log"
	local ec=0
	set +e
	# shellcheck disable=SC2086
	"${LATEX}" ${LATEX_FLAGS} "${OUTPUT_DIR}/${MAIN}.tex" >"${log}" 2>&1
	ec=$?
	set -e
	if [[ "${ec}" -eq 0 ]]; then
		return 0
	fi
	if [[ ! -f "${OUTPUT_DIR}/${MAIN}.pdf" ]]; then
		return "${ec}"
	fi
	if grep -qF 'Emergency stop' "${log}" 2>/dev/null; then
		return "${ec}"
	fi
	if grep -qi 'fatal error' "${log}" 2>/dev/null; then
		return "${ec}"
	fi
	if grep -qF 'fancyexamples.inp' "${log}" 2>/dev/null \
		&& grep -qF "Misplaced '=' in key-value input on line" "${log}" 2>/dev/null \
		&& grep -qF 'Use of \???' "${log}" 2>/dev/null; then
		echo "WARNING: pdflatex pass ${pass} exited ${ec}; continuing (known lilyglyphs/keyval noise; PDF present). See ${log}" >&2
		return 0
	fi
	return "${ec}"
}
