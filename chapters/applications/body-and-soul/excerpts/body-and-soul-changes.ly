title = #"Body and Soul"
composer = #"Johnny Green"
meter = #"(Ballad)"

\include "real-book-chart.ily"

global = {
	\key des \major
}

theTune = \relative c' {
	\global

	r8 ees f ees f4 ees |
	bes'4 bes2. |
	r8 aes bes aes bes4 aes |
	ees'4 des c bes | \break
	r4  des \tuplet 3/2 {bes4 ges bes,} |
	f'2 ees |
	r8 des ees f aes4 \tuplet 3/2 {aes8 bes e,} |
	des2 r2 \bar "||" \break

	r8 ees f ees f4 ees |
	bes'4 bes2. |
	r8 aes bes aes bes4 aes |
	ees'4 des c bes | \break
	r4  des \tuplet 3/2 {bes4 ges bes,} |
	f'2 ees |
	r8 des ees f aes4 \tuplet 3/2 {aes8 bes e,} |
	des2 r2 \bar "||" \break

	\set Staff.explicitKeySignatureVisibility = #end-of-line-invisible
	\set Staff.printKeyCancellation = ##f
	\key d \major
	r8 d e fis a8 a4 a8 |
	d8 d4 fis,8  a8 a4 g8 |
	fis8 fis4 d8 e4 cis |
	a2. r4 | \break
	r8 d e f a8 a4 g8 |
	e'8 e4 b8 d8 d4 a8 |
	c8 c4 a8 b8 b4 g8 |
	e4 dis d bes' \bar "||" \break

	\set Staff.explicitKeySignatureVisibility = #end-of-line-invisible
	\set Staff.printKeyCancellation = ##f
	\key des \major
	r8 ees, f ees f4 ees |
	bes'4 bes2. |
	r8 aes bes aes bes4 aes |
	ees'4 des c bes | \break
	r4  des \tuplet 3/2 {bes4 ges bes,} |
	f'2 ees |
	r8 des ees f aes4 \tuplet 3/2 {aes8 bes e,} |
	des2 r2 \bar "||"
}

theChords = \chordmode {
	ees2:min7 bes:7 |
	ees2:min7 aes:7 |
	des2:maj7 ges:7 |
	f2:min7 e:dim7 |
	ees1:min7 |
	c2:min7.5- f:7 |
	bes2:min7 ees4:min7 aes:7 |
	des2:6 bes:7 |

	ees2:min7 bes:7 |
	ees2:min7 aes:7 |
	des2:maj7 ges:7 |
	f2:min7 e:dim7 |
	ees1:min7 |
	c2:min7.5- f:7 |
	bes2:min7 ees4:min7 aes:7 |
	des2:6 e4:min7 a:7 |

	d2:6 e:min7 |
	d2/fis  g4:min7 c:7 |
	fis4:min7 b:min7 e:min7 a:7 |
	d1:6 |
	d2:min7 g:7 |
	c2:maj7 ees:min7 |
	d2:min7 g:7 |
	c4:7 b:7 bes2:7 |

	ees2:min7 bes:7 |
	ees2:min7 aes:7 |
	des2:maj7 ges:7 |
	f2:min7 e:dim7 |
	ees1:min7 |
	c2:min7.5- f:7 |
	bes2:min7 ees4:min7 aes:7 |
	des1:6 |
}

\score {
	<<
		\new ChordNames \theChords
		\theTune
	>>
}
