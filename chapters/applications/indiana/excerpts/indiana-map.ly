\include "book-example.ily"

theMap = \relative c' {
	\key aes \major
	aes'8 bes c des ees f g4 |
	f,8 g a bes c d ees4 |
	bes8 c d ees f g aes g |
	f8 ees d c bes4 r4 | \break
	ees,8 f g aes bes c des c |
	bes aes g f ees4 r4 |
	aes8 bes c des ees f g4 |
	d,8 e fis g a b c4 \bar "||" \break

	des,8 ees f ges aes bes c4 |
	ges8 aes bes ces des es fes4 |
	aes,8 bes c des ees f g4 |
	f,8 g a bes c d ees4 | \break
	bes8 c d ees f g aes g |
	f8 ees d c bes4 r4 |
	ees,8 f g aes bes c des c |
	bes aes g f ees4 r4 | \break

	aes8 bes c des ees f g4 |
	f,8 g a bes c d ees4 |
	bes8 c d ees f g aes g |
	f8 ees d c bes4 r4 | \break
	ees,8 f g aes bes c des c |
	bes8 aes g f e4 r4 |
	f8 g aes bes c cis d4 |
	fis,8 gis ais b cis dis e4 | \break

	f,8 g aes bes c cis d4 |
	des8 c bes aes g f e4 |
	f8 g aes bes c cis d4 |
	bes8 c d ees f g aes4 | \break
	f,8 g a bes c d ees4 |
	ees,8 f g aes bes c des4 |
	aes8 bes c des ees f g f |
	ees8 des c bes aes4 r4 \bar "|."
}

theChords = \chordmode {
	aes1:6 |
	f1:7 |
	bes1:7 |
	bes1:7 |
	bes1:min7 |
	ees1:7 |
	aes1:maj7 |
	ees2:min7 d:7 |
	des1:maj7 |
	des2:min7 ges:7 |
	aes1:6 |
	f1:7 |
	bes1:7 |
	bes1:7 |
	bes1:min7 |
	ees1:7 |

	aes1:6 |
	f1:7 |
	bes1:7 |
	bes1:7 |
	g1:min7.5- |
	c1:7 |
	f1:min6 |
	c1:7 |
	f1:min6 |
	g2:min7.5- c:7 |
	f1:min6 |
	bes2:7 b:dim7 |
	c2:min7 f:7 |
	bes2:min7 ees:7 |
	aes1:6 |
	aes1:6 |
}

\score {
	<<
		\new ChordNames \theChords
		\theMap
	>>
}
