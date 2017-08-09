# kres LaTeX Template

This repository contains the LaTeX class files that I use to format my
resume. The `.cls` file and the documentation PDF are built with
`make`. If the Makefile is not included, build the `.cls` file by
running TeX on kres.ins and build the documentation by running
`pdflatex` on kres.dtx.

`make install` will place the generated class file under `TEXMFHOME`.

This project is under the MIT license. See LICENSE.txt, if included,
for the license text. If this file is not included see the text of the
PDF documentation for this class (kres.pdf).

## Dependencies
This class file is designed to work under a TeXLive distribution. It
depends on:

- `article`
- `fontenc`
- `hyperref`
- `navigator`
- `libertine`
- `multicol`
- `microtype`
- `xstring`
- `changepage`
- `xparse`
- `ifthen`

All of these packages should be included in a standard TeXLive
distribution.
