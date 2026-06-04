\include "book-example.ily"

theNotes = \relative c' {
	\key f \major
	<f a c d>1^"MAJOR SIXTH" |
	<f aes c d>1^"MINOR SIXTH" |
	<f a c e>1^"MAJOR SEVENTH" |
	<f aes c ees>1^"MINOR SEVENTH" | \break
	<f a c ees>1^"DOMINANT SEVENTH" |
	<f aes ces ees>1^"MINOR SEVENTH FLAT 5" |
	<f a ces ees>1^"DOMINANT SEVENTH FLAT 5" |
	<f aes b d>1^"DIMINISHED CHORD" \bar "||"
}

\score {
	\new Staff <<
		\new Voice \theNotes
	>>
}
