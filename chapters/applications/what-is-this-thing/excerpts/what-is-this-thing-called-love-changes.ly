title = #"What Is This Thing Called Love"
composer = #"Cole Porter"
meter = #" (Med.)"
fontSize = #6

\include "real-book-chart.ily"

theNotes = \relative c' {
	\key c \major
	\partial 4
	bes'4 |

	bes4 g g2~ |
	g2 bes |
	aes1 |
	r2 r4 aes4 | \break
	aes8 g4 g8~ g2~ |
	g2 dis |
	e1 |
	r2 r4 bes' \bar "||" \break
	bes4 g g2~ |
	g4 bes bes4. a8 |
	aes1 |
	r2 r4 aes | \break
	aes8 g4 g8~ g2~ |
	g4 ees ees8 ees4. |
	c1 |
	r2 r4 ees' \bar "||" \break
	ees4 c c2~ |
	c4 ees4 \tuplet 3/2 {ees ees ees} |
	d1 |
	r2 r4 d | \break
	c4 aes aes2~ |
	aes4 c \tuplet 3/2 {c bes aes} |
	g1 |
	r4 bes bes bes \bar "||" \break
	bes4 g g2~ |
	g4 bes bes8 c4 bes8 |
	aes1 |
	r2 r4 aes | \break
	aes4 g g2~ |
	g2 ees' |
	c1~ |
	c2. r4 \bar "|."
}

theChords = \chordmode {
	\partial 4
	s4

	g1:m7.5- |
	c1:7 |
	f1:min7 |
	f1:m6 |
	d1:m7.5- |
	g2:7 des2:7 |
	c1:maj7 |
	c1:6 |
	g1:m7.5- |
	c1:7 |
	f1:min7 |
	f1:m6 |
	d1:m7.5- |
	g2:7 des:7 |
	c1:6 |
	g2:min7 c:7 |
	c1:m7/f |
	f1:7 |
	bes1:maj7 |
	bes1:6 |
	aes1:6 |
	d1:7 |
	d1:min7/g |
	des1:7 |
	g1:m7.5- |
	c1:7 |
	f1:min7 |
	f1:m6 |
	d:m7.5- |
	des:7 |
	c:6 |
}

theWords = \lyricmode {
	What is this thing called love?
	This fun -- ny thing called love?
	Just who can solve its my -- ster -- y?
	Why should it make a fool of me?
	I saw you there one won -- der -- ful day
	You took my heart and threw it a -- way
	That's why I ask the Lord in hea -- ven a -- bove
	What is this thing called love?
}

\score {
	<<
		\new ChordNames \theChords
		\new Voice = soloist \theNotes
		\new Lyrics \lyricsto soloist \theWords
	>>
}
