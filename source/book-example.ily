\version "2.24.0"

#(set-global-staff-size 18)

\include "jazzchords.ily"
\include "lilyjazz-styles/lilyjazz.ily"
\include "lilyjazz-styles/jazzextras.ily"
\include "numeric-time-signature.ily"

\paper {
	indent = 0\mm
	line-width = 175\mm
	ragged-right = ##f
}

\layout {
	indent = 0\mm
	ragged-right = ##f
	 \context {
		\ChordNames
		% Omit repeated chord names until the harmony changes (same as real-book-chart.ily).
		chordChanges = ##t
		chordRootNamer = #jazzChordRootNamer
		chordNameExceptions = #jazzChordNames
		\override ChordName.font-size = #-0.5
	}

	\context {
		\StaffGroup
		% Hide the brace before the first system (ChordNames + staff excerpt).
		\remove "System_start_delimiter_engraver"
	}

	\context {
		\Score
		\override Score.Clef.break-visibility = #'#(#f #f #f)
		\override Score.KeySignature.break-visibility = #'#(#f #f #f)
		\override Score.SystemStartBar.collapse-height = #1
		\override Score.SystemStartBar.stencil = ##f
	}

}
