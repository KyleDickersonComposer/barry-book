\include "book-example.ily"

theNotes = \relative c' {
	\key f \major
	f8 fis g gis a bes b c |
	cis d ees e f8 r8 r4 \bar "||"
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
