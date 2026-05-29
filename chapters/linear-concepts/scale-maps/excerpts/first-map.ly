\include "book-example.ily"

theNotes = \relative c' {
	\key c \major
	d8 e f g a b c4 |
	g8 a b c d e f4 |
	c,8 d e f g a b a |
	g f e d c2 \bar "||"
}

theChords = \chordmode {
	d1:m7 g1:7 c1:6 c1:6 |
}

\score {
	<<
		\new ChordNames {\theChords}
		\new Voice = soloist \theNotes
	>>
}
