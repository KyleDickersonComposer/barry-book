title = #"Blues"
composer = #""
meter = #" (Med. Swing)"
\include "real-book-chart.ily"

theTune = \relative c'' {
	\key f \major
	\improvisationOn
	\omit Stem
	b4 b b b | b b b b | b b b b | b b b b | \break
	b b b b | b b b b | b b b b | b b b b | \break
	b b b b | b b b b | b b b b | b b b b \bar "||"
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
	bes:7 |
	a2:m7 d2:7 |
	g1:m7 |
	c1:7 |
	f2:7 d:7 |
	g:m7 c:7 |
}

\score {
	<<
		\new ChordNames \theChords
		\new Voice = soloist \theTune
	>>
}
