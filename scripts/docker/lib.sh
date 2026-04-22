#!/usr/bin/env bash
# Shared helpers for Docker book builds (sourced from run-*.sh; cwd must be /workdir).

_script_dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
# shellcheck source=failure-summary.sh
source "${_script_dir}/failure-summary.sh"

cleanup() {
	find . -maxdepth 1 -name "tmp*" -type f -delete 2>/dev/null || true
	find . -maxdepth 1 -name "*.tmp" -type f -delete 2>/dev/null || true
}
