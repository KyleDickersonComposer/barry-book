### The Barry Book
The Barry Book is a free and open-source fakebook that conforms to Barry Harris' jazz concepts.

If you find an error in the manuscript please click on the [issues tab](https://github.com/KyleDickersonComposer/barry-book/issues) and create an issue describing the problem.

Come hang out in the [Discord](https://discord.gg/twWTvcK3)!

### Technical Details
- We will use [Lilypond](https://lilypond.org/) for the musical engraving with the [LilyJAZZ](https://github.com/OpenLilyPondFonts/lilyjazz) font.
- We will include Barry Harris exercises and scale maps for each tune.
- There will be generalized exercise material.
- Installing the LilyJazz Font will be a challenge for those without a technical background.

### How To Install
1. Find the fonts directory of your lilypond install and add the necessary LilyJAZZ fonts.
1. You may need to setup the font familty in the font config file in the Lilypond fonts folder.
1. Create a `.ly` directory in you home directory.
1. Copy the `.ily` style files from LilyJAZZ into `~/.ly`

Then, build the `.ly` files with this command:
```sh
lilypond -I ~/.ly --pdf -o myTitle MyLilyPond.ly
```
