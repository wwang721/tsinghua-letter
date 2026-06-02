# Tsinghua Letter Template

[![LaTeX build](https://github.com/wwang721/tsinghua-letter/actions/workflows/build.yml/badge.svg)](https://github.com/wwang721/tsinghua-letter/actions/workflows/build.yml)
[![license](https://img.shields.io/github/license/wwang721/tsinghua-letter)](https://github.com/wwang721/tsinghua-letter/blob/main/LICENSE)


An UNOFFICIAL **XeLaTeX** letter template with a Tsinghua letterheader, purple theme color (#671372), **Chinese support**, and a faint logo watermark on every page.

## Build

Requires a TeX distribution with `latexmk` and **XeLaTeX**.
If you are using **Overleaf**, set the compiler to **XeLaTeX** under `Settings → Compiler`.
If you are using another LaTeX editor or plugin, configure it to use **XeLaTeX** as well.

To compile from the command line:

```sh
make
make clean
make cleanall
```

`make` builds the watermark PDF if needed, then builds `main.pdf`. `make clean` removes LaTeX auxiliary files and keeps generated PDFs. `make cleanall` also removes generated PDFs.

## Example

![Example](example.png)

## Files

- `main.tex`: letter content, sender information, fonts, page numbering, and watermark placement.
- `custom_letter.cls`: letter class and first-page letterhead layout.
- `full_logo.pdf`: header logo.
- `logo.pdf`: source logo used to generate the faded watermark.
- `watermark/`: standalone watermark source and generated watermark PDF.
- `signature.pdf`: optional signature image.

## License

<a href="https://creativecommons.org/licenses/by/4.0"><img src=".github/by.svg" width="100"></a>

This project is licensed under the [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/), see [LICENSE](LICENSE).
The source comments preserve attribution for earlier template code. University logos, trademarks, and signature images may have separate rights.
