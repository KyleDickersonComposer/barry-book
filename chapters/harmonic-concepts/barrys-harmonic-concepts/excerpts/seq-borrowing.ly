\include "book-example.ily"

theRH = \relative c' {
\key c \major
<<
	\new Voice = "upper" {
		\voiceOne
		b'4 a gis a |
		c b ais b |
		d c b c |
		e d cis d |
		ees d cis d | \break
		d c b c |
		ees d cis d |
		f ees d ees |
		g f e f |
		ges f e f | \break
		f ees d ees |
		ges f e f |
		aes ges f ges |
		bes aes g aes |
		a gis fisis gis | \break
		gis fis eis fis |
		a gis fisis gis |
		b a gis a |
		cis b ais b |
		b a gis a \bar "||"
	}
	\new Voice {
		\voiceTwo
		e,1 |
		f |
		g |
		a |
		aes |
		g |
		aes |
		bes |
		c |
		ces |
		bes |
		ces |
		des |
		ees |
		d |
		cis |
		d |
		e |
		fis |
		f |
	}
>>
}

theLH = \relative c {
\key c \major
<<
	\new Voice = "upper" {
		\voiceOne
		b'4 a gis a |
		c b ais b |
		d c b c |
		e d cis d |
		ees d cis d | \break
		d c b c |
		ees d cis d |
		f ees d ees |
		g f e f |
		ges f e f | \break
		f ees d ees |
		ges f e f |
		aes ges f ges |
		bes aes g aes |
		a gis fisis gis | \break
		gis fis eis fis |
		a gis fisis gis |
		b a gis a |
		cis b ais b |
		b a gis a \bar "||"
	}
	\new Voice {
		\voiceTwo
		c,,1 |
		d |
		e |
		f |
		f |
		ees |
		f |
		g |
		aes |
		aes |
		ges |
		aes |
		bes |
		ces |
		b |
		a |
		b |
		cis |
		d |
		d |
	}
>>
}

\score {
\new PianoStaff <<
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
