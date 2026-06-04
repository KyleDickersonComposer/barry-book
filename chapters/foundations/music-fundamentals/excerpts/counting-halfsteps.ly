\include "book-example.ily"

theNotes = \relative c' {
	\key c \major
	<c g'>1^"7 HALF STEPS" |
	c8 cis^"1" d^"2" dis^"3" e^"4" f^"5" fis^"6" g^"7" \bar "||"
}

\score {
	<<
		\new Voice = soloist \theNotes
	>>
}
