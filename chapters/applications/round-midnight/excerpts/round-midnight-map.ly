\include "book-example.ily"

theMap = \relative c' {
	\key ees \major
	ees16 f ges aes bes b c ces bes aes ges f ees8 r8 |
	aes16 bes c des ees f ges8 des,16 ees f ges aes bes ces8 | \break
	ees,16 f ges aes bes b c ces bes aes ges f ees8 r8 |
	e16 fis gis a b cis d8 ees,16 f g aes bes c des8 | \break
	des,16 ees f ges aes bes ces bes aes ges f ees des8 r8 |
	aes16 bes c des ees f ges f ees des c bes aes8 r8 | \break
	ees'16 f ges aes bes b c ces bes aes ges f ees8 r8 |
	bes'16 c d ees f g aes g f ees d c bes8 r8 \bar "||" \break

	ees,16 f ges aes bes b c ces bes aes ges f ees8 r8 |
	aes16 bes c des ees f ges8 des,16 ees f ges aes bes ces8 | \break
	ees,16 f ges aes bes b c ces bes aes ges f ees8 r8 |
	e16 fis gis a b cis d8 ees,16 f g aes bes c des8 | \break
	des,16 ees f ges aes bes ces bes aes ges f ees des8 r8 |
	aes16 bes c des ees f ges f ees des c bes aes8 r8 | \break
	ees'16 f ges aes bes b c8 bes,16 c d ees f g aes8 |
	ees16 f g aes bes c d c bes aes g f ees8 r8 \bar "||" \break
	
	ees16 f ges aes bes b c ces bes aes ges f ees8 r8 |
	bes'16 c d ees f g aes g f ees d c bes8 r8 | \break
	ees,16 f ges aes bes b c ces bes aes ges f ees8 r8 |
	bes16 c d ees f g aes g f ees d c bes8 r8 | \break
	aes16 bes ces des ees f ges8 bes,16 c d ees f g aes8 |
	aes,16 bes c des ees f ges f ees des c bes a8 r8 | \break
	des16 ees f ges aes bes ces8 ces,16 des ees fes ges aes beses8 |
	aes16 bes ces des ees f ges8 bes,16 c d ees f g aes8 \bar "||" \break

	ees,16 f ges aes bes b c ces bes aes ges f ees8 r8 |
	aes16 bes c des ees f ges8 des,16 ees f ges aes bes ces8 | \break
	ees,16 f ges aes bes b c ces bes aes ges f ees8 r8 |
	e16 fis gis a b cis d8 ees,16 f g aes bes c des8 | \break
	des,16 ees f ges aes bes ces bes aes ges f ees des8 r8 |
	aes16 bes c des ees f ges f ees des c bes aes8 r8 | \break
	ees'16 f ges aes bes b c8 bes,16 c d ees f g aes8 |
	ees16 f g aes bes c d c bes aes g f ees8 r8 \bar "|." \break
}

theChords = \chordmode {
	ees2:min/d ees2:min/des
	c2:dim7 aes4:min7 des:7 |
	c1:min7.5- |
	b4:min7 e:7 bes:min7 ees:7 |
	aes2:min7 des:7 |
	ees2:min7 aes:7.5- |
	c4:min7.5- b4:7.5- s2 |
	bes1:7.5- |

	ees2:min/d ees2:min/des
	c2:dim7 aes4:min7 des:7 |
	c1:min7.5- |
	ces4:min7 fes:7 bes:min7 ees:7 |
	aes2:min7 des:7 |
	ees2:min7 aes:7.5- |
	c4:min7.5- b:7.5- bes2:7 |
	ees1:6

	c2:min7.5- b:7.5- |
	bes1:7.5- |
	c2:min7.5- b:7.5- |
	bes1:7.5- |
	aes2:min7 f4:min7 bes:7 |
	c2:min7.5- f:7 |
	des2:7  ces:7 |
	aes2:min7 f4:min7 bes:7 |

	ees2:min/d ees2:min/des
	c2:dim7 aes4:min7 des:7 |
	c1:min7.5- |
	b4:min7 e:7 bes:min7 ees:7 |
	aes2:min7 des:7 |
	ees2:min7 aes:7.5- |
	c4:min7.5- b:7.5- bes2:7 |
	ees1:6
}

\score {
	<<
		\new ChordNames \theChords
		\theMap
	>>
}
