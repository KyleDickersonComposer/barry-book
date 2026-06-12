\include "book-example.ily"

theMap = \relative c' {
	f8 g aes bes c cis d4 |
	c,8 d e f g a b4 |
	f8 g aes bes c cis d4 |
	g,8 a b c d e f4 | \break
	c,8 d e f g a b a |
	g8 f e d c4 r4 |
	c8 d e f g a bes a |
	g8 f e d c4 r4 \bar "||" \break
	f8 g a bes c d e d |
	c8 bes a g f4 r4 |
	f'8 e d c b a gis4 |
	a8 b c d e eis fis4 | \break
	d,8 e fis g a b cis b |
	a8 g fis e dis4 r4 |
	e8 fis gis a b cis d4 |
	c8 bes a g f d cis4 \bar "||" \break
	a8 b c d e eis fis4 |
	c8 d e f g a b4 |
	f8 g aes bes c cis d4 |
	c,8 d e f g a b4 | \break
	f'8 e d c b a gis4 |
	a8 b c d e eis fis4 |
	c8 b a g fis e dis4 |
	e8 fis gis a b cis dis4 | \break
	f,8 g aes bes c cis d4 |
	c,8 d e f g a b4 |
	c,8 d e f g a b a |
	g8 f e d cis4 r4 |
	d8 e fis g a b c4 |
	g8 a b c d e f4 |
	c,8 d e f g a b a |
	g8 f e d c4 \bar "|." \break
}

theChords = \chordmode {
	f1:m6 |
	c1:maj7
	f1:m6 |
	g1:7 |
	c1:6 |
	c1:6 |
	g1:min7 |
	c1:7 |

	f1:maj7 |
	f1:maj7 |
	b2:min7.5- e:7 |
	a1:min6 |
	fis1:min7.5- |
	b1:7 |
	b2:min7 e:7 |
	e2:min7.5- a:7 |

	fis2:min7.5- f:dim7 |
	c2:/e ees:dim7 |
	d1:min7.5- |
	c1:/e |
	b2:min7.5- e:7 |
	a1:min6 |
	fis2:min7.5- b:7 |
	e2:maj7 d4:min7 g4:7 |

	f1:m6 |
	c1:maj7 |
	e1:min7.5- |
	a1:7 |
	d1:7 |
	d2:min7 g2:7 |
	c1:6 |
	c1:6 |
}

\score {
	<<
		\new ChordNames \theChords
		\theMap
>>
}
