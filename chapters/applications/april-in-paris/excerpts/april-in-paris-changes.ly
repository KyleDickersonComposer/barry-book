title = #"April in Paris"
composer = #"Vernon Duke"
meter = #" (Med. Swing)"

\include "real-book-chart.ily"

global = {
	\key c \major
}

theTune = \relative c' {
	\tuplet 3/2 {f4 f f} dis4 e~ |
	e1 |
	\tuplet 3/2 {f4 f f} dis4 e~ |
	e1 | \break
	\tuplet 3/2 {d4 d d} b4 c~ |
	c4 e g b |
	d1~ |
	d2 r2 \bar "||" \break

	\tuplet 3/2 {d4 d d} b4 c~ |
	c1 |
	\tuplet 3/2 {d4 d d} b4 c~ |
	c1 | \break
	\tuplet 3/2 {c4 c c} a4 b~ |
	b2 c |
	e1~ |
	e1 \bar "||" \break

	e2 d8 ais b d |
	c4 c e2 |
	d8 ais b d c4 c |
	c1 | \break
	e2 d8 ais b d |
	c4 c c2 |
	c8 gis a c b4 b |
	gis2 g \bar "||" \break

	\tuplet 3/2 {f4 f f} dis4 e~ |
	e1 |
	\tuplet 3/2 {bes'4 bes bes} gis4 a~ |
	a1 | \break
	\tuplet 3/2 {d4 d d} b4 c~ |
	c2 d |
	c1~ |
	c4 r4 r2 \bar "|."
}

theChords = \chordmode {
	f1:m6 |
	c1:maj7
	f1:m6 |
	g1:7 |
	c1:6 |
	c1:6 |
	g1:min7 |
	c1:7 |

	f1:maj7 |
	f1:maj7 |
	b2:min7.5- e:7 |
	a1:min6 |
	fis1:min7.5- |
	b1:7 |
	b2:min7 e:7 |
	e2:min7.5- a:7 |

	f2:min7.5- f:dim7 |
	c:2/e ees:dim7 |
	d1:min7.5- |
	c:1/e |
	b2:min7.5- e:7 |
	a1:min6 |
	f2:min7.5- b:7 |
	e2:maj7 d4:min7 g4:7 |

	f1:m6 |
	c1:maj7 |
	e1:min7.5- |
	a1:7 |
	d1:7 |
	d2:min7 g2:7 |
	c1:6 |
	c1:6 |
}

\score {
	<<
		\new ChordNames \theChords
		\theTune
	>>
}
