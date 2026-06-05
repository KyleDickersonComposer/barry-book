\include "book-example.ily"

global = {
	\key c \major
	\time 4/4
}

theRH = \relative c' {
	\global
	<c' g e>4 <d g, f> <d c fis,> <d b g> |
	<d b g>4 <g c, g> <f b, g> <e c g> \bar "||"
}

theLH = \relative c {
	\global
	c'4 b a g |
	f e d c |
}

theFigures = \figuremode {
	s4 <6 5> <6+ 4 3> s4 |
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
