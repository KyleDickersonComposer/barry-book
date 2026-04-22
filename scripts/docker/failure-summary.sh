#!/usr/bin/env bash
# Non-authoritative failure helper: print log tails first, then heuristic grep.
# Expects: MAIN, OUTPUT_DIR, LOG_DIR (set by caller).

summarize_failure() {
	echo ""
	echo "================ Build failed — raw log tails (read these first) ================"
	if [[ -f "${LOG_DIR}/lilypond-book.log" ]]; then
		echo ""
		echo "--- ${LOG_DIR}/lilypond-book.log (last 120 lines) ---"
		tail -n 120 "${LOG_DIR}/lilypond-book.log" 2>/dev/null || true
	fi
	if [[ -f "${LOG_DIR}/pdflatex-pass1.log" ]]; then
		echo ""
		echo "--- ${LOG_DIR}/pdflatex-pass1.log (last 80 lines) ---"
		tail -n 80 "${LOG_DIR}/pdflatex-pass1.log" 2>/dev/null || true
	fi
	if [[ -f "${OUTPUT_DIR}/${MAIN}.log" ]]; then
		echo ""
		echo "--- ${OUTPUT_DIR}/${MAIN}.log (last 80 lines) ---"
		tail -n 80 "${OUTPUT_DIR}/${MAIN}.log" 2>/dev/null || true
	fi

	echo ""
	echo "================ Heuristic grep (non-authoritative; may miss odd wording) ================"
	found=0
	for file in \
		"${LOG_DIR}/lilypond-book.log" \
		"${LOG_DIR}/pdflatex-pass1.log" \
		"${LOG_DIR}/biber.log" \
		"${LOG_DIR}/makeglossaries.log" \
		"${LOG_DIR}/pdflatex-pass2.log" \
		"${LOG_DIR}/pdflatex-pass3.log" \
		"${OUTPUT_DIR}/${MAIN}.log" \
		"${OUTPUT_DIR}/${MAIN}.blg"; do
		[[ -f "$file" ]] || continue
		matches="$(
			awk 'BEGIN{IGNORECASE=1; ctx=0}
/warning:|^! |fatal error|error:|undefined control sequence|emergency stop|ERROR -|unrecognized option|non-zero exit status|syntax error|programming error|cannot find file|unexpected end|failed at:|returned non-zero|parse error|runaway argument/ {
  print NR ":" $0; ctx=2; next
}
ctx>0 { print NR ":" $0; ctx--; }' "$file"
		)"
		[[ -n "$matches" ]] || continue
		found=1
		echo "-- $file --"
		printf '%s\n' "$matches"

		if [[ "$file" == "${LOG_DIR}/lilypond-book.log" ]]; then
			failing_ref="$(
				awk 'match($0, /[[:alnum:]_\/.-]*lily-[0-9a-f]+\.ly:[0-9]+:[0-9]+:/) {
					print substr($0, RSTART, RLENGTH); exit
				}' "$file"
			)"
			if [[ -n "$failing_ref" ]]; then
				fr="$failing_ref"
				fr="${fr%:}"
				tmp1="${fr%:*}"
				gen_line="${tmp1##*:}"
				gen_ly="${tmp1%:*}"
				ly_base="$(basename "$gen_ly" .ly)"
				owner_tex="$(grep -R -l -F "${ly_base}-systems.tex" "${OUTPUT_DIR}" 2>/dev/null | head -n 1)"
				if [[ -z "$owner_tex" ]]; then
					owner_tex="$(grep -R -l -F "$gen_ly" "${OUTPUT_DIR}" 2>/dev/null | head -n 1)"
				fi
				echo "Likely generated snippet: ${OUTPUT_DIR}/${gen_ly}:${gen_line}"
				if [[ -n "$owner_tex" ]]; then
					ot="$owner_tex"
					case "$ot" in
						"${OUTPUT_DIR}"/*) sg="${ot#${OUTPUT_DIR}/}" ;;
						*) sg="$ot" ;;
					esac
					case "$sg" in
						*.tex) source_guess="${sg%.tex}.lytex" ;;
						*) source_guess="$sg" ;;
					esac
					echo "Likely source file: $source_guess"
				else
					echo "Likely source file: (no ${ly_base}-systems.tex in ${OUTPUT_DIR}; see .lytex lines below)"
					echo "Recent .lytex paths in lilypond-book.log:"
					grep -E -o '[A-Za-z0-9_./-]+\.lytex' "$file" 2>/dev/null | tail -n 12 | while read -r p; do echo "  $p"; done || true
					note_line="$(
						awk '
							hit && !seen {
								sub(/^[[:space:]]+/, "")
								sub(/[[:space:]]+$/, "")
								print
								exit
							}
							/fatal error: barcheck failed/ { hit = 1 }
						' "$file"
					)"
					if [[ -n "$note_line" ]]; then
						source_hits="$(
							grep -R -n -F "$note_line" chapters frontmatter source main.lytex preface.lytex 2>/dev/null | head -n 5
						)"
						if [[ -n "$source_hits" ]]; then
							echo "Source text matches:"
							printf '%s\n' "$source_hits"
						fi
					fi
				fi
				if printf '%s\n' "$matches" | grep -qi "syntax error"; then
					echo ""
					echo "Hint: LilyPond header values must be quoted strings, e.g. title = \"Scale Etude\", composer = \"You\"."
				fi
			fi
		fi
	done

	if [[ "$found" -eq 0 ]]; then
		echo "(Heuristic grep matched nothing known — rely on the log tails printed above.)"
	else
		echo "(Heuristic grep above is hints only; log tails above usually show the real cause.)"
	fi
	echo ""
	echo "Full logs: ${LOG_DIR}/ and ${OUTPUT_DIR}/${MAIN}.log"
	echo "==============================================="
}
