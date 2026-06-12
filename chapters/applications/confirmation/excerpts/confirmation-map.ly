\include "book-example.ily"

theMap = \relative c' {
	\key f \major
	f8 g a bes c d e4 |
	a,8 b cis d e fis g4 |
	d,8 e f g a ais b4 |
	f8 g a bes c d ees4 | \break
	bes8 c d ees f g aes4 |
	d,,8 e fis g a b c4 |
	g8 a b c d e f4 |
	c,8 d e f g a bes4 \bar "||"

	f8 g a bes c d e4 |
	a,8 b cis d e fis g4 |
	d,8 e f g a ais b4 |
	f8 g a bes c d ees4 | \break
	bes8 c d ees f g aes4 |
	d,,8 e fis g a b c4 |
	c,8 d e f g a bes4 |
	f8 g a bes c d e4 | \bar "||"

	c,8 d ees f g gis a4 |
	f,8 g a bes c d ees4 |
	bes8 c d ees f g a g |
	f8 ees d c bes4 r4 | \break
	aes8 bes c des ees f ges f |
	ees8 des c bes aes4 r4 |
	des8 ees f ges aes bes c4 |
	fis,8 gis ais b cis dis e4 \bar "||"

	f,8 g a bes c d e4 |
	a,8 b cis d e fis g4 |
	d,8 e f g a ais b4 |
	f8 g a bes c d ees4 | \break
	bes8 c d ees f g aes4 |
	d,,8 e fis g a b c4 |
	c,8 d e f g a bes4 |
	f8 g a bes c d e4 | \bar "|."
}

theChords = \chordmode {
	f1:6 |
	e2:m7.5- a:7 |
	d1:m6 |
	c2:m7 f:7 |
	bes1:7 |
	a2:m7 d:7 |
	g1:7
	c1:7 |

	f:6 |
	e2:m7.5- a:7 |
	d1:m6 |
	c2:m7 f:7 |
	bes1:7 |
	a2:m7 d:7 |
	g2:m7 c:7 |
	f1:6 |

	c1:m6 |
	c2:m7 f:7 |
	bes1:6 |
	bes1:6 |
	ees1:m7 |
	aes1:7 |
	des1:maj7 |
	g2:m7 c:7 |

	f1:6 |
	e2:m7.5- a:7 |
	d1:m6 |
	c2:m7 f:7 |
	bes1:7 |
	a2:m7 d:7 |
	g2:m7 c:7 |
	f1:6 |
}

\score {
	<<
		\new ChordNames \theChords
		\theMap
	>>
}
