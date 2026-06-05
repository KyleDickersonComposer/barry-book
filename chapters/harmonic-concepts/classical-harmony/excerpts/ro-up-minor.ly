\include "book-example.ily"

global = {
	\key c \minor
	\time 4/4
}

theRH = \relative c' {
	\global
	<c' g ees>4 <b g f> <c g c,> <d c aes> |
	<d b g>4 <f c f,> <g f d> <g ees c> \bar "||"
}

theLH = \relative c {
	\global
	c4 d ees f |
	g a b c |
}

theFigures = \figuremode {
	s4 <4 3> <6> <6 5> |
	s4 <6> <6 5> s4 |
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
