title = #"Au Privave"
composer = #"Charlie Parker"
meter = #" (Med.)"
\include "real-book-chart.ily"

theTune = \relative c' {
	\key f \major

	\repeat volta 2 {
		f8 e f c r4 a'8aes |
		a8 c, r8 e~ e g f e |
		g8 f a bes c a g ees |
		r8 d' r4 r8 des4 bes8 | \break
		b4. f'8 r8 b, bes4~ |
		bes2 aes8 f g f |
		c'4 r8 a bes4 r8 g |
		c4 c~ c8 a bes a | \break
		a8 g f e f4 r8 c' |
		bes4 r8 f'~ f c e f |
		r4 r8 c~ c4. a8 |
	}

	\alternative {
		{
			bes8 a f d a' a~ a4 |
		}

		{
			bes8 a f d a' g~ g4 \bar "|."
		}
	}
}

theChords = \chordmode {
	\repeat volta 2 {
		f1:7 |
		g2:min7 aes:dim7 |
		f1:7 |
		c2:m7  f:7 |
		bes1:7 |
		bes1:7 |
		f:7 |
		a2:m7 d2:7 |
		g1:m7 |
		c1:7 |
		f2:7 d:7 |
	}
	\alternative {
		{
			g2:m7 c:7 |
		}

		{
			g2:7 c:7 |
		}
	}
}

\score {
	<<
		\new ChordNames \theChords
		\new Voice = soloist \theTune
	>>
}
