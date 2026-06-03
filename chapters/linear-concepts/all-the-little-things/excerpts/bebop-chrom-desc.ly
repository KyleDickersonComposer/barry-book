\include "book-example.ily"

theNotes = \relative c' {
	\key f \major
	f'8 e ees f d des c ces |
	bes c a aes g ges f4 \bar "||"
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
