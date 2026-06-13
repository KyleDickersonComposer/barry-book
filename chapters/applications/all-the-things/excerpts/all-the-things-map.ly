\include "book-example.ily"

theMap = \relative c' {
	\key aes \major

	f8 g aes bes c des ees4 |
	bes8 c des ees f g aes4 |
	ees,8 f g aes bes c des4 |
	aes8 bes c des ees f g4 | \break
	des,8 ees f g aes bes c4 |
	g8 a b c d e f4 |
	c,8 d e f g a b a |
	g8 f e d c4 r4 \bar "||" \break

	c8 d ees f g aes bes4 |
	f8 g aes bes c des ees4 |
	bes,8 c des ees f g aes4 |
	ees8 f g aes ees f g4 | \break
	aes8 bes c des ees f g4 |
	ees8 d c bes a g fis4 |
	g8 a b c d e fis4 |
	e,8 fis gis a b cis d4 \bar "||" \break

	f,8 g a bes c d ees d |
	c8 bes a g fis4 r4 |
	g8 a b c d e fis e |
	d8 c b a g4 r4 | \break
	d8 e fis g a b cis b |
	a8 g fis e dis4 r4 |
	e8 fis gis a b cis dis4 |
	aes8 bes c des ees f ges4 \bar "||" \break

	f,8 g aes bes c des ees4 |
	bes8 c des ees f g aes4 |
	ees,8 f g aes bes c des4 |
	aes8 bes c des ees f g4 | \break
	des,8 ees f g aes bes c4 |
	ges8 aes bes ces des ees fes4 |
	c,8 d ees f g aes bes4 |
	aes8 g f ees d c b4 |
	bes8 c des ees f g aes4 |
	ees8 f g aes bes c des4 |
	aes8 bes c des ees f g f |
	ees8 des c bes aes4 r4 \bar "|."
}

theChords = \chordmode {
	f1:m7 |
	bes1:m7 |
	ees1:7 |
	aes1:maj7 |
	des1:maj7 |
	g1:7 |
	c1:6 |
	c1:6 |
	c1:m7 |
	f1:m7 |
	bes1:7 |
	ees1:maj7 |
	aes1:maj7 |
	a2:m7.5- d:7 |
	g1:maj7 |
	g2:maj7 e:7 |
	a1:m7.5- |
	d1:7 |
	g1:maj7 |
	g1:maj7 |
	fis1:m7.5- |
	b1:7 |
	e1:maj7 |
	c1:aug7 |
	f1:m7 |
	bes1:m7 |
	ees1:7 |
	aes1:maj7 |
	des1:maj7 |
	ges1:7 |
	c1:m7 |
	b1:dim7 |
	bes1:m7 |
	ees1:7 |
	aes:6 |

}

\score {
	<<
		\new ChordNames \theChords
		\theMap
	>>
}
