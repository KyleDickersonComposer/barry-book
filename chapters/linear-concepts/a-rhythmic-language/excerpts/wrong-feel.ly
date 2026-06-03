\include "book-example.ily"

theNotes = \relative c' {
	\key f \major
	\tuplet 3/2 {f4 g8} \tuplet 3/2 {a4 bes8} \tuplet 3/2 {c4 d8} \tuplet 3/2 {e4 f8} |
	\tuplet 3/2 {f4 e8} \tuplet 3/2 {d4 c8} \tuplet 3/2 {bes4 a8} \tuplet 3/2 {g4 f8} \bar "||"
}

theChords = \chordmode {
	f1:6 |
	f1:6 |
}

\score {
	<<
		\new ChordNames {\theChords}
		\new Voice = soloist \theNotes
	>>
}
