title = #"Confirmation"
composer = #"Charlie Parker"
meter = #" (Med. Swing)"
\include "real-book-chart.ily"

theNotes = \relative c' {
	\key f \major
	\partial 8
	c8 |

	a'8 c4 a8 bes a \tuplet 3/2 {e8 f fis}
	g8 d' \tuplet 3/2 {bes16 c bes} g8 a8 cis,4 g'8~ |
	g8 f4. r4 r8 a8 |
	g8 bes \tuplet 3/2 {a16 bes a} g8 r8 f4 bes8 | \break
	b8 bes \tuplet 3/2 {aes16 bes aes} f8 bes aes4. |
	r8 c \tuplet 3/2 {bes16 c bes} g8  fis8 a d, b'~ |
	b4 e8 a, r4 r8 e'16 d |
	des8 f, g e r8 c'4. \bar "||" \break

	a4 r8 f \tuplet 3/2 {bes8 a bes16 aes} g8 a |
	f16 g ees8~ ees4 r8 cis4 g'8~ |
	g8 f4. r4 r8 a8 |
	g8 bes \tuplet 3/2 {a16 bes a} g8 f cis f f~ | \break
	f8 aes bes f aes bes r4 |
	r8 d,8 g bes \tuplet 3/2 {a16 bes a} fis8 r4 |
	g8 bes \tuplet 3/2 {a16 bes a} g8 c aes a f |
	r2 r8 d'4. \bar "||" \break

	c8 r8 r16 g ees c b'8 g4 g8 |
	bes8 c16 bes g8 ees aes ges r4 |
	a8 g a g~ g4. g8 |
	r2 r4 r8 bes8 | \break
	des8 ees,16 bes' c bes ges8~ ges aes f e |
	\tuplet 3/2 {ees4 aes aes} aes8 aes r8 ges16 e |
	\tuplet 3/2 {f8 aes c} ees8 d16 b des bes r8 r4 |
	r8 g des f aes e d c \bar "||" \break

	r8 c'4. bes8 a \tuplet 3/2 {e8 f fis} |
	g8 d' \tuplet 3/2 {bes16 c bes} g8 a8 cis,4 g'8~ |
	g8 f4. r4 r8 a |
	g8 bes \tuplet 3/2 {a16 bes a } g8 r8 f4 bes8 | \break
	b8 bes \tuplet 3/2 {aes16 bes aes} f8 bes a4. |
	r8 c8 \tuplet 3/2 {bes16 c bes} aes8 a cis, d f~ |
	f4 f8 a r8 f4. |
	f4 r4 r2 \bar "|."
}

theChords = \chordmode {
	\partial 8
	s8 |

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
	d:m6 |
	c2:m7 f:7 |
	bes1:7 |
	a2:m7 d:7 |
	g2:m7 c:7 |
	f1:6 |
}

\score {
	<<
		\new ChordNames \theChords
		\new Voice = soloist \theNotes
	>>
}
