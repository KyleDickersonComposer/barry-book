\include "book-example.ily"

theNotes = \relative c' {
	\key c \major
	<c e aes b>4 <c e g a> <d f a c> <d f aes b>
	<e g b d> <e g a c> <f aes c e> <f aes b d>^"etc." \bar "||"
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
