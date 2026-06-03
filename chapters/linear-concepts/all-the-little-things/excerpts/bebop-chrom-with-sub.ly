\include "book-example.ily"

theNotes = \relative c' {
	\key f \major
	g8 gis a ais b d c cis |
	d dis e g f fis g4 \bar "||"
}

theChords = \chordmode {
	f1:7.11+ |
	f1:7.11+ |
}

\score {
	<<
		\new ChordNames {\theChords}
		\new Voice = soloist \theNotes
	>>
}
