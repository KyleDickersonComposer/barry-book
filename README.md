# The Barry Book

A free and open-source textbook preserving the authentic Barry Harris tradition of jazz pedagogy.

## Getting the Book

**The easiest way to get the latest PDF is to visit [www.barrybook.org](https://www.barrybook.org) and download it directly from there.** The site always provides the most recent version of the book.

## About

The Barry Book is an instructional resource that presents Barry Harris's jazz piano concepts in a systematic, practical format. This is an open source project, meaning the complete source code (every note, every chord symbol, every layout decision) is publicly accessible on GitHub.

## Contributing

The Barry Book is built collaboratively. Whether you're fixing a typo, correcting a chord symbol, or adding new content, your contributions help preserve and improve this resource.

### Ways to Contribute

**Text Editing**: Fix typos, improve clarity, or correct errors in the educational content. This includes spelling, grammar, explanatory text, and factual corrections.

**Text Writing**: Add exercises, explanations, or educational content based on your understanding of Barry Harris's methods. This could include new exercises, scale maps, harmonic analysis, or pedagogical content.

**LilyPond Contributions**: Work with the music notation files (`.ly` files) to add or correct musical notation, fix chord symbols, adjust formatting, or add new tunes.

### How to Get Started

**For Small Changes**:

- Report issues on [GitHub Issues](https://github.com/KyleDickersonComposer/barry-book/issues)
- Use GitHub's web interface to make simple text edits directly through your browser

**For Larger Contributions**:

- Fork the project to create your own copy
- Make your changes and test them locally
- Submit a pull request to propose your changes

For detailed instructions and resources, see [CONTRIBUTORS.md](CONTRIBUTORS.md).

**Community**:

- Join the [Discord community](https://discord.gg/9XJukbbtFz) to ask questions and connect with other contributors
- Check existing issues to see what others are working on

## Building the Book (Advanced)

**⚠️ Building the book yourself requires advanced technical skills and is only recommended for developers or contributors who need to modify the source code.**

Building from source involves:

- Setting up a LaTeX distribution
- Installing and configuring LilyPond
- Installing custom LilyJAZZ fonts
- Managing complex build dependencies
- Troubleshooting compilation errors

If you just want to read the book, **please download it from [www.barrybook.org](https://www.barrybook.org) instead.**

### Prerequisites

- LaTeX distribution (TeX Live recommended)
- LilyPond (for musical notation)
- LilyJAZZ fonts (for jazz notation styling)
- Biber (for bibliography processing)
- Technical familiarity with command-line tools and build systems

### Build Instructions

The build process uses `lilypond-book` to process `.lytex` files, then compiles the resulting LaTeX document with `pdflatex`.

1. **Install LilyJAZZ fonts** (required for jazz notation):

   - Find the fonts directory of your LilyPond installation
   - Add the necessary LilyJAZZ fonts
   - Setup the font family in the font config file
   - Create a `~/.ly` directory in your home directory
   - Copy the `.ily` style files from LilyJAZZ into `~/.ly`

2. **Build the PDF**:

   ```sh
   make pdf
   ```

   This will:

   - Process all `.lytex` files with `lilypond-book`
   - Compile the LaTeX document (multiple passes for references)
   - Generate the final PDF in `bin/main.pdf`
   - Automatically open the PDF on macOS (if `open` command is available)

3. **Clean build artifacts**:

   ```sh
   make clean
   ```

   This removes temporary files, build artifacts, and the `bin/` directory.

### Troubleshooting

- If `lilypond-book` fails, ensure LilyPond is properly installed and in your PATH
- LaTeX errors often require multiple compilation passes; the Makefile handles this automatically
- Font issues usually indicate LilyJAZZ fonts are not properly installed or configured
- Check `bin/main.log` for detailed LaTeX compilation errors

## Project Structure

- `main.lytex` - Main LaTeX document
- `chapters/` - Concept chapters (Foundations, Linear Concepts, Harmonic Concepts)
- `tunes/` - Tune analyses (16 tunes, 5 sections each)
- `source/` - LilyJAZZ styles and templates
- `bin/` - Build output directory (gitignored)

## License

See [LICENSE](LICENSE) for details.
