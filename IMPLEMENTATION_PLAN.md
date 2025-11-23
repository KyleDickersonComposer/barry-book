# Implementation Plan: Barry Book Restructure

## Overview

This plan outlines the restructuring of the Barry Book LaTeX document to align with the Trello board organization, replacing "Modern Practice" content with Barry Harris concepts and methodology.

## Trello Board Structure Analysis

### Column 1: Structure

This column defines the overall book organization:

- **Project Overview** - Introduction to the book's purpose
- **Barry Harris Overview** - Biography and teaching philosophy
- **Linear Concepts** - Melodic/linear improvisation concepts
- **Harmonic Concepts** - Chordal and harmonic theory
- **Applications** - Practical application sections
- **Per Tune Basis** - Structure for individual tune analysis:
  - Tune with changes
  - Scale Map
  - Exemplar Solo
  - Change Map
  - Exemplar Comping

### Column 2: Links

External resources and references (to be integrated into bibliography/references)

### Column 3: Concepts

Core Barry Harris concepts to be covered:

- Identifying the Chords
- Functional Harmony
- Common Chord Progressions
- Changes and Pedal Harmonies
- Scales for Linear Improvisation
- Scale Map
- All the Little Things
- A Rhythmic Language
- Spicing Up the Dominant
- How to Practice Linear Improvisation
- Scales for Comping

### Column 4: Little Things

Detailed techniques and rules:

- Half Step Rules
- Thirds
- Chord
- Half Step Below the Chord
- Pivot
- Important Arpeggio
- Surrounding the notes that aren't common between the chord pair

### Tune List

Jazz standards to be analyzed (per tune basis):

1. Blues
2. Rhythm
3. Autumn Leaves
4. How High the Moon
5. But Not For Me
6. What Is This Thing Called Love?
7. Love For Sale
8. Softly, As in a Morning Sunrise
9. I Can't Give You Anything But Love
10. A Night In Tunisia
11. On Green Dolphin Street
12. Stella By Starlight
13. All the Things You Are
14. Cherokee
15. 'Round Midnight

## Proposed LaTeX Structure

### Part I: Foundations

**Chapter 1: Project Overview & Barry Harris**

- Project Overview
- Barry Harris Overview
- Teaching Philosophy

**Chapter 2: Essential Tools**

- Identifying the Chords
- Functional Harmony
- Common Chord Progressions
- Changes and Pedal Harmonies

**Chapter 3: The Little Things**

- Half Step Rules
- Thirds
- Chord
- Half Step Below the Chord
- Pivot
- Important Arpeggio
- Surrounding the notes that aren't common between the chord pair

### Part II: Linear Concepts

**Chapter 4: Scales for Linear Improvisation**

- Scale Map Concept
- Scale Maps
- How to Practice Linear Improvisation

**Chapter 5: A Rhythmic Language**

- Jazz Syncopation
- Swing Feel
- Rhythm Games

**Chapter 6: Spicing Up the Dominant**

- Dominant chord variations
- Tritone substitutions
- Advanced dominant techniques

### Part III: Harmonic Concepts

**Chapter 7: Scales for Comping**

- Comping scales
- Voicing techniques
- Rhythm in comping

**Chapter 8: Change Maps**

- Understanding chord progressions
- Creating change maps
- Applying change maps

### Part IV: Applications (Per Tune Basis)

**Chapters 9-24: Individual Tune Analyses**

Each tune chapter includes five sections:

- Tune with changes
- Scale Map
- Exemplar Solo
- Change Map
- Exemplar Comping

Tune list (16 tunes total):
1. Blues (Chapter 9)
2. Rhythm (Chapter 10)
3. Autumn Leaves (Chapter 11)
4. How High the Moon (Chapter 12)
5. But Not For Me (Chapter 13)
6. What Is This Thing Called Love? (Chapter 14)
7. Love For Sale (Chapter 15)
8. Softly, As in a Morning Sunrise (Chapter 16)
9. I Can't Give You Anything But Love (Chapter 17)
10. A Night In Tunisia (Chapter 18)
11. On Green Dolphin Street (Chapter 19)
12. Stella By Starlight (Chapter 20)
13. All the Things You Are (Chapter 21)
14. All of Me (Chapter 22)
15. Cherokee (Chapter 23)
16. 'Round Midnight (Chapter 24)

## Implementation Status

### Completed

1. **Restructured Main LaTeX File**
   - Replaced "Modern Practice" sections with Barry Harris concepts
   - Reorganized chapters to match Trello structure
   - Updated part divisions
   - Removed "Tune Analysis Structure" chapter (content integrated into tune chapters)

2. **Created Content Files**
   - Created separate `.lytex` files for each major section
   - Organized by concept/topic in `chapters/` directory
   - Created per-tune analysis files in `tunes/` directory (5 files per tune)

3. **Build System**
   - Created Makefile for building LaTeX document
   - Integrated lilypond-book for processing LilyPond code
   - Set up GitHub Actions workflow for automated builds
   - Configured timestamped PDF releases

4. **Tune Analysis Structure**
   - Standardized format for each tune analysis
   - Each tune includes: changes, scale map, solo, change map, comping
   - Added "All of Me" as example with full LilyPond score

### In Progress

- Populating chapter content files with actual Barry Harris material
- Adding LilyPond notation for musical examples
- Creating scale maps and change maps for each tune
- Writing exemplar solos and comping patterns

## File Organization

```
barry-book/
├── main.lytex                    # Main LaTeX document
├── Makefile                      # Build system
├── preface.lytex                 # Preface content
├── references.bib                 # Bibliography
├── chapters/                     # Concept chapters
│   ├── 01-project-overview.lytex
│   ├── 01-barry-harris-overview.lytex
│   ├── 01-teaching-philosophy.lytex
│   ├── 02-identifying-chords.lytex
│   ├── 02-functional-harmony.lytex
│   ├── 02-common-progressions.lytex
│   ├── 02-changes-pedal-harmonies.lytex
│   ├── 03-half-step-rules.lytex
│   ├── 03-thirds.lytex
│   ├── 03-chord.lytex
│   ├── 03-half-step-below-chord.lytex
│   ├── 03-pivot.lytex
│   ├── 03-important-arpeggio.lytex
│   ├── 03-surrounding-notes.lytex
│   ├── 04-scale-map-concept.lytex
│   ├── 04-scale-maps.lytex
│   ├── 04-practice-linear-improvisation.lytex
│   ├── 05-jazz-syncopation.lytex
│   ├── 05-swing-feel.lytex
│   ├── 05-rhythm-games.lytex
│   ├── 06-dominant-variations.lytex
│   ├── 06-tritone-substitutions.lytex
│   ├── 06-advanced-dominant.lytex
│   ├── 07-comping-scales.lytex
│   ├── 07-voicing-techniques.lytex
│   ├── 07-rhythm-comping.lytex
│   ├── 08-understanding-progressions.lytex
│   ├── 08-creating-change-maps.lytex
│   └── 08-applying-change-maps.lytex
├── tunes/                        # Tune analyses (5 files per tune)
│   ├── blues-changes.lytex
│   ├── blues-scale-map.lytex
│   ├── blues-solo.lytex
│   ├── blues-change-map.lytex
│   ├── blues-comping.lytex
│   ├── all-of-me-changes.lytex   # Includes full LilyPond score
│   └── ... (5 files × 16 tunes = 80 files)
├── source/
│   ├── lilyjazz-styles/          # LilyJazz font styles
│   └── template/                 # LilyPond templates
└── bin/                          # Build output (gitignored)
```

## Current Status

The document structure is complete with all chapters and sections defined. Content files exist as placeholders and are ready to be populated with actual Barry Harris material. The build system is functional and the workflow automatically creates timestamped PDF releases.
