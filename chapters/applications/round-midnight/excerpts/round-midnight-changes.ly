title = #"'Round Midnight"
composer = #"Thelonious Monk"
meter = #"(Ballad)"

\include "real-book-chart.ily"

global = {
	\key ees \major
}

theTune = \relative c' {
	\global

	r4  bes16 ees f bes ges4. bes,8 |
	ees8 ees4. bes'4 aes |
	r4 ees16 ges bes des c4. ees,8 |
	a4 aes aes g | \break
	r4  aes16 ces ees ges f4. c8 |
	bes2. r4 |
	ges4 f4~ f4. ees8 |
	d8 bes'8~ bes2. \bar "||" \break

	r4  bes,16 ees f bes ges4. bes,8 |
	ees8 ees4. bes'4 aes |
	r4 ees16 ges bes des c4. ees,8 |
	a4 aes aes g | \break
	r4  aes16 ces ees ges f4. c8 |
	bes2. r4 |
	ges8 f4 ees8~ ees4. ees8 |
	ees1 \bar "||" \break

	ges4 f4~ f4. ees8 |
	d4 bes2. |
	ges'4 f4~ f4. ees8 |
	d4 bes'2. | \break
	ces2 bes |
	ges2 f |
	ees'2 des |
	ces2 bes \bar "||" \break

	r4 bes,16 ees f bes ges4. bes,8 |
	ees8 ees4. bes'4 aes |
	r4 ees16 ges bes des c4. ees,8 |
	a4 aes aes g \bar "||" \break
	r4 aes16 ces ees ges f4. ces8 |
	bes2. r4 |
	ges8 f4. ees4. ees8~ |
	ees1 \bar "|."
}

theChords = \chordmode {
	ees2:min/d ees2:min/des
	c2:dim7 aes4:min7 des:7 |
	c1:min7.5- |
	b4:min7 e:7 bes:min7 ees:7 |
	aes2:min7 des:7 |
	ees2:min7 aes:7.5- |
	c4:min7.5- b4:7.5- s2 |
	bes1:7.5- |

	ees2:min/d ees2:min/des
	c2:dim7 aes4:min7 des:7 |
	c1:min7.5- |
	ces4:min7 fes:7 bes:min7 ees:7 |
	aes2:min7 des:7 |
	ees2:min7 aes:7.5- |
	c4:min7.5- b:7.5- bes2:7 |
	ees1:6

	c2:min7.5- b:7.5- |
	bes1:7.5- |
	c2:min7.5- b:7.5- |
	bes1:7.5- |
	aes2:min7 f4:min7 bes:7 |
	c2:min7.5- f:7 |
	des2:7  ces:7 |
	aes2:min7 f4:min7 bes:7 |

	ees2:min/d ees2:min/des
	c2:dim7 aes4:min7 des:7 |
	c1:min7.5- |
	b4:min7 e:7 bes:min7 ees:7 |
	aes2:min7 des:7 |
	ees2:min7 aes:7.5- |
	c4:min7.5- b:7.5- bes2:7 |
	ees1:6
}

\score {
	<<
		\new ChordNames \theChords
		\theTune
	>>
}
