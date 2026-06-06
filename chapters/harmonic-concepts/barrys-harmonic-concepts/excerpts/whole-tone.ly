\include "book-example.ily"

theNotes = \relative c' {
	\key c \major
	\time 6/4
	c4 d e fis gis ais |
	c4 bes aes fis e d |
	des4 ees f g a b |
	cis4 b a g f ees \bar "||"
}

\score {
	\new Staff {
		\new Voice \theNotes
	}
}
