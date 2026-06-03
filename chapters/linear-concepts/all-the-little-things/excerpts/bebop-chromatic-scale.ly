\include "book-example.ily"

theNotes = \relative c' {
	\key f \major
	f8 fis g gis a c bes b |
	c cis d f ees e f4 \bar "||"
}

theChords = \chordmode {
	f1:7 |
	f1:7 |
}

\score {
	<<
		\new ChordNames {\theChords}
		\new Voice = soloist \theNotes
	>>
}
