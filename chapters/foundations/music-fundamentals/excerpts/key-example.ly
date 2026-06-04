\include "book-example.ily"

theNotes = \relative c' {
	\key f \major
	f8 g a bes b c b bes |
	f16 g a bes b c b bes f g a bes b c b bes \bar "||"
}

\score {
	<<
		\new Voice = soloist \theNotes
	>>
}
