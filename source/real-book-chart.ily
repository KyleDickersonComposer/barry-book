\version "2.24.0"
% One-page real-book charts (only consumers of this file): sizing lives here, not in .lytex.
#(set-global-staff-size 19)

\include "lilyjazz-styles/jazzchords.ily"
\include "lilyjazz-styles/lilyjazz.ily"
\include "lilyjazz-styles/jazzextras.ily"
\include "numeric-time-signature.ily"

#(define-markup-command (rbFlat layout props degree) (string?)
  (interpret-markup layout props
    (markup #:concat (#:raise 0.55 #:fontsize -3 #:flat degree))))

#(define-markup-command (rbSharp layout props degree) (string?)
  (interpret-markup layout props
    (markup #:concat (#:raise 0.75 #:fontsize -3 #:sharp degree))))

realBookChordExceptions = {
  <c es g a>1-\markup { "min6" } % :m6
  <c es g a d'>-\markup { \concat { "min6" \super "/9" } } % :m6.9
  <c es g bes>-\markup { "min7" } % :m7
  <c es ges bes>1-\markup {
    \concat {
      "min7"
      \super { \rbFlat #"5" }
    }
  } % :m7.5-
  <c es gis bes>-\markup {
    \concat {
      "min7"
      \super { \rbSharp #"5" }
    }
  } % :m7.5+
  <c es g b>-\markup { "minmaj7" } % :m7+
  <c es g bes des'>-\markup {
    \concat {
      "min7"
      \super { \rbFlat #"9" }
    }
  } % :m7.9-
  <c es g bes dis'>-\markup {
    \concat {
      "min7"
      \super { \rbSharp #"9" }
    }
  } % :m7.9+
  <c e g a>-\markup { "6" } % :6
  <c e g a d'>-\markup { \concat { "6" \super "/9" } } % :6.9
  <c e g bes>-\markup { "7" } % :7
  <c e g b>-\markup { "maj7" } % :maj
  <c e ges b>-\markup {
    \concat {
      "maj7"
      \super { \rbFlat #"5" }
    }
  } % :maj.5-
  <c e gis b>-\markup {
    \concat {
      "maj7"
      \super { \rbSharp #"5" }
    }
  } % :maj.5+
  <c e ges bes>-\markup {
    \concat {
      "7"
      \super { \rbFlat #"5" }
    }
  } % :7.5-
  <c e gis bes>-\markup {
    \concat {
      "7"
      \super { \rbSharp #"5" }
    }
  } % :7.5+
  <c e g bes des'>-\markup {
    \concat {
      "7"
      \super { \rbFlat #"9" }
    }
  } % :9-
  <c e g bes dis'>-\markup {
    \concat {
      "7"
      \super { \rbSharp #"9" }
    }
  } % :9+
  <c e ges bes des'>-\markup {
    \concat {
      "7"
      \super { \concat { \rbFlat #"9" \rbFlat #"5" } }
    }
  } % :9-.5-
  <c e gis bes des'>-\markup {
    \concat {
      "7"
      \super { \concat { \rbFlat #"9" \rbSharp #"5" } }
    }
  } % :9-.5+
  <c e ges bes dis'>-\markup {
    \concat {
      "7"
      \super { \concat { \rbSharp #"9" \rbFlat #"5" } }
    }
  } % :9+.5-
  <c e gis bes dis'>-\markup {
    \concat {
      "7"
      \super { \concat { \rbSharp #"9" \rbSharp #"5" } }
    }
  } % :9+.5+
}

realBookChordNames = #(append
  (sequential-music-to-chord-exceptions realBookChordExceptions #t)
  JazzChords)

\paper {
  paper-height = 12\in
  paper-width = 19.15\cm
  line-width = 19.15\cm
  indent = 0\mm
  left-margin = 0\cm
  right-margin = 0\cm
  bottom-margin = 0\cm
  ragged-last-bottom = ##f
  ragged-bottom = ##f
}

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #8
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
    chordNameExceptions = #realBookChordNames
  }
}
