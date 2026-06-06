\include "book-example.ily"

theNotes = \relative c' {
	\key c \major
	<c e g a>4 <d f aes b> <e g a c> < f aes b d> |
	<g a c e>4 <aes b d f> <a c e g> <b d f aes> \bar "||"
}

theChords = \chordmode {
	c1:6 |
	c1:6 |
}

\score {
	<<
		\new ChordNames {\theChords}
		\new Voice = soloist \theNotes
	>>
}
