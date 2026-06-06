\include "book-example.ily"

theNotes = \relative c' {
	\key c \major
	<c ees ges a>2 <b dis fis a> |
	<c ees ges a>2 <c d fis a> |
	<c ees ges a>2 <c ees f a> |
	<c ees ges a>2 <c ees ges aes> \bar "||"
}

theChords = \chordmode {
	c2:dim7
	b2:7
	c2:dim7
	d2:7
	c2:dim7
	f2:7
	c2:dim7
	aes2:7
}

\score {
	\new Staff <<
		\new ChordNames \theChords
		\new Voice \theNotes
	>>
}
