\include "book-example.ily"

theNotes = \relative c {
	\key c \major
	g'4^\markup{\bold{G}} a^\markup{\bold{A}} b^\markup{\bold{B}} c^\markup{\bold{C}} |
	d^\markup{\bold{D}} e^\markup{\bold{E}} f^\markup{\bold{F}} g^\markup{\bold{G}} | \break
	a^\markup{\bold{A}} b^\markup{\bold{B}} c^\markup{\bold{C}} d^\markup{\bold{D}} |
	e^\markup{\bold{E}} f^\markup{\bold{F}} g^\markup{\bold{G}} a^\markup{\bold{A}} |
	b^\markup{\bold{B}} c^\markup{\bold{C}} d^\markup{\bold{D}} e^\markup{\bold{E}} \bar "||"
}

\score {
	<<
		\new Voice = soloist \theNotes
	>>
}
