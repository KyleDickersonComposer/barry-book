\include "book-example.ily"

theNotes = \relative c' {
	\key c \minor
	d8 ees f g aes bes c4 |
	g8 a b c d ees f4 |
	c8, d ees f g a b a |
	g f ees d c2 \bar "||"
}

theChords = \chordmode {
	d1:m7.5- g1:7 c1:m6 c1:m6 |
}

\score {
	<<
		\new ChordNames {\theChords}
		\new Voice = soloist \theNotes
	>>
}
