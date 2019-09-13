# kres LaTeX Template

This repository contains the LaTeX class files that I use to format my
resume. Consult the PDF documentation for usage information.

# Building
If the Makefile was included with this package all files can be built
with `make`. The command `make install` will place the generated class
file under `TEXMFHOME`.

If the Makefile was not included the required files can be built
manually.  Build the `.cls` file by running TeX on kres.ins and build
the documentation by running `pdflatex` on kres.dtx.

# License
This project is under the MIT license. The license text is included in
each of the source files, in the PDF documentation for this class, and
in LICENSE.txt (if this file is present).

# Dependencies
This class file is designed to work under a TeXLive distribution. It
depends on:
- `article`
- `fontenc`
- `hyperref`
- `libertine`
- `multicol`
- `microtype`
- `xstring`
- `changepage`
- `xparse`
- `ifthen`
- `iftex`
- `luatex85` (if using LuaLaTeX)

All of these packages should be included in a standard TeXLive
distribution.
