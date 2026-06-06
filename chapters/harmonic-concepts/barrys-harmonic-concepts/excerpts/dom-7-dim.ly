\include "book-example.ily"

theNotes = \relative c' {
	\key c \major
	<c e g bes>4 <d f aes b> <e g bes c> < f aes b d> |
	<g bes c e>4 <aes b d f> <bes c e g> <b d f aes> \bar "||"
}

theChords = \chordmode {
	c1:7 |
	c1:7 |
}

\score {
	<<
		\new ChordNames {\theChords}
		\new Voice = soloist \theNotes
	>>
}
