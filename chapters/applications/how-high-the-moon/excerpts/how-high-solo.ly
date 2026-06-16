\include "book-example.ily"

global = {
	\key g \major
}

theSolo = \relative c' {
	\global
	r8 fis g b gis a c ais
	b8 d dis e c cis d4 |
	r4 a'8 ges \tuplet 3/2 {g16 a g} fis8 f d |
	bes8 dis e des bes b c a | \break
	f8 a bes8 g e gis a4 |
	r8 d, dis e g f fis g |
	aes8 c, ees g8~ g4 r8 f |
	ges8 b,! d f8~ f8 ees4 cis8 | \break
	d8 ees f g f fis g bes |
	aes a bes b c cis d dis |
	e8 ees d e~ e8 d8 r8 \tuplet 3/2 {d,16 des c}|
	b8 d fis! g gis a ais c | \break
	b4. \tuplet 3/2 {c16 b ais} b8 g8 r8 cis |
	d8 b g e cis' c4 b8 |
	c8 b g e b' ais4 b8 |
	a8 fis g a8~ a8 bes4 r8 \bar "||" \break

	b8 gis a c b ais b8 d,8~ |
	d2 d'4 des |
	c8 b bes c a aes g4 |
	bes8 g gis ais b cis d dis | \break
	e4. dis8 e8 ees d4 |
	r8 gis, \tuplet 3/2 {a8 c e} g8 ges f e |
	ees8 f d des c ces bes a |
	aes8 eis fis gis a b c cis | \break
	d4. cis8 d8 c4 r8 |
	r8 d, \tuplet 3/2 {ees8 g b} d8 des c ais |
	c8 b ais b8~ b4 r8 d8 |
	a8 ais b d fis g gis4 | \break
	d,8 dis e g b bis cis4 |
	g8 gis a c e eis fis4 |
	g8 fis e dis fis e4 dis8 |
	e4 r4 r2 \bar "|."
}

theChords = \chordmode {
	\global
	g1:6 |
	g:6 |
	g:m7 |
	c:7 |
	f:6 |
	f:6 |
	f:m7 |
	bes:7 |
	ees:maj7 |
	a2:m7.5- d:7 |
	g1:m6
	a2:m7.5- d:7 |
	g1:6 |
	e:7 |
	a1:m7 |
	d1:7 |

	g1:6 |
	g:6 |
	g:m7 |
	c:7 |
	f:6 |
	f:6 |
	f:m7 |
	bes:7 |
	ees:maj7 |
	a2:m7.5- d:7 |
	g1:6
	e1:7
	a1:7
	d1:7
	g1:6 |
	a2:m7 d:7 |
}

\score {
	<<
		\new ChordNames \theChords
		\theSolo
	>>
}
