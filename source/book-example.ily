\version "2.24.0"

\include "lilyjazz-styles/jazzchords.ily"
\include "lilyjazz-styles/lilyjazz.ily"
\include "lilyjazz-styles/jazzextras.ily"
\include "numeric-time-signature.ily"

#(set-global-staff-size 15)

\paper {
  indent = 0\mm
  line-width = 175\mm
  ragged-right = ##f
}

\layout {
  indent = 0\mm
  ragged-right = ##f
  \context {
    \StaffGroup
    % Hide the brace before the first system (ChordNames + staff excerpt).
    \remove "System_start_delimiter_engraver"
  }
  \override Score.Clef.break-visibility = #'#(#f #f #f)
  \override Score.KeySignature.break-visibility = #'#(#f #f #f)
  % No barline before the first measure (book excerpt look).
  \override Score.SystemStartBar.stencil = ##f
}
