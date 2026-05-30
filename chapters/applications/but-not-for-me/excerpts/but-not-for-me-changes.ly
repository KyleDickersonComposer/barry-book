title = #"But Not For Me"
composer = #"George Gershwin"
meter = #" (Med. Swing)"
\include "real-book-chart.ily"

theNotes = \relative c' {
	\key ees \major

	\partial 2.
	f4 g f |

	g2 f4 ees~ |
	ees8 r f4 g f |
	g1 |
	r4 f g f | \break
	g2 f4 ees~ |
	ees8 r f4 g f |
	g1 |
	r4 g aes bes | \break
	b2 c4 ees |
	r4 f, g aes |
	a2 bes4 ees |
	r4 ees, f g | \break
	g2 aes4 ees' |
	r4 ees c aes |
	f1 |
	r4 f g f \bar "||"
	g2 f4 ees~ |
	ees8 r f4 g f|
	g1 |
	r4 f g f | \break
	g2 f4 ees~ |
	ees8 r f4 g f |
	g1 |
	r4 g aes bes | \break
	b2 c4 ees |
	r4 f, g aes |
	a2 bes4 f' |
	r4 ees c aes | \break
	g1 |
	f |
	ees~ |
	ees \bar "|."
}

theChords = \chordmode {
	\partial 2.
	s2.

	ees2:6 c:m7 |
	f:m7 bes:7 |
	ees1:6 |
	c:m7 |
	f:7 |
	f2:m7 bes:7 |
	ees1:7 |
	ees1:7 |
	ees2:aug/aes aes:6 |
	aes:6 aes:m |
	fis2:dim7 ees/g |
	c1:m7 |
	g2:aug/f f:m7 |
	f2:m7 c:aug7 |
	f1:m7/bes |
	bes1:7 |
	ees2:6 c:m7 |
	f2:m7 bes:7 |
	ees1:6 |
	c1:m7 |
	f1:7 |
	f2:m7 bes:7 |
	ees1:7 |
	ees1:7 |
	ees2:aug/aes aes:6 |
	aes2:6 aes:m |
	fis2:dim7 ees/g |
	c2:m7 c:aug7|
	f1:m7 |
	bes: 7 |
	ees:6 |
	ees:6 |
}

theWords = \lyricmode {
	They’re wri -- ting songs of love, but not for me.
	A lu -- cky star’s a -- bove, but not for me.
	With love to lead the way I’ve found more clouds of gray
	Than a -- ny Russ -- ian play could gua -- ran -- tee.
	I was a fool to fall and get that way;
	Heigh -- ho! A -- las! and al -- so, Lack -- a -- day!
	Al -- though I can’t dis -- miss the mem -- ory of his kiss,
	I guess he’s not for me.
}

\score {
	<<
		\new ChordNames \theChords
		\new Voice = soloist \theNotes
		\new Lyrics \lyricsto soloist \theWords
	>>
}

