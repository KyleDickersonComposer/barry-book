title = #"Indiana"
composer = #"James F. Hanley"
meter = #"(Med.)"

\include "real-book-chart.ily"

global = {
	\key aes \major
}

theTune = \relative c' {
	\global
	r8 ees4. aes4 c |
	ees1~ |
	ees8 f4. ees4 c |
	bes4. f8~ f2~ |
	f2 g4 aes | \break
	c2. g4 |
	c2. bes4 |
	aes1 |
	r8 aes4. g4 ges \bar "||" \break

	f4 aes8 des~ des2~ |
	des2 f,2 |
	ees4 aes8 c~ c2~ |
	c2 c4 des | \break
	d4 c8 g~ g2~ |
	g2 f |
	bes1 |
	r8 ees,4. aes4 c  \bar "||" \break

	ees1~ |
	ees8 f4. ees4 c |
	bes4. f8~ f2~ |
	f2 g4 aes | \break
	c2. g4 |
	c2. bes4 |
	aes1~ |
	aes4 r4 aes bes | \bar "||" \break

	c4 b c aes |
	bes4 c bes g |
	aes4. f8~ f2~ |
	f4 r4 g f | \break
	ees2 aes4 c |
	ees bes des c |
	aes1~ |
	aes4 r4 r2 \bar "|."
	
}

theChords = \chordmode {
	s1 |

	aes2:6 ges:7 |
	f1:7 |
	bes1:7 |
	bes1:7 |
	ees1:7 |
	ees1:7 |
	aes1:6 |
	s2. aes4:7 |

	des1:6 |
	des1:6 |
	aes2:6 ges:7 |
	f1:7 |
	bes1:7 |
	bes1:7 |
	bes1:min7 |
	ees1:7 |

	aes2:6 ges:7 |
	f1:7 |
	bes:7 |
	bes:7 |
	c1:7
	g2:min7.5- c:7 |
	f1:min6
	d1:dim7 |

	aes:6/ees |
	g2:min7.5- c:7 |
	f1:min6 |
	d1:dim7 |
	aes1:6/ees |
	bes2:min7 ees:7|
	aes1:6 |
	aes1:6 |
}

\score {
	<<
		\new ChordNames \theChords
		\theTune
	>>
}
