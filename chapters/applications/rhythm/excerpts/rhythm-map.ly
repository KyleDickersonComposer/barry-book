\include "book-example.ily"

theMap = \relative c' {
	bes8 c d ees f g a4 |
	f8 g a bes c d ees4 |
	bes,8 c d ees f g a4 |
	f8 g a bes c d ees4 | \break
	bes,8 c d ees f g aes4 |
	ees8 f g aes bes c des4 |
	bes,8 c d ees f g a4 |
	f8 g a bes c d ees4 \bar "||" \break

	bes,8 c d ees f g a4 |
	f8 g a bes c d ees4 |
	bes,8 c d ees f g a4 |
	f8 g a bes c d ees4 | \break
	bes,8 c d ees f g aes4 |
	ees8 f g aes bes c des4 |
	bes,8 c d ees f g a g |
	f8  ees d c bes4 r4 \bar "||" \break

	d8 e fis g a b c b |
	a8 g fis e d4 r4|
	g8 a b c d e f e |
	d8 c b a g4 r4 | \break
	c,8 d e f g a bes a |
	g8 f e d c4 r4|
	f8 g a bes c d ees d |
	c8 bes a g f4 r4 \bar "||" \break

	bes,8 c d ees f g a4 |
	f8 g a bes c d ees4 |
	bes,8 c d ees f g a4 |
	f8 g a bes c d ees4 | \break
	bes,8 c d ees f g aes4 |
	ees8 f g aes bes c des4 |
	bes,8 c d ees f g aes4 |
	f8 g a bes c d ees4 \bar "|."
}

theChords = \chordmode {
	bes2:6 g:m7 |
	c:m7 f:7 |
	d2:m7 g:m7 |
	c:m7 f:7 |
	bes:6 bes:7/d |
	ees:maj7 e:dim7 |
	bes:6/f f:7 |
	c:m7 f:7 |
	bes:6 g:m7 |
	c:m7 f:7 |
	d:m7 g:m7 |
	c:m7 f:7 |
	bes:6 bes:7/d |
	ees:maj7 e:dim7 |
	bes:6/f f:7 |
	bes1:6 |
	% bridge
	d1:7 |
	d:7 |
	g:7 |
	g:7 |
	c:7 |
	c:7 |
	f:7 |
	f:7 |
	bes2:6 g:m7 |
	c:m7 f:7 |
	d:m7 g:m7 |
	c:m7 f:7 |
	bes:6 bes:7/d |
	ees:maj7 e:dim7 |
	bes:6/f f:7 |
	bes1:6 |
}

\score {
	<<
		\new ChordNames \theChords
		\new Voice \theMap
	>>
}
