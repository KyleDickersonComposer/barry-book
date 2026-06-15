\include "book-example.ily"

theMarkup = {
	s8 s8^"W" s8 s8^"H" s8 s8^"W" s8 s8^"W" |
	s8 s8^"W" s8 s8^"W" s8 s8^"H" s4 |
}

theNotes = \relative c' {
	\key f \major
	f4 g aes bes! |
	c d e f \bar "||"
}

\score {
	\new Staff <<
		\new Voice \theMarkup
		\new Voice \theNotes
	>>
}
