\include "book-example.ily"

theNotes = \relative c' {
	\key c \major
	<c ees ges a>2 c8 ees? ges? a |
	<cis, e g bes>2 cis?8 e g bes? |
	<d, f aes b>2 d8 f aes? b \bar "||"
}

\score {
	\new Staff {
		\new Voice \theNotes
	}
}
