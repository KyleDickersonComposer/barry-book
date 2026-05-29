\include "book-example.ily"

theNotes = \relative c' {
	\key c \major
	c8 d e f g a b a |
	g f e d cis2 |
	d8 e f g a b c4 |
	g8 a b c d e f4 \bar "||"
}

theChords = \chordmode {
	c1:6 a1:7 d1:m7 g1:7 |
}

\score {
	<<
		\new ChordNames {\theChords}
		\new Voice = soloist \theNotes
	>>
}
