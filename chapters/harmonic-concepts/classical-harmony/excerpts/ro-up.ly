\include "book-example.ily"

global = {
	\key c \major
	\time 4/4
}

theRH = \relative c' {
	\global
	<c' g e>4 <b g f> <c g c,> <d c a> |
	<d b g>4 <f c f,> <g f d> <g e c> \bar "||"
}

theLH = \relative c {
	\global
	c4 d e f |
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
