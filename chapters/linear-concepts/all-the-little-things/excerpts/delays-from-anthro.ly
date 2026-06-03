\include "book-example.ily"

theNotes = \relative c' {
	\key bes \major
	\partial 8
	e8~ |

	e8 ees8~ ees ges,~ ges bes c d |
	\tuplet 3/2 {ees8 f ees} d f r8 d ees g, |
	c bes a bes r2 \bar "||"
}

theChords = \chordmode {
	\partial 8
	s8

	ees1:7 |
	bes:6 |
	bes:6 |
}

\score {
	<<
		\new ChordNames {\theChords}
		\new Voice = soloist \theNotes
	>>
}
