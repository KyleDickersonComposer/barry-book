title = #"All The Things You Are"
composer = #"Jerome Kern"
meter = #" (Med. Swing)"
fontSize = #4

\include "real-book-chart.ily"

theNotes = \relative c' {
	\key aes \major
	aes'1 |
	des2. aes4 |
	g4 g g g |
	g4 c2 g4 |
	f4 f f f | \break
	f4 b2 f4 |
	e1~ |
	e1 |
	ees1 |
	aes2. ees4 | \break
	d4 d d d |
	d4 g2 d4 |
	c4 c c c |
	c d8 ees d4 c |
	b1~ | \break
	b4 d g d' |
	d4. c8 c2~ |
	c4 ees, e c' |
	b1~ |
	b4 d, g b | \break
	b4. a8 a2~ |
	a4 bes, b a' |
	gis1~ |
	gis \bar "||"
	aes1 | \break
	des2. aes4 |
	g4 g g g |
	g4 c2 g4 |
	f1 |
	ees'2. des4 | \break
	ees,4 ees \tuplet 3/2 {ees ees ees} |
	g2. f4 |
	des4 des f aes |
	f'2 g, |
	aes1 |
	r1 \bar "||"
}

theChords = \chordmode {
	f1:m7 |
	bes1:m7 |
	ees1:7 |
	aes1:maj7 |
	des1:maj7 |
	g1:7 |
	c1:m6 |
	c1:m6 |
	c1:m7 |
	f1:m7 |
	bes1:7 |
	ees1:maj7 |
	aes1:maj7 |
	a2:m7.5- d:7 |
	g1:maj7 |
	g2:maj7 e:7 |
	a1:m7 |
	d1:7 |
	g1:maj7 |
	g1:maj7 |
	fis1:m7.5- |
	b1:7 |
	e1:maj7 |
	c1:aug7 |
	f1:m7 |
	bes1:m7 |
	ees1:7 |
	aes1:maj7 |
	des1:maj7 |
	ges1:7 |
	c1:m7 |
	b1:dim7 |
	bes1:m7 |
	ees1:7 |
	aes:6 |
}

theWords = \lyricmode {
	You are the prom -- ised kiss of spring -- time
	That makes the lone -- ly win -- ter seem long.
	You are the breath -- less hush of even -- ing
	That tremb -- les on the brink of a love -- ly song.
	You are the an -- gel glow that lights a star,
	The dear -- est things I know are what you are.
	Some day my hap -- py arms will hold you,
	And some day I'll know that mo -- ment di -- vine,
	When all the things you are, are mine!
}

\score {
	<<
		\new ChordNames \theChords
		\new Voice = soloist \theNotes
		\new Lyrics \lyricsto soloist \theWords
	>>
}
