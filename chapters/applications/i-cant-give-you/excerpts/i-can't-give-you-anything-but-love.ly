title = #"I Can't Give You Anything But Love"
composer = #"Sigmund Romburg"
meter = #" (Med. Swing)"
fontSize = #4

\include "real-book-chart.ily"

theNotes = \relative c' {
	\key aes \major
	aes'4 g f aes |
	g4 f aes f |
	bes1 |
	bes8 b c2. | \break
	aes4 g f aes |
	g4 f aes c |
	ees1 |
	c8 ces bes2. \bar "||" \break
	aes8 a8 bes2. |
	bes8 b8 c2. |
	r4 ees des c |
	bes1 | \break
	bes8 b8 c2. |
	c8 des8 d2. |
	f4 ees des c |
	ees des f, g \bar "||" \break
	aes4 g f aes |
	g4 f aes f |
	bes1 |
	bes8 b c2. | \break
	ees4 des c ees |
	des4 c ees des |
	c1 |
	bes4 aes2. \bar "||" \break
	f4 g aes g |
	bes aes g aes |
	ees'1 |
	g,4 f2. | \break
	e4 f ees' des |
	f4 f  c c |
	aes1~ |
	aes2. r4 \bar "|." 
}

theChords = \chordmode {
	aes1 |
	aes2/c b:dim7 |
	bes1:m7 |
	bes2:m7/ees ees:7 |
	aes1 |
	aes2/c f:m7 |
	bes1:m7 |
	bes2:m7/ees ees:7 |
	aes1:7 |
	ees2:m7 aes:7 |
	des1:maj7 |
	des1:6 |
	bes1:7 |
	f2:m7 bes:7 |
	ees2:7  a:dim7 |
	bes1:m7 |
	aes1 |
	aes2/c b:dim7 |
	bes1:m7 |
	bes2:m7/ees ees:7 |
	aes1:7 |
	ees2:m6  aes:7 |
	des1:maj7 |
	des1:6 |
	des2 des:maj7 |
	d1:dim7 |
	aes1/ees |
	f1:7 |
	bes1:m7 |
	bes2:7  ees:7 |
	aes |
}

theWords = \lyricmode {
	I can't give you an -- y -- thing  but love, Ba \markup{-} by
	That's the on -- ly thing I'm think -- ing of, Ba \markup{-} by
	Dream a while, scheme a while, we're sure to find
	Hap -- pi -- ness and I guess All those things you've al -- ways pined for
	Gee, I'd like to see you look -- ing swell, Ba \markup{-} by
	Dia -- mond brace -- lets  Wool -- worth's does -- n't sell, Ba -- by
	'Til that luck -- y day, you know darn well, Ba -- by
	I can't give you an -- y -- thing but love
}

\score {
	<<
		\new ChordNames \theChords
		\new Voice = soloist \theNotes
		\new Lyrics \lyricsto soloist \theWords
	>>
}
