\version "2.24.0"

\include "lilyjazz-styles/jazzchords.ily"
\include "lilyjazz-styles/lilyjazz.ily"
\include "lilyjazz-styles/jazzextras.ily"
\include "numeric-time-signature.ily"

#(set-global-staff-size 13)

\layout {
  indent = 0\mm
  ragged-right = ##t
  \override Score.SystemStartBar.collapse-height = #1
}
