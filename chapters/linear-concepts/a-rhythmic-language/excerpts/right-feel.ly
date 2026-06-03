\include "book-example.ily"

theNotes = \relative c' {
	\key f \major
	f8 g( a) bes( c) d( e) f( |
	g8) e( d) c( bes) a( g) f \bar "||"
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
