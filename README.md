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

**LilyPond Contributions**: Work with the music notation files (`.lytex` files) to add or correct musical notation, fix chord symbols, adjust formatting, or add new tunes.

**Note**: Some chapters or sections may currently be placeholders or incomplete. We're actively seeking contributions to fill these empty spots. If you see a chapter marked as "Content to be written" or notice an incomplete section, consider contributing content based on your understanding of Barry Harris's methods.

### How to Get Started

**Option 1: Report Issues (No Technical Skills Required)**

If you find an error or have a suggestion but don't want to edit files yourself:

1. Go to [GitHub Issues](https://github.com/KyleDickersonComposer/barry-book/issues)
2. Click "New Issue"
3. Describe what you found (typo, incorrect chord, unclear explanation, etc.)
4. Someone else can fix it based on your report

**Option 2: Edit Files Through Your Browser (Beginner-Friendly)**

You can edit files directly on GitHub without installing anything:

1. Navigate to the file you want to edit (most book content lives in `chapters/`)
2. Click the pencil icon in the top right that says "Edit this file"
3. Make your changes in the text editor that appears
4. Scroll down and click "Propose changes"
5. GitHub will guide you through creating a "pull request" (just follow the prompts)
6. Your change will be reviewed and merged

**Note**: GitHub automatically handles the technical stuff behind the scenes. You don't need to understand "forking" or "pull requests" - just click edit, make your change, and follow the prompts.

**Option 3: Fork and Work Locally (For Advanced Contributors)**

If you're making many changes or need to test builds:

- Fork the project to create your own copy
- Make your changes and test them locally
- Submit a pull request to propose your changes

For detailed instructions and resources, see [CONTRIBUTORS.md](CONTRIBUTORS.md).

**Community**:

- Join the [Discord community](https://discord.gg/9XJukbbtFz) to ask questions and connect with other contributors
- Check existing issues to see what others are working on

## Building the Book

If you just want to read the book, download the latest PDF from [www.barrybook.org](https://www.barrybook.org). If you are editing the source, build the PDF locally before submitting larger changes.

### Build With Docker

Docker lets you build the book without installing the music and publishing tools yourself.

1. Install Docker Desktop:

   Download and install Docker Desktop from [docker.com](https://www.docker.com/products/docker-desktop/), then start it so the `docker` command is available in your terminal.

2. Build the PDF:

   ```sh
   make pdf
   ```

   This uses Docker. If the build image is missing, Docker downloads it automatically.

The built PDF is also saved at `bin/main.pdf`.

3. Open the PDF:

   ```sh
   make open
   ```

The build process:

- Starts the Docker build image
- Processes `main.lytex` and included `.lytex` files with `lilypond-book`
- Copies `references.bib` into the build directory
- Runs `pdflatex`, `biber`, `makeglossaries`, and final LaTeX passes
- Generates `bin/main.pdf`

### Clean Build Artifacts

```sh
make clean
```

This removes temporary files, build artifacts, and the `bin/` directory.

### Troubleshooting

- If `make pdf` fails before the build starts, make sure Docker Desktop is installed and running
- LaTeX errors often require multiple compilation passes; the Makefile handles this automatically
- Check `bin/main.log` for detailed LaTeX compilation errors

## Project Structure

- `main.lytex` - Main LaTeX document
- `chapters/` - Chapter source files grouped by book part
- `chapters/frontmatter/` - Introduction source
- `chapters/foundations/` - Foundations chapters
- `chapters/linear-concepts/` - Linear Concepts chapters
- `chapters/harmonic-concepts/` - Harmonic Concepts chapters
- `chapters/applications/` - Tune-study application chapters
- `source/` - LilyJAZZ styles and templates
- `bin/` - Build output directory (gitignored)
