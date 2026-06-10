title = #"How High the Moon"
composer = #"Morgan Lewis"
meter = #" (Med. Swing)"
\include "real-book-chart.ily"

theNotes = \relative c' {
	\key g \major
	\partial 2.
	d4 g a |

	% start
	a2 b~ |
	b4 d, g a |
	bes1~ |
	bes4 c, f g | \break
	g2 a~ |
	a4 c, f g |
	aes1~ |
	aes4 d, ees f | \break
	g g g g |
	g g8 a~ a g a4 |
	bes1~ |
	bes4. a8~ a g a4 | \break
	b1~ |
	b4 a b c |
	d d d d |
	d8 r d,4 g a \bar "||" \break

	a2 b~ |
	b4 d, g a |
	bes1~ |
	bes4 c, f g | \break
	g2 a~ |
	a4 c, f g |
	aes1~ |
	aes4 d,4 ees f | \break
	g g g g |
	g g8 a~ a g a4 |
	b1~ |
	b4 a b c | \break
	d d d d |
	d d, g a |
	g1~ |
	g1 \bar "|."
}

theChords = \chordmode {
	\partial 2.
	s2.
	g1:6 |
	g:6 |
	g:m7 |
	c:7 |
	f:6 |
	f:6 |
	f:m7 |
	bes:7 |
	ees:maj7 |
	a2:m7.5- d:7 |
	g1:m6
	a2:m7.5- d:7 |
	g1:6
	a2:m7 d:7 |
	b2:m7 e:7 |
	a2:m7 d:7 |

	g1:6 |
	g:6 |
	g:m7 |
	c:7 |
	f:6 |
	f:6 |
	f:m7 |
	bes:7 |
	ees:maj7 |
	a2:m7.5- d:7 |
	g1:6
	a2:m7 d:7 |
	b2:m7 e:7 |
	a2:m7 d:7 |
	g1:6 |
	g1:6 |
}

theWords = \lyricmode {
	Some where there's mus -- ic,
	How faint the tune
	Some where there's hea -- ven,
	How high the moon
	There is no moon ab -- ove
	When love is far a -- way too,
	'Til it comes true
	That you love me as I love you.
	Some where there's mus -- ic,
	it's where you are.
	Some where there's hea -- ven,
	How near, how far
	The dark -- est night would shine
	If you would come to me soon.
	Un -- til you will, how still my heart,
	How high the moon
}

\score {
	<<
		\new ChordNames \theChords
		\new Voice = soloist \theNotes
		\new Lyrics \lyricsto soloist \theWords
	>>
}
