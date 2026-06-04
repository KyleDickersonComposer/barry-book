\include "book-example.ily"

theNotes = \relative c' {
	\key c \major
	<c d>1^"SECOND" |
	c8^"1" d^"2" r4 r2 |
	<c e>1^"THIRD" |
	c8^"1" d^"2" e^"3" r8 r2 | \break
	<c f>1^"Fourth" |
	c8^"1" d^"2" e^"3" f^"4" r2 |
	<c g'>1^"FIFTH" |
	c8^"1" d^"2" e^"3" f^"4" g4^"5" r4 | \break
	<c, a'>1^"SIXTH" |
	c8^"1" d^"2" e^"3" f^"4" g^"5" a^"6" r4|
	<c, b'>1^"SEVENTH" |
	c8^"1" d^"2" e^"3" f^"4" g^"5" a^"6" b4^"7" | \break
	<c, c'>1^"OCTAVE" |
	c8^"1" d^"2" e^"3" f^"4" g^"5" a^"6" b^"7" c^"8" |
	<c, d'>1^"NINTH" |
	c16^"1" d^"2" e^"3" f^"4" g^"5" a^"6" b^"7" c^"8" d2^"9" | \break
	<c, e'>1^"TENTH" |
	c16^"1" d^"2" e^"3" f^"4" g^"5" a^"6" b^"7" c^"8" d^"9" e8.^"10" r4 |
	<c, f'>1^"ELEVENTH" |
	c16^"1" d^"2" e^"3" f^"4" g^"5" a^"6" b^"7" c^"8" d^"9" e^"10" f8^"11" r4 | \break
	<c, g'>1^"TWELFTH" |
	c16^"1" d^"2" e^"3" f^"4" g^"5" a^"6" b^"7" c^"8" d^"9" e^"10" f^"11" g^"12" r4 |
	<c,, a'>1^"THIRTEENTH" |
	c16^"1" d^"2" e^"3" f^"4" g^"5" a^"6" b^"7" c^"8" d^"9" e^"10" f^"11" g^"12" a4^"13" \bar "||"
}

\score {
	<<
		\new Voice = soloist \theNotes
	>>
}
