\include "book-example.ily"

theNotes = \relative c' {
	\key c \major
	d8 e f g a b c4 |
	g8 a b c d e f4 |
	d,8 e f g a b c4 |
	c,8 d e f g a b4 \bar "||"
}

theChords = \chordmode {
	d1:m7 |
	g1:7 |
	e2:m7 a:7 |
	d2:m7 g:7 |
}

\score {
	<<
		\new ChordNames {\theChords}
		\new Voice = soloist \theNotes
	>>
}
