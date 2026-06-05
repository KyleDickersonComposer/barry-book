\include "book-example.ily"

theNotes = \relative c' {
	\key f \major
	<f a c>1 |
	<f aes c>1 |
	<f a cis>1 |
	<f a c d>1 | \break
	<f aes c d>1 |
	<f a c e>1 |
	<f aes c ees>1 |
	<f a c ees>1 | \break
	<f aes ces ees>1 |
	<f a ces ees>1 |
	<f a cis ees>1 |
	<f aes b d>1 \bar "||"
}

theChords = \chordmode {
	f1 |
	f1:min |
	f1:aug |
	f1:6 |
	f1:min6 |
	f1:maj7 |
	f1:min7 |
	f1:7 |
	f1:min7.5- |
	f1:7.5- |
	f1:aug7 |
	f1:dim7 |
}

\score {
	<<
		\new \ChordNames {\theChords}
		\new Voice \theNotes
	>>
}
