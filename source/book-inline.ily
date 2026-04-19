\version "2.24.0"

\include "lilyjazz-styles/jazzchords.ily"
\include "lilyjazz-styles/lilyjazz.ily"
\include "lilyjazz-styles/jazzextras.ily"
\include "numeric-time-signature.ily"

#(set-global-staff-size 12)

\layout {
  indent = 0\mm
  ragged-right = ##t
  % No barline before inline music examples.
  \override Score.SystemStartBar.stencil = ##f
}
