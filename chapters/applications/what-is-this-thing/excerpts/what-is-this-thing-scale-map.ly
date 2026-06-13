\include "book-example.ily"

theMap = \relative c' {
	ees8 f g aes bes c des c |
	bes8 aes g f e4 r4 |
	f8 g aes bes c cis d des |
	c8 bes aes g f4 r4 | \break
	bes,8 c d ees f g aes g |
	f8 ees d c b4 r4 |
	c8 d e f g a b a |
	g8 f e d c4 r4 | \break
	ees8 f g aes bes c des c |
	bes8 aes g f e4 r4 |
	f8 g aes bes c cis d des |
	c8 bes aes g f4 r4 | \break
	bes,8 c d ees f g aes g |
	f8 ees d c b4 r4|
	c8 d e f g a b4 |
	c,8 d e f g a bes4 | \break
	f8 g a bes c d ees d |
	c8 bes a g f4 r4 |
	bes,8 c d ees f g aes g |
	f8 ees d c b4 r4 | \break
	aes8 bes  c des ees f g4 |
	d8 e fis g a b c4 |
	g8 a b c d e f e |
	d c b a g4 r4 | \break
	ees8 f g aes bes c des c |
	bes8 aes g f e4 r4 |
	f8 g aes bes c cis d des |
	c8 bes aes g f4 r4 | \break
	bes,8 c d ees f g aes g |
	f8 ees d c b!4 r4 |
	c8 d e f g a b a |
	g8 f e d c4 r4 \bar "|." \break
}

theChords = \chordmode {
	g1:m7.5- |
	c1:7 |
	f1:min7 |
	f1:m6 |
	d1:m7.5- |
	g2:7 des2:7 |
	c1:maj7 |
	c1:6 |
	g1:m7.5- |
	c1:7 |
	f1:min7 |
	f1:m6 |
	d1:m7.5- |
	g2:7 des:7 |
	c1:6 |
	g2:min7 c:7 |
	c1:m7/f |
	f1:7 |
	bes1:maj7 |
	bes1:6 |
	aes1:6 |
	d1:7 |
	d1:min7/g |
	des1:7 |
	g1:m7.5- |
	c1:7 |
	f1:min7 |
	f1:m6 |
	d:m7.5- |
	des:7 |
	c:6 |
}

\score {
	<<
		\new ChordNames \theChords
		\theMap
	>>
}
