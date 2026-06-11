title = #"Blues For Alice"
composer = #"Charlie Parker"
meter = #" (Med. Swing)"
\include "real-book-chart.ily"

global = {
	\key f \major
	\partial 8
}

theTune = \relative c' {
	\global
	f'8~ |

	f4 c8 a e'4 c8 a |
	d8 e b d des bes g a~ |
	a4 f8 d g a f e |
	\tuplet 3/2 {ees8 g bes} d des r8 f, \tuplet 3/2 {f8 g f} \break
	c'4 bes8 f aes bes, r8 g'8 |
	ees' des bes b c f, g a~ |
	a4 e8 c d4 r4 |
	des' b8 ges bes4 r8 aes8 | \break
	\tuplet 3/2 {g4 f' f} f8 d bes f |
	a8 g c bes ees4. r8 |
	c4 a8 f g4. d'8~ |
	d4 bes8 g a4 r4 \bar "|."
}

theChords = \chordmode {
	\global
	s8

	f1:6 |
	e2:min7.5- a:7 |
	d2:min7 g:7 |
	c2:min7 f:7 |
	bes1:7 |
	bes2:min7 ees:7 |
	f1:maj7 |
	aes2:min7 des:7 |
	g1:min7 |
	c1:7 |
	f1:7 |
	g2:min7 c:7 |
}

\score {
	<<
		\new ChordNames \theChords
		\theTune
	>>
}
