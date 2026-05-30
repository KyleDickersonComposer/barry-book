title = #"Softly, As In A Morning Sunrise"
composer = #"Sigmund Romburg"
meter = #" (Med. Swing)"
fontSize = #5

\include "real-book-chart.ily"

theNotes = \relative c' {
	\key d \minor
	d'4. a8~ a2 |
	r8 g a g a4 g |
	d'4. f,8~ f2 |
	r8 e f e f4 e | \break
	a4. d,8~ d2 |
	r8 a' bes a f4 e |
	d1 |
	a'1 \bar "||" \break
	d4. a8~ a2 |
	r8 g a g a4 g |
	d'4. f,8~ f2 |
	r8 e f e f4 e | \break
	a4. d,8~ d2 |
	r8 a' bes a f4 e |
	d1 |
	\tuplet  3/2 {r4 e f} \tuplet 3/2 {g a bes} \bar "||" \break
	c4. f,8~ f2 |
	r8 c' d c d4 c |
	c4. fis,8~ fis2~ |
	\tuplet 3/2 {fis4 fis g} \tuplet 3/2 {a bes c} \break
	d4. g,8~ g2 |
	r8 d'8 e d e4 d |
	e2. e4 |
	g4 g f e | \break
	d4. a8~ a2 |
	r8 g a g a4 g |
	d'4. f,8~ f2 |
	r8 e f e f4 e | \break
	a4. d,8~ d2 |
	r8 a' bes a f'4 e |
	d1~ |
	d4 r4 r2 \bar "|."
}


theChords = \chordmode {
	d2:m6 f:7 |
	e2:m7.5- a:7 |
	d2:m6 f:7 |
	e2:m7.5- a:7 |
	d2:m6 f:7 |
	e2:m7.5- a:7 |
	d1:m6 |
	e2:m7.5- a:7 |
	d2:m6 f:7 |
	e2:m7.5- a:7 |
	d2:m6 f:7 |
	e2:m7.5- a:7 |
	d2:m6 f:7 |
	e2:m7.5- a:7 |
	d1:m6 |
	d2:m6 c:7 |
	f1 |
	f2 a:m7.5-/ees |
	d1:7 |
	d1:7 |
	g1:m7 |
	e1:7 |
	a1:7 |
	e2:m7.5- a:7 |
	d2:m6 f:7 |
	e2:m7.5- a:7 |
	d2:m6 f:7 |
	e2:m7.5- a:7 |
	d2:m6 f:7 |
	e2:m7.5- a:7 |
	d1:m6 |
	d1:m6 |
}

theWords = \lyricmode {
	Soft -- ly as in a morn -- in' sun -- rise
	The light of love comes steal -- ing
	In -- to a new -- born day, oh!

	Flam -- in' with all the glow of sun -- rise
	A burn -- ing kiss is seal -- ing
	The vow that all be -- tray.

	For the pass -- ions that thrill love
	And lift you high to hea -- ven
	Are the pass -- ions that kill love
	And let you fall to hell
	So ends each st -- ory

	Soft -- ly as in an even -- in' sun -- set
	The light that gave you gl -- ory
	Will take it all a -- way.
}

\score {
	<<
		\new ChordNames \theChords
		\new Voice = soloist \theNotes
		\new Lyrics \lyricsto soloist \theWords
	>>
}
