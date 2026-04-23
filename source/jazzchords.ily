\version "2.24.0"

% Canonical chord semantics:
% - Baseline quality words: min / maj
% - Superscript extensions and alterations
% - Small raised accidental signs in alterations

#(define (jazzChordRootNamer pitch majmin)
  (let* ((alt (ly:pitch-alteration pitch)))
    (make-line-markup
      (list
        (make-simple-markup
          (vector-ref #("C" "D" "E" "F" "G" "A" "B")
            (ly:pitch-notename pitch)))
        (if (= alt 0)
          (markup "")
          (if (= alt FLAT)
            (markup ">")
            (markup "<")))))))

#(define-markup-command (jazzChordFlat layout props degree) (string?)
  (interpret-markup layout props
    (markup #:concat (#:raise 0.55 #:fontsize -3 #:flat degree))))

#(define-markup-command (jazzChordSharp layout props degree) (string?)
  (interpret-markup layout props
    (markup #:concat (#:raise 0.75 #:fontsize -3 #:sharp degree))))

#(define-markup-command (jazzChordMin layout props extension) (string?)
  (interpret-markup layout props
    (if (string-null? extension)
      (markup "min")
      (markup "min" #:super extension))))

#(define-markup-command (jazzChordMaj layout props extension) (string?)
  (interpret-markup layout props
    (if (string-null? extension)
      (markup "maj")
      (markup "maj" #:super extension))))

jazzChordNamesList = {
  <c es ges>1-\markup { \super "dim" } % :dim
  <c es ges beses>1-\markup { \super "7dim" } % :dim7
  <c es g>1-\markup { \jazzChordMin #"" } % :m
  <c es g a>1-\markup { "min6" } % :m6
  <c es g a d'>1-\markup { \concat { "min6" \super "/9" } } % :m6.9
  <c es g bes>1-\markup { "min7" } % :m7
  <c es ges bes>1-\markup {
    \concat { "min7" \super { \jazzChordFlat #"5" } }
  } % :m7.5-
  <c es gis bes>1-\markup {
    \concat { "min7" \super { \jazzChordSharp #"5" } }
  } % :m7.5+
  <c es g b>1-\markup { "minmaj7" } % :m7+
  <c es g bes des'>1-\markup {
    \concat { "min7" \super { \jazzChordFlat #"9" } }
  } % :m7.9-
  <c es g bes dis'>1-\markup {
    \concat { "min7" \super { \jazzChordSharp #"9" } }
  } % :m7.9+

  <c e g a>1-\markup { "6" } % :6
  <c e g a d'>1-\markup { \concat { "6" \super "/9" } } % :6.9
  <c e g bes>1-\markup { "7" } % :7
  <c e g b>1-\markup { "maj7" } % :maj
  <c e ges b>1-\markup {
    \concat { "maj7" \super { \jazzChordFlat #"5" } }
  } % :maj.5-
  <c e gis b>1-\markup {
    \concat { "maj7" \super { \jazzChordSharp #"5" } }
  } % :maj.5+
  <c e ges bes>1-\markup {
    \concat { "7" \super { \jazzChordFlat #"5" } }
  } % :7.5-
  <c e gis bes>1-\markup {
    \concat { "7" \super { \jazzChordSharp #"5" } }
  } % :7.5+
  <c e g bes des'>1-\markup {
    \concat { "7" \super { \jazzChordFlat #"9" } }
  } % :9-
  <c e g bes dis'>1-\markup {
    \concat { "7" \super { \jazzChordSharp #"9" } }
  } % :9+
  <c e ges bes des'>1-\markup {
    \concat { "7" \super { \concat { \jazzChordFlat #"9" \jazzChordFlat #"5" } } }
  } % :9-.5-
  <c e gis bes des'>1-\markup {
    \concat { "7" \super { \concat { \jazzChordFlat #"9" \jazzChordSharp #"5" } } }
  } % :9-.5+
  <c e ges bes dis'>1-\markup {
    \concat { "7" \super { \concat { \jazzChordSharp #"9" \jazzChordFlat #"5" } } }
  } % :9+.5-
  <c e gis bes dis'>1-\markup {
    \concat { "7" \super { \concat { \jazzChordSharp #"9" \jazzChordSharp #"5" } } }
  } % :9+.5+
}

jazzChordNames = #(sequential-music-to-chord-exceptions jazzChordNamesList #t)
