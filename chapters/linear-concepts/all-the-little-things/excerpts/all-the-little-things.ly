\include "book-example.ily"

theNotes = \relative c' {
	\key f \major
	f8^\markup{\bold "THIRDS"} a r4 r2 | \bar "||"

	f8^\markup{\bold "TRIAD"} a c r8  r2 \bar "||"

	f,8^\markup{\bold "CHORD"} a c e r2 \bar "||" \break

	f8^\markup{\bold "DROP"} a, r4 r2 \bar "||"

	f'8^\markup{\bold "PIVOT"} a, c e r2 \bar "||"

	g8^\markup{\bold "SUPER PIVOT"} f a, c e d r4 \bar "||"
}

\score {
	<<
		\new Voice = soloist \theNotes
	>>
}
