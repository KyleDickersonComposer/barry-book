\include "book-example.ily"

theMap = \relative c' {
	f8 g a bes c d ees d |
	c8 bes a g f4 r4 |
	bes,8 c d ees f g a4 |
	ees8 f g aes bes c d4 | \break
	c,8 d ees f g gis a4 |
	ees'8 d c bes a g fis4 |
	g8 a bes c d dis e ees |
	d8 c bes a g4 r4 \bar "||" \break
	f8 g a bes c d ees d |
	c8 bes a g f4 r4 |
	bes,8 c d ees f g a4 |
	ees8 f g aes bes c d4 | \break
	c,8 d ees f g gis a4 |
	ees'8 d c bes a g fis4 |
	g8 a bes c d dis e ees |
	d8 c bes a g4 r4 \bar "||" \break
	c,8 d ees f g gis a4 |
	ees'8 d c bes a g fis4 |
	g8 a bes c d dis e ees |
	d8 c bes a g4 r4 \bar "||" \break
	f8 g a bes c d ees d |
	c8 bes a g f4 r4 |
	bes,8 c d ees f g a g |
	f8 ees d c bes4 r4 \bar "||" \break
	c8 d ees f g gis a4 |
	ees'8 d c bes a g fis4 |
	c8 d e f g a bes4 |
	bes,8 c d ees f g aes4 | \break
	c,8 d ees f g gis a4 |
	ees'8 d c bes a g fis4 |
	g8 a bes c d dis e ees |
	d8 c bes a g4 r4 \bar "|."
}

theChords = \chordmode {
	c1:m7 |
	f1:7 |
	bes1:maj7 |
	ees1:maj7 |
	a1:m7.5- |
	d1:7 |
	g1:min6 |
	g1:min6 |
	c1:m7 |
	f1:7 |
	bes1:maj7 |
	ees1:maj7 |
	a1:m7.5- |
	d1:7 |
	g1:min6 |
	g1:min6 |
	a1:m7.5- |
	d1:7 |
	g1:min6 |
	g1:min6 |
	c1:m7 |
	f1:7 |
	bes1:maj7 |
	bes1:maj7 |
	a1:m7.5- |
	d1:7 |
	g2:m7 c:7|
	f2:m7 bes:7 |
	a1:m7.5- |
	d1:7 |
	g1:min6 |
	g1:min6 |
}

\score {
	<<
		\new ChordNames \theChords
		\new Voice \theMap
	>>
}
