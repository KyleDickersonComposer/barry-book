\include "book-example.ily"

theMap = \relative c' {
	\key bes \major

	bes8 c d ees f g a4 |
	f8 g a bes c d ees4 |
	bes,8 c d ees f g aes g |
	f8 ees d c bes4 r4 | \break
	ees8 f g aes bes c d c |
	bes aes g f ees4 r4 |
	aes8 bes c des ees f ges f |
	ees des c bes aes4 r4 | \break
	bes,8 c d ees f g a g |
	f8 ees d c bes4 r4 |
	c8 d e f g a bes a |
	g8 f e d c4 r4 | \break
	c8 d ees f g gis a4 |
	aes8 g f ees d c b4 |
	c8 d ees f g a bes4 |
	b,8 cis dis e fis gis a4 \bar "||" \break

	bes,8 c d ees f g a4 |
	f8 g a bes c d ees4 |
	bes,8 c d ees f g aes g |
	f8 ees d c bes4 r4 | \break
	ees8 f g aes bes c d c |
	bes aes g f ees4 r4 |
	aes8 bes c des ees f ges f |
	ees des c bes aes4 r4 | \break
	bes,8 c d ees f g a g |
	f8 ees d c bes4 r4 |
	c8 d e f g a bes a |
	g8 f e d c4 r4 | \break
	c8 d ees f g a bes4 |
	f8 g a bes c d ees4 |
	bes8 c d ees f g a g |
	f ees d c bes4 r4 \bar "||" \break

	fis8 gis ais b cis dis e dis |
	cis8 b ais gis fis4 r4 |
	b8 cis dis e fis gis ais gis |
	fis8 e dis cis b4 r4 | \break
	e,8 fis gis a b cis d cis |
	b8 a gis fis e4 r4 |
	a8 b cis d e fis gis fis |
	e8 d cis b a4 r4 | \break
	d,8 e fis g a b c b |
	a8 g fis e d4 r4 |
	g8 a b c d e fis e |
	d8 c b a g4 r4 | \break
	c,8 d e f g a bes a |
	g8 f e d c4 r4 |
	f8 g a bes c d e d |
	c bes a g f4 r4 \bar "||" \break

	bes,8 c d ees f g a4 |
	f8 g a bes c d ees4 |
	bes,8 c d ees f g aes g |
	f8 ees d c bes4 r4 | \break
	ees8 f g aes bes c d c |
	bes aes g f ees4 r4 |
	aes8 bes c des ees f ges f |
	ees des c bes aes4 r4 | \break
	bes,8 c d ees f g a g |
	f8 ees d c bes4 r4 |
	c8 d e f g a bes a |
	g8 f e d c4 r4 | \break
	c8 d ees f g a bes4 |
	f8 g a bes c d ees4 |
	bes8 c d ees f g a g |
	f ees d c bes4 r4 \bar "|." \break
}

theChords = \chordmode {
	bes1:6 |
	s2 f:aug7 |
	f1:min7 |
	bes1:7 |
	ees1:maj7 |
	ees1:maj7 |
	aes1:7 |
	aes1:7 |
	bes1:maj7 |
	bes1:maj7 |
	c1:7 |
	c1:7 |
	c1:min6 |
	d2:min7.5- g:7 |
	c1:min7 |
	f1:7 \bar "||"

	bes1:6 |
	s2 f:aug7 |
	f1:min7 |
	bes1:7 |
	ees1:maj7 |
	ees1:maj7 |
	aes1:7 |
	aes1:7 |
	bes1:maj7 |
	bes1:maj7 |
	c1:7 |
	c1:7 |
	c1:min7 |
	f1:7 |
	bes1:6 |
	bes1:6 \bar "||"

	cis1:min7 |
	fis1:7 |
	b1:6 |
	b1:6 |
	b1:min7 |
	e1:7 |
	a1:6 |
	a1:6 |
	a1:min7 |
	d1:7 |
	g1:6 |
	g1:6 |
	g1:min7 |
	c1:7 |
	c1:min7 |
	f1:aug7 \bar "||"

	bes1:6 |
	s2 f:aug7 |
	f1:min7 |
	bes1:7 |
	ees1:maj7 |
	ees1:maj7 |
	aes1:7 |
	aes1:7 |
	bes1:maj7 |
	bes1:maj7 |
	c1:7 |
	c1:7 |
	c1:min7 |
	f1:7 |
	bes1:6 |
	bes1:6 \bar "|."
}


\score {
	<<
		\new ChordNames \theChords
		\theMap
	>>
}
