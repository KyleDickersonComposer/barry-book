\include "book-example.ily"

theNotes = \relative c' {
	\key c \major
	c4 cis d dis |
	e f fis g |
	gis a ais b | \break
	c ces bes a |
	aes g ges f |
	e ees d des \bar "||"
}

\score {
	\new Staff {
		\new Voice \theNotes
	}
}
