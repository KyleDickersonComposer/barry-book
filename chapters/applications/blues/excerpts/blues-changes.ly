title = #"Blues"
composer = #""
meter = #" (Med.)"
\include "real-book-chart.ily"

theTune = \relative c'' {
	\key f \major
	\improvisationOn
	\omit Stem
	b4 b b b | b b b b | b b b b | b b b b | \break
	b b b b | b b b b | b b b b | b b b b | \break
	b b b b | b b b b | b b b b | b b b b \bar "|."
	\improvisationOff
	\omit Stem
}

theChords = \chordmode {
	f1:7 |
	bes1:7 |
	f1:7 |
	c2:m7  f:7 |
	bes1:7 |
	b:dim7 |
	f:7 |
	a2:m7 d2:7 |
	g1:m7 |
	c1:7 |
	f1:7 |
	g2:m7 c:7 |
}

\score {
	<<
		\new ChordNames \theChords
		\new Voice = soloist \theTune
	>>
}
