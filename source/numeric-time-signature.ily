\version "2.24.0"

% Default for all book scores: print time signatures as numbers (e.g. 4/4), not C-type symbols.
\layout {
  \context {
    \Staff
    \override TimeSignature.style = #'numbered
  }
}
