\include "book-example.ily"

theNotes = \relative c' {
	\key c \major
	<c e ges bes>4 <d f aes b> <e ges bes c> < f aes b d> |
	<ges bes c e>4 <aes b d f> <bes c e ges> <b d f aes> \bar "||"
}

theChords = \chordmode {
	c1:7.5- |
	c1:7.5- |
}

\score {
	<<
		\new ChordNames {\theChords}
		\new Voice = soloist \theNotes
	>>
}
