\version "2.24.0"

\include "jazzchords.ily"
\include "lilyjazz-styles/lilyjazz.ily"
\include "lilyjazz-styles/jazzextras.ily"
\include "numeric-time-signature.ily"

#(set-global-staff-size 12)

\layout {
  ragged-right = ##t
  indent = 0\mm
  \override Score.SystemStartBar.stencil = ##f
}
