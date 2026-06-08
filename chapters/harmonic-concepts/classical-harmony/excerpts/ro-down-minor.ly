\include "book-example.ily"

global = {
	\key c \minor
	\time 4/4
}

theRH = \relative c' {
	\global
	<c' g ees>4 <d g, d> <c fis, d> <b g d> |
	<b g d>4 <c g c,> <b g f> <c g ees> \bar "||"
}

theLH = \relative c {
	\global
	c'4 bes aes g |
	f ees d c |
}

theFigures = \figuremode {
	s4 <6> <6+ 4 3> s4 |
	<2> <6> <4 3> s4 |
}

\score {
	\new PianoStaff <<
		\new Staff <<
			\clef treble
			\new Voice \theRH
		>>
		\new Staff <<
			\clef bass
			\new Voice \theLH
		>>
		\new FiguredBass \theFigures
	>>
}
