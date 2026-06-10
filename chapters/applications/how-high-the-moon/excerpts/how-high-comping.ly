\include "book-example.ily"

global = {
	\key g \major
}

theRH = \relative c' {
	\global
	r4 d4 <g e cis> <a fis e c> |
	<a fis dis b~ >2 <b~ g d e b> |
	b4 d, <g e cis> <a fis ees c> |
	<bes^~ g d>1 |
	<bes g des>4  c, <f d b> <g e d bes>| \break
	<g e cis a>2 <a^~ f d c a>2 |
	a4 c, <f d b> <g e d bes e> |
	<aes~ f c>1 |
	<aes fis? c>4 d, es f | \break
	<g f d>4 g <g f des> g |
	<g ees c>4 <g es c>8 <a f ees c>~ a g <a f ees c>4 |
	<bes~ g e d>1 |
	bes4. <a^~ f ees c >8 a g <a f ees c>4 | \break
	<b~ g d e>1 |
	b4 <a e c> <b f d> <c fis, e> |
	<d a fis>4 d <d aes f> d  |
	<d g, e>4 d, <g e cis> <a fis e c>| \break

	<a fis dis b~ >2 <b~ g d e b> |
	b4 d, <g e cis> <a fis ees c> |
	<bes^~ g d>1 |
	<bes g des>4  c, <f d b> <g e d bes>| \break
	<g e cis a>2 <a^~ f d c a>2 |
	a4 c, <f d b> <g e d bes e> |
	<aes~ f c>1 |
	<aes fis? c>4 d, es f | \break

	<g f d>4 g <g f des> g |
	<g ees c>4 <g es c>8 <a f ees c>~ a g <a f ees c>4 |
	b1~ |
	b4 <a e c> <b f d> <c fis, e> | \break
	<d a fis>4 d <d aes f> d  |
	<d g, e>4 d, <g e cis> <a fis e c>|
	<g e d b>1 |
	<g e d b>1 \bar "|."
}

theLH = \relative c {
	\global
	d,1 |
	<g~ dis'>2 <g e'> |
	r2 g'4 fis |
	f1 |
	<bes e, c>4 r4 f4 e |
	<cis f,~ >2 <d f,>2 |
	r2 f4 e |
	ees1 |
	d2 des4 c |
	<g' b,>2 <g bes,> |
	a,4. d,8~ d2 |
	g1~ |
	g4. d8~ d2 |
	g1 ~ |
	g4 fis'? gis a |
	b2 bes |
	a4 r4 r2 |

	<g,~ dis'>2 <g e'> |
	r2 g'4 fis |
	f1 |
	<bes e, c>4 r4 f4 e |
	<cis f,~ >2 <d f,>2 |
	r2 f4 e |
	ees1 |
	d2 des4 c |
	<g' b,>2 <g bes,> |
	a,4. d,8~ d2 |
	g1~ |
	g4 fis'? gis a |
	b2 bes |
	a2 d, |
	g,1 |
	g1 |
}

theChords = \chordmode {
	s1
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

\score {
	\new PianoStaff <<
		\new ChordNames \theChords
		\new Staff <<
			\clef treble
			\theRH
		>>

		\new Staff <<
			\clef bass
			\theLH
		>>
	>>
}
