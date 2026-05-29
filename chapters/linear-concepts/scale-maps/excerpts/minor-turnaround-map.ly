\include "book-example.ily"

theNotes = \relative c' {
	\key c \minor
	c8 d ees f g a b a |
	g f ees d c2 |
	d8 ees f g aes bes c4 |
	g8 a b c d ees f4 \bar "||"
}

theChords = \chordmode {
	c1:m6 aes1:maj7 d1:m7.5- g1:7 |
}

\score {
	<<
		\new ChordNames {\theChords}
		\new Voice = soloist \theNotes
	>>
}

