title = #"Ornithology"
composer = #"Charlie Parker"
meter = #" (Med.)"
\include "real-book-chart.ily"

global = {
	\key g \major
	\partial 8
}

theTune = \relative c' {
	\global
	d8

	g8 a b c d b c d |
	b8 g r4 r4 r8 d |
	g8 a bes c d8 e4 f8 |
	r8 g, a bes~ bes4. d8 | \break
	c8 a4 f8 bes8 gis a f |
	r2 r4 r8 aes8~ |
	aes4 g8 f e g f c |
	f4 ees8 d r4 r8 des'8~ | \break
	des4 c8 bes a c bes g |
	a4 g8 fis r4 r8 d |
	a'8 g d bes f'4 es8 d |
	r2 r8 b'8 c d~ | \break
	d8 r4 b8~ b a4 g8 |
	gis8 b d f~ f4 e8 c~ |
	c r4 a8~ a g4 f8 |
	fis!8 a c ees~ ees4 d8 d, \bar "||" \break

	g8 a b c d b c d |
	b8 g r4 r4 r8 d |
	g8 a bes c d8 e4 f8 |
	r8 g, a bes~ bes4. d8 | \break
	c8 a4 f8 bes8 gis a f |
	r2 r4 r8 aes8~ |
	aes4 g8 f e g f c |
	f4 ees8 d r4 r8 des'8~ | \break
	des4 c8 bes a c bes g |
	a4 g8 fis r4 r8 d |
	a'8 g d b f'4 ees8 d |
	r2 r4 r8 bes'8 | \break
	b8 d fis d f des bes aes |
	a8 c e  c ees ces aes ges |
	g!8 r8 r4 r2 |
	r1 \bar "|."
}

theChords = \chordmode {
	\global
	s8

	g1:6 |
	g1:6 |
	g1:min7 |
	c1:7 |
	f1:6 |
	f1:6 |
	f1:min7 |
	bes1 :7 |
	ees1:7 |
	a2:min7.5- d:7 |
	g1:min6
	d1:7 |
	b1:min7 |
	e1: 7 |
	a1:min7 |
	d1:7 |


	g1:6 |
	g1:6 |
	g1:min7 |
	c1:7 |
	f1:6 |
	f1:6 |
	f1:min7 |
	bes1 :7 |
	ees1:7 |
	a2:min7.5- d:7 |
	g1:6 |
	d1:7 |
	b2:min7 e:7 |
	a2:min7 d:7 |
	g1:6|
	g1:6|
}

\score {
	<<
		\new ChordNames \theChords
		\theTune
	>>
}
