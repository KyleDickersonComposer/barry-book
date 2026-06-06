\include "book-example.ily"

global = {
	\key c \major
	\time 4/4
}

theRH = \relative c' {
	\global
	g'2 d'~|
	d2 c \bar "||"
}

theLH = \relative c {
	\global
	g1 |
	c |
}

\score {
	\new StaffGroup <<
		\new Staff <<
			\clef treble
			\new Voice \theRH
		>>
		\new Staff <<
			\clef bass
			\new Voice \theLH
		>>
	>>
}
