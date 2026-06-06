\include "book-example.ily"

theNotes = \relative c' {
	\key c \major
	<c e g b>4 <c e g a> <d f aes c> <d f aes b>
	<e g a d> <e g a c> <f aes b e> <f aes b d>^"etc." \bar "||"
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
