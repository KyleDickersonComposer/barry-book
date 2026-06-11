title = #"Anthropology"
composer = #"Charlie Parker"
meter = #"(Fast)"
\include "real-book-chart.ily"

global = {
	\key bes \major
	\partial 8
}

theTune = \relative c' {
	\global
	f,8 |

	bes8 d c bes ees cis d f |
	r4 r8 ees r8 f ees4 |
	r8 d8 ees d c a bes d |
	c8 g bes a r4 r8 bes~ | \break
	bes4 g8 bes d bes r8 e8~ |
	e ees4 ges,8~ ges8 bes c d |
	f4 r8 bes,8 r8 aes'4 fis8 |
	g8 ees bes g d' f r8 f,8 \bar "||" \break

	bes8 d c bes ees cis d f |
	r4 r8 ees r8 f ees4 |
	r8 d8 ees d c a bes d |
	c8 g bes a r4 r8 bes~ | \break
	bes4 g8 bes d bes r8 e8~ |
	e ees4 ges,8~ ges8 bes c d |
	\tuplet 3/2 {ees8 f ees} d f r8 d ees g, |
	c8 g bes c r4 r8 fis8~ \bar "||" \break

	fis4 g8 gis a fis g a |
	fis8 d  r4 r4 r8 e|
	f8 e d b e d b a |
	r4 r8 a'8~ a8 a4 a8~ | \break
	a8 g e d~ d4. g,8 |
	\tuplet 3/2 {c16 d c} g8 bes c r4 r8 ees~ |
	ees4 d8 c bes d c g |
	c4 bes8 a r4 r8 f8 \bar "||" \break

	bes8 d c bes ees cis d f |
	r4 r8 ees r8 f ees4 |
	r8 d8 ees d c a bes d |
	c8 g bes a r4 r8 bes~ | \break
	bes4 g8 bes d bes r8 e8~ |
	e ees4 ges,8~ ges8 bes c d |
	\tuplet 3/2 {ees8 f ees} d f r8 d ees g, |
	c8 bes a bes r2 \bar "|." \break
}

theChords = \chordmode {
	\global
	s8

	bes1:6 |
	c2:min7 f:7 |
	d2:min7 g:7 |
	c2:min7 f:7 |
	bes1:7 |
	ees1:7 |
	d2:min7 g:7 |
	c2:min7 f:7 |

	bes1:6 |
	c2:min7 f:7 |
	d2:min7 g:7 |
	c2:min7 f:7 |
	bes1:7 |
	ees1:7 |
	bes1:6 |
	bes1:6 |

	d1:7 |
	d1:7 |
	g1:7 |
	g1:7 |
	c1:7 |
	c1:7 |
	f1:7 |
	f1:7 |

	bes1:6 |
	c2:min7 f:7 |
	d2:min7 g:7 |
	c2:min7 f:7 |
	bes1:7 |
	ees1:7 |
	bes1:6 |
	bes1:6 |
}

\score {
	<<
		\new ChordNames \theChords
		\theTune
	>>
}
