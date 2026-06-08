\include "book-example.ily"

theNotes = \relative c' {
	\key c \minor
	c8 d ees f g gis a4 |
	g8 a bes c d ees e4 |
	f,8 g aes b c cis d4 |
	ees,8 f g aes bes c des4\bar "||"
}

theChords = \chordmode {
	c1:m6 a:7 d1:m7.5- g1:7 |
}

\score {
	<<
		\new ChordNames {\theChords}
		\new Voice = soloist \theNotes
	>>
}

