\include "book-example.ily"

soprano = \relative c' {
	\key a \minor
	\partial 2.
	a4 f' e |
	gis2.^"App." a4 |
	ais2^"App." b \bar "||"
}

alto = \relative c' {
	\key a \minor
	\partial 2.
	s2.
	ees1 |
	d1 |
}

bass = \relative c {
	\key a \minor
	\partial 2.
	s2.
	<f b>1 |
	<e gis>1 |
}

theChords = \chordmode {
	\partial 2.
	s2.

	f1:7.5- |
	e1:7 |
}

\score {
	\new PianoStaff <<
		\new ChordNames {\theChords}
		\new Staff <<
			\clef treble
			\new Voice \voiceOne \soprano
			\new Voice \voiceTwo \alto
		>>

		\new Staff <<
			\clef bass
			\new Voice \bass
		>>
	>>
}
