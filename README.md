# The Barry Book

A free and open-source textbook preserving the authentic Barry Harris tradition of jazz pedagogy.

## About

The Barry Book is an instructional resource that presents Barry Harris's jazz piano concepts in a systematic, practical format. This is an open source project, meaning the complete source code (every note, every chord symbol, every layout decision) is publicly accessible on GitHub.

## Building the Book

### Prerequisites

- LaTeX distribution (TeX Live recommended)
- LilyPond (for musical notation)
- LilyJAZZ fonts (for jazz notation styling)
- Biber (for bibliography processing)

### Build Instructions

1. Install LilyJAZZ fonts:
   - Find the fonts directory of your LilyPond installation
   - Add the necessary LilyJAZZ fonts
   - Setup the font family in the font config file
   - Create a `~/.ly` directory in your home directory
   - Copy the `.ily` style files from LilyJAZZ into `~/.ly`

2. Build the PDF:
   ```sh
   make pdf
   ```

   The output will be in `bin/main.pdf`

3. Clean build artifacts:
   ```sh
   make clean
   ```

## Project Structure

- `main.lytex` - Main LaTeX document
- `chapters/` - Concept chapters (Foundations, Linear Concepts, Harmonic Concepts)
- `tunes/` - Tune analyses (16 tunes, 5 sections each)
- `source/` - LilyJAZZ styles and templates
- `bin/` - Build output directory (gitignored)

## Contributing

Found an error? Have a suggestion? See [CONTRIBUTORS.md](CONTRIBUTORS.md) for how to contribute.

- Report issues: [GitHub Issues](https://github.com/KyleDickersonComposer/barry-book/issues)
- Join the community: [Discord](https://discord.gg/9XJukbbtFz)

## License

See [LICENSE](LICENSE) for details.
