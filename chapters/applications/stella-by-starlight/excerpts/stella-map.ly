\include "book-example.ily"

theMap = \relative c' {
	\key bes \major
	c8 d e f g a bes a |
	g8 f e d cis4 r4 |
	f8 g a bes c d ees d |
	c bes a g f4 r4 | \break
	bes,8 c d ees f g aes g |
	f ees d c bes4 r4 |
	ees8 f g aes bes c d4 |
	aes,8 bes c des ees f ges4 \bar "||" \break
	bes,8 c d ees f g a4 |
	bes8 a g f ees d cis4 |
	d8 e f g a bes c4 |
	ees,8 f g aes bes c des4 | \break
	f,8 g a bes c d e4 |
	bes8 a g f e d cis4 |
	f8 g a bes c d ees d |
	c8 bes a g fis4 r4 \bar "||" \break
	g8 a b c d e f e |
	d8 c b a g4 r4 |
	c,8 d ees f g a bes a |
	g8 f ees d c4 r4 | \break
	aes8 bes c des ees f ges f |
	ees des c bes aes4 r4 |
	bes8 c d ees f g a g |
	f8 ees d c bes4 r4 \bar "||" \break
	c8 d e f g a bes a |
	g8 f e d cis4 r4 |
	bes8 c d ees f g aes g |
	f8 ees d c b4 r4 | \break
	aes8 bes c des ees f ges f |
	ees8 des c bes a4 r4 |
	bes8 c d ees f g a g |
	f8 ees d c bes4 r4 \bar "|."
}

theChords = \chordmode {
	e1:min7.5- |
	a1:7 |
	c1:m7 |
	f2:7 f2:7.5+ |
	f1:m7 |
	bes1:7 |
	ees1:6 |
	aes1:7 |
	bes1 |
	e2:min7.5- a2:7 |
	d1:min7 |
	bes2: min7 ees2:7 |
	f1:maj7 |
	e2:min7.5- a2:7 |
	a1:m7.5- |
	d1:7.9- |
	g1:7.5+ |
	g1:7.5+ |
	c1:m7 |
	c1:m7 |
	aes1:7 |
	aes1:7 |
	bes1:maj7 |
	bes1:6 |
	e1:min7.5- |
	a1:7 |
	d1:m7.5- |
	g1:7.9- |
	c1:m7.5- |
	f1:7.9- |
	bes1:6 |
	bes1:6 |
}

\score {
	<<
		\new ChordNames \theChords
		\theMap
	>>
}
