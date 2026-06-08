\include "book-example.ily"

theNotes = \relative c' {
	\key c \minor
	f8 g aes bes c cis d4 |
	aes'8 g f ees d c b4 |
	c8 d ees f g gis a aes |
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
