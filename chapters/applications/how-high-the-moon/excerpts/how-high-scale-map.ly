\include "book-example.ily"

theMap = \relative c' {
	g'8 a b c d e fis e |
	d8 c b a g4 r4 |
	c,8 d e f g a bes a |
	g8 f e d c4 r4 | \break
	f8 g a bes c d e d |
	c8 bes a g f4 r4 |
	bes,8 c d ees f g aes g |
	f8 ees d c bes4 r4 | \break
	ees8 f g aes bes c d4 |
	ees8 d c bes a g fis4 |
	g8 a bes c d dis e4 |
	f,8 g a bes c d ees4 | \break
	g,8 a b c d e fis4 |
	d,8 e fis g a b c4 |
	g8 a b c d e fis4 |
	d,8 e fis g a b c4 | \break

	g8 a b c d e fis e |
	d8 c b a g4 r4 |
	c,8 d e f g a bes a |
	g8 f e d c4 r4 | \break
	f8 g a bes c d e d |
	c8 bes a g f4 r4 |
	bes,8 c d ees f g aes g |
	f8 ees d c bes4 r4 | \break
	ees8 f g aes bes c d4 |
	ees8 d c bes a g fis4 |
	g8 a b c d e fis4 |
	f,8 g a bes c d ees4 | \break
	g,8 a b c d e fis4 |
	d,8 e fis g a b c4 |
	g8 a b c d e fis4 |
	d,8 e fis g a b c4 \bar "|."
}

theChords = \chordmode {
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
<<
	\new ChordNames \theChords
	\new Voice \theMap
>>
}
