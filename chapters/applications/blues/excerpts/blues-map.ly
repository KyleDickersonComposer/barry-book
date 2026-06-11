\include "book-example.ily"

theMap = \relative c' {
	f8 g a bes c d ees4 |
	bes8 c d ees f g aes4 |
	f,8 g a bes c d ees d |
	c8 bes a g f4 r4 | \break
	bes8 c d ees f g aes g |
	f8 ees d c bes4 r4 |
	f8 g a bes c d ees d |
	c8 bes a g fis4 r4 | \break
	c8 d e f g a bes a |
	g8 f e d c4 r4 |
	f8 g a bes c d ees4 |
	c,8 d e f g a bes4 \bar "|."
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
		\new Voice \theMap
	>>
}
