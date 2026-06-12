\include "book-example.ily"

theMap = \relative c' {
	\key des \major
	ees16 f ges aes bes c des8 ces16 bes aes ges f ees d8 |
	aes16 bes c des ees f ges f ees des c bes aes8 r8 |
	des16 ees f ges aes bes c8 des,16 ees fes ges aes bes c8 |
	des,16 ees f ges aes bes c bes aes ges f ees d8 r8 | \break
	ees16 f ges aes bes c des c bes aes ges f ees8 r8 |
	aes16 bes c des ees f ges f ees des c bes a8 r8 |
	bes16 c des ees f ges aes8 aes,16 bes c des ees f ges8 |
	des,16 ees f ges aes bes c8 ces16 bes aes ges f ees d8 \bar "||" \break

	ees16 f ges aes bes c des8 ces16 bes aes ges f ees d8 |
	aes16 bes c des ees f ges f ees des c bes aes8 r8 |
	des16 ees f ges aes bes c8 des,16 ees fes ges aes bes c8 |
	des,16 ees f ges aes bes c bes aes ges f ees d8 r8 | \break
	ees16 f ges aes bes c des c bes aes ges f ees8 r8 |
	aes16 bes c des ees f ges f ees des c bes a8 r8 |
	bes16 c des ees f ges aes8 aes,16 bes c des ees f ges8 |
	des,16 ees f ges aes bes c8 a16 b cis d e fis g8 \bar "||" \break

	\set Staff.explicitKeySignatureVisibility = #end-of-line-invisible
	\set Staff.printKeyCancellation = ##f
	\key d \major
	d,16 e fis g a b cis b a g fis e d8 r8 |
	d16 e fis g a b cis8 c,16 d e f g a bes8 |
	cis16 b a g fis e dis8 b'16 a g fis e d cis8 |
	d16 e fis g a b cis b a g fis e d8 r8 | \break
	g16 a b c d e f e d c b a g8 r8 |
	c,16 d e f g a b a g f e d c8 r8 |
	g'16 a b c d e f e d c b a g8 r8 |
	c,16 d e f g a bes8 bes,16 c d ees f g aes8 | \break

	\set Staff.explicitKeySignatureVisibility = #end-of-line-invisible
	\set Staff.printKeyCancellation = ##f
	\key des \major
	ees16 f ges aes bes c des8 ces16 bes aes ges f ees d8 |
	aes16 bes c des ees f ges f ees des c bes aes8 r8 |
	des16 ees f ges aes bes c8 des,16 ees fes ges aes bes c8 |
	des,16 ees f ges aes bes c bes aes ges f ees d8 r8 | \break
	ees16 f ges aes bes c des c bes aes ges f ees8 r8 |
	aes16 bes c des ees f ges f ees des c bes a8 r8 |
	bes16 c des ees f ges aes8 aes,16 bes c des ees f ges8 |
	des,16 ees f ges aes bes c8 ces16 bes aes ges f ees d8 \bar "|." \break
}

theChords = \chordmode {
	ees2:min7 bes:7 |
	ees2:min7 aes:7 |
	des2:maj7 ges:7 |
	f2:min7 e:dim7 |
	ees1:min7 |
	c2:min7.5- f:7 |
	bes2:min7 ees4:min7 aes:7 |
	des2:6 bes:7 |

	ees2:min7 bes:7 |
	ees2:min7 aes:7 |
	des2:maj7 ges:7 |
	f2:min7 e:dim7 |
	ees1:min7 |
	c2:min7.5- f:7 |
	bes2:min7 ees4:min7 aes:7 |
	des2:6 e4:min7 a:7 |

	d2:6 e:min7 |
	d2/fis  g4:min7 c:7 |
	fis4:min7 b:min7 e:min7 a:7 |
	d1:6 |
	d2:min7 g:7 |
	c2:maj7 ees:min7 |
	d2:min7 g:7 |
	c4:7 b:7 bes2:7 |

	ees2:min7 bes:7 |
	ees2:min7 aes:7 |
	des2:maj7 ges:7 |
	f2:min7 e:dim7 |
	ees1:min7 |
	c2:min7.5- f:7 |
	bes2:min7 ees4:min7 aes:7 |
	des1:6 |
}

\score {
	<<
		\new ChordNames \theChords
		\theMap
	>>
}
