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

**Chapter 9: Tune Analysis Structure**
For each tune:

- Tune with changes
- Scale Map
- Exemplar Solo
- Change Map
- Exemplar Comping

**Chapters 10-24: Individual Tune Analyses**
One chapter per tune from the tune list

## Implementation Steps

1. **Restructure Main LaTeX File**

   - Replace "Modern Practice" sections with Barry Harris concepts
   - Reorganize chapters to match Trello structure
   - Update part divisions

2. **Create Content Files**

   - Create separate `.lytex` files for each major section
   - Organize by concept/topic
   - Prepare template for per-tune analysis

3. **Update Bibliography**

   - Add Barry Harris references
   - Include links from Trello board

4. **Create Tune Templates**

   - Standardize format for each tune analysis
   - Include sections: changes, scale map, solo, change map, comping

5. **Integration**
   - Link all content files
   - Ensure consistent formatting
   - Verify all Trello items are covered

## File Organization

```
source/
├── chapters/
│   ├── 01-project-overview.lytex
│   ├── 02-essential-tools.lytex
│   ├── 03-little-things.lytex
│   ├── 04-linear-concepts.lytex
│   ├── 05-rhythmic-language.lytex
│   ├── 06-dominant-techniques.lytex
│   ├── 07-comping-scales.lytex
│   └── 08-change-maps.lytex
├── tunes/
│   ├── blues.lytex
│   ├── rhythm.lytex
│   ├── autumn-leaves.lytex
│   └── ... (one per tune)
└── main.lytex (or main.tex)
```

## Next Steps

1. Restructure main LaTeX file
2. Create chapter content files (initially as placeholders)
3. Create tune analysis templates
4. Populate content progressively
