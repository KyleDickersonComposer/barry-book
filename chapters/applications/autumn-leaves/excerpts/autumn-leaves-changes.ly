title = #"Autumn Leaves"
composer = #"Joesph Kosma"
meter = #" (Med. Swing)"
\include "real-book-chart.ily"

theTune = \relative c' {
	\key g \minor
	\partial 2.
	g'4 a bes |
	ees1~ |
	ees4 f, g a |
	d2 d~ |
	d4 ees, f g | \break
	c1~ |
	c4 d, e fis |
	bes1 |
	r4 g a bes \bar "||" \break
	ees1~ |
	ees4 f, g a |
	d2 d~ |
	d4 ees, f g | \break
	c1~ |
	c4 a c bes |
	g1~ |
	g4 r fis g \bar "||" \break
	a4 d, a'2~ |
	a4 a g a |
	bes1~ |
	bes4 bes a bes | \break
	c1~ |
	c4 f, f' ees |
	d1~ |
	d4 r cis d \bar "||" \break
	ees4 ees c c |
	a2. ees'4 |
	d2 d~ |
	d g, | \break
	c2. bes4 |
	a2 bes4 d, |
	g1~ |
	g1 \bar "|."
}

theChords = \chordmode {
	\partial 2.
	s2.
	c1:m7 |
	f:7 |
	bes:maj7 |
	ees:maj7 |
	a:m7.5- |
	d:7 |
	g:min6 |
	g:min6 |
	c1:m7 |
	f:7 |
	bes:maj7 |
	ees:maj7 |
	a:m7.5- |
	d:7 |
	g:min6 |
	g:min6 |
	a:m7.5- |
	d:7 |
	g:min6 |
	g:min6 |
	c:m7 |
	f:7 |
	bes:maj7 |
	bes:maj7 |
	a:m7.5- |
	d:7 |
	g2:m7 c:7|
	f:m7 bes:7 |
	a1:m7.5- |
	d:7 |
	g:min6 |
	g:min6 |
}

theWords = \lyricmode {
	The fall -- ing leaves drift by my win -- dow
	The aut -- umn leaves of red and gold
	I see your lips, the sum -- mer kiss -- es
	The sun -- burned hands I used to hold
	Since you went a -- way the days grow long
	And soon I'll hear old win -- ter's song
	But I miss you most of all my dar -- ling
	When aut -- umn leaves start to fall
}

\score {
	<<
		\new ChordNames \theChords
		\new Voice = soloist \theTune
		\new Lyrics \lyricsto soloist \theWords
	>>
}
