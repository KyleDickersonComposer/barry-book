title = #"Rhythm"
composer = #""
meter = #" (Med.)"
\include "real-book-chart.ily"

theTune = \relative c'' {
	\key bes \major
	\improvisationOn
	\omit Stem
	b4 b b b | b b b b | b b b b | b b b b | \break
	b b b b | b b b b | b b b b | b b b b | \break
	b b b b | b b b b | b b b b | b b b b | \break
	b b b b | b b b b | b b b b | b b b b \bar "||" \break
	b b b b | b b b b | b b b b | b b b b | \break
	b b b b | b b b b | b b b b | b b b b | \bar "||" \break
	b b b b | b b b b | b b b b | b b b b | \break
	b b b b | b b b b | b b b b | b b b b \bar "|."
	\improvisationOff
	\omit Stem
}

theChords = \chordmode {
	bes2:6 g:m7 |
	c:m7 f:7 |
	d2:m7 g:m7 |
	c:m7 f:7 |
	bes:6 bes:7/d |
	ees:maj7 e:dim7 |
	bes:6/f f:7 |
	c:m7 f:7 |
	bes:6 g:m7 |
	c:m7 f:7 |
	d:m7 g:m7 |
	c:m7 f:7 |
	bes:6 bes:7/d |
	ees:maj7 e:dim7 |
	bes:6/f f:7 |
	bes1:6 |
	% bridge
	d1:7 |
	d:7 |
	g:7 |
	g:7 |
	c:7 |
	c:7 |
	f:7 |
	f:7 |
	bes2:6 g:m7 |
	c:m7 f:7 |
	d:m7 g:m7 |
	c:m7 f:7 |
	bes:6 bes:7/d |
	ees:maj7 e:dim7 |
	bes:6/f f:7 |
	bes1:6 |
}

\score {
	<<
		\new ChordNames \theChords
		\new Voice = soloist \theTune
	>>
}
