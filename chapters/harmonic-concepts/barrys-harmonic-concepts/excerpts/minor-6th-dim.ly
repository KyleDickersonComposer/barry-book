\include "book-example.ily"

theNotes = \relative c' {
	\key c \major
	<c ees g a>4 <d f aes b> <ees g a c> < f aes b d> |
	<g a c ees>4 <aes b d f> <a c ees g> <b d f aes> \bar "||"
}

theChords = \chordmode {
	c1:min6 |
	c1:min6 |
}

\score {
	<<
		\new ChordNames {\theChords}
		\new Voice = soloist \theNotes
	>>
}
