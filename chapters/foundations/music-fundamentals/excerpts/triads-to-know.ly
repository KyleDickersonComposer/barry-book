\include "book-example.ily"

theNotes = \relative c' {
	\key f \major
	<f a c>1^"MAJOR TRIAD" |
	<f aes c>1^"MINOR TRIAD" |
	<f a cis>1^"Augmented TRIAD" \bar "||"
}

\score {
	\new Staff <<
		\new Voice \theNotes
	>>
}
