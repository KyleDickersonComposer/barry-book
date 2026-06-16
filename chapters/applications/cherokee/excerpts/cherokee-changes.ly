title = #"Cherokee"
composer = #"Ray Noble"
meter = #"(Fast)"

\include "real-book-chart.ily"

global = {
	\key bes \major
}

theTune = \relative c' {
	d1 |
	f2 g |
	bes1 |
	g1 |
	f1 |
	d2 f |
	d1 |
	c1 | \break
	bes1 |
	d2 f |
	d'1 |
	bes1 |
	g1 |
	f2 d |
	c1 |
	cis1 \bar "||" \break

	d1 |
	f2 g |
	bes1 |
	g1 |
	f1 |
	d2 f |
	d1 |
	c1 | \break
	bes1 |
	d2 f |
	d'1 |
	bes1 |
	g1 |
	d1 |
	bes1~ |
	bes1 \bar "||" \break

	dis'1~ |
	dis2 cis |
	cis4 ais fis2~ |
	fis2 cis' |
	cis4 a fis2~ |
	fis2 b |
	e,1~ |
	e1 | \break
	b'1~ |
	b2 a |
	a4 fis d2~ |
	d2 a' |
	a4 f d2~ |
	d2 g |
	c,1 |
	cis1 \bar "||" \break

	d1 |
	f2 g |
	bes1 |
	g1 |
	f1 |
	d2 f |
	d1 |
	c1 | \break
	bes1 |
	d2 f |
	d'1 |
	bes1 |
	g1 |
	d1 |
	bes1~ |
	bes1 \bar "||" \break
}

theChords = \chordmode {
	bes1:6 |
	s2 f:aug7 |
	f1:min7 |
	bes1:7 |
	ees1:maj7 |
	ees1:maj7 |
	aes1:7 |
	aes1:7 |
	bes1:maj7 |
	bes1:maj7 |
	c1:7 |
	c1:7 |
	c1:min6 |
	d2:min7.5- g:7 |
	c1:min7 |
	f1:7 \bar "||"

	bes1:6 |
	s2 f:aug7 |
	f1:min7 |
	bes1:7 |
	ees1:maj7 |
	ees1:maj7 |
	aes1:7 |
	aes1:7 |
	bes1:maj7 |
	bes1:maj7 |
	c1:7 |
	c1:7 |
	c1:min7 |
	f1:7 |
	bes1:6 |
	bes1:6 \bar "||"

	cis1:min7 |
	fis1:7 |
	b1:6 |
	b1:6 |
	b1:min7 |
	e1:7 |
	a1:6 |
	a1:6 |
	a1:min7 |
	d1:7 |
	g1:6 |
	g1:6 |
	g1:min7 |
	c1:7 |
	c1:min7 |
	f1:aug7 \bar "||"

	bes1:6 |
	s2 f:aug7 |
	f1:min7 |
	bes1:7 |
	ees1:maj7 |
	ees1:maj7 |
	aes1:7 |
	aes1:7 |
	bes1:maj7 |
	bes1:maj7 |
	c1:7 |
	c1:7 |
	c1:min7 |
	f1:7 |
	bes1:6 |
	bes1:6 \bar "|."
}

\score {
	<<
		\new ChordNames \theChords
		\theTune
	>>
}
