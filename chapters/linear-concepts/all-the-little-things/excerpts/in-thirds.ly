\include "book-example.ily"

theNotes = \relative c' {
	\key f \major
	f8 a g bes a c bes d |
	c e d f e g d f |
	c e bes d a c g bes |
	f1 \bar "||"
}

theChords = \chordmode {
	f1:6 |
	f1:6 |
	f1:6 |
	f1:6 |
}

\score {
	<<
		\new ChordNames {\theChords}
		\new Voice = soloist \theNotes
	>>
}
