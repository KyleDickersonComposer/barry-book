\include "book-example.ily"

theNotes = \relative c' {
	\key c \major
	<c ees ges a>2 <cis dis fis a> |
	<c ees ges a>2 <c e fis a> | \break
	<c ees ges a>2 <c ees g a> |
	<c ees ges a>2 <c ees ges bes> \bar "||"
}

theChords = \chordmode {
	c2:dim7
	fis2:min6
	c2:dim7
	a2:min6
	c2:dim7
	c2:min6
	c2:dim7
	ees2:min6
}

\score {
	\new Staff <<
		\new ChordNames \theChords
		\new Voice \theNotes
	>>
}
