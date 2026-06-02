# Build setup notes

The book builds with Pandoc reading `manuscript/**/chapter.md` in path-sorted
order and emitting `dist/surviving-the-ai-world.{pdf,epub}`.

## Local prerequisites

- `pandoc` >= 3.0
- `texlive-xetex` (or any TeX distribution providing `xelatex`)
- `make`

On Debian/Ubuntu: `apt install pandoc texlive-xetex make`.

## Targets

- `make pdf`  — build the PDF via xelatex.
- `make epub` — build the EPUB.
- `make all`  — both.
- `make clean` — remove built artifacts.

## Fonts

The defaults file pins DejaVu Serif / DejaVu Sans Mono, both shipped with
`fonts-dejavu` on Debian/Ubuntu and bundled with most TeX distributions. If a
contributor's system lacks them, override at build time:

    make pdf PANDOC_FONT_OVERRIDE='-V mainfont="Latin Modern Roman"'

(The Makefile does not currently wire that variable; this is a documentation
note for the Phase 1+ template work.)

## Why xelatex

See `docs/adr/ADR-001-pandoc-pdf-engine.md`.
