\version "2.24.0"
#(set-global-staff-size 21)

\include "jazzchords.ily"
\include "lilyjazz-styles/lilyjazz.ily"
\include "lilyjazz-styles/jazzextras.ily"
\include "numeric-time-signature.ily"

\paper {
	paper-height = 11\in
	paper-width = 8.5\in
	indent = 0\mm
	left-margin = 0\in
	right-margin = 0\in
	bottom-margin = 0.5\in
	ragged-last-bottom = ##f
	ragged-bottom = ##f
	markup-system-spacing.basic-distance = #20
	markup-system-spacing.minimum-distance = #15
	markup-system-spacing.padding = #5
	system-system-spacing.basic-distance = #15
	system-system-spacing.minimum-distance = #10
}

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #(if (defined? 'fontSize) fontSize 8)
          \override #'(offset . 7)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
    }

    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  title = \realBookTitle
  tagline = ##f
}

\layout {
	\context {
		\ChordNames
		% Lead-sheet style: omit repeated chord symbols until the harmony changes.
		chordChanges = ##t
		chordRootNamer = #jazzChordRootNamer
		chordNameExceptions = #jazzChordNames
		\override ChordName.font-size = #-0.3
	}

	\context {
		\Score
		\override Score.Clef.break-visibility = #'#(#f #f #f)
		\override Score.KeySignature.break-visibility = #'#(#f #f #f)
		\override Score.SystemStartBar.collapse-height = #1
	}
}
