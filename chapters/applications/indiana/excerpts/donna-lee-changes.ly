title = #"Donna Lee"
composer = #"Charlie Parker"
meter = #"(Fast)"

\include "real-book-chart.ily"

global = {
	\key aes \major
}

theTune = \relative c'' {
	\global
	r2 \tuplet 3/2 {g'8 aes g} f8 e |
	ees!8 des c bes a c, ees f |
	\tuplet 3/2 {ges8 aes ges} f8 ees d f aes c |
	g8 f r4 r4 e8 d | \break
	ees8 a, bes des f aes c ees |
	des8 f, aes c b8 g16 e ees8 des |
	c8 es g bes aes4 ees8 f |
	ges8 bes des f e c r4 | \break
	ees2~ ees8 des c bes |
	ees8 des r4 ges8 fes ees des |
	c8 c des d ees  des c bes |
	a8 c ees f \tuplet 3/2 {ges8 aes ges} f8 ees | \break
	d8 c b a bes aes c, ees |
	\tuplet 3/2 {g8 ges f} e4 r2 |
	ees'8 des f, aes c bes f aes |
	g8 bes des bes \tuplet 3/2 {e8 fis e} ees8 des | \break
	c4 r4 \tuplet 3/2 {g'8 aes g} f8 e |
	ees!8 des c bes a c, ees f |
	\tuplet 3/2 {ges8 aes ges} f8 ees d f aes c |
	g8 f r4 r4 g8 f | \break
	e8 f g aes bes aes g f |
	\tuplet 3/2 {des' es des} c8 bes \tuplet 3/2 {aes8 bes aes} g8 e |
	f4 r4 r2 |
	r2 r4 r8 b8 | \break
	c8 b c des d cis d ees |
	e8 dis e dis d des c bes |
	\tuplet 3/2 {aes8 bes aes} g aes bes aes g f |
	b,8 d f aes b g' f e | \break
	ees8 des c bes a ges f ees |
	des8 f aes c bes aes g ees |
	aes4 r4 r2 |
	r1 \bar "|."
}

theChords = \chordmode {
	\global

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
		\theTune
	>>
}
