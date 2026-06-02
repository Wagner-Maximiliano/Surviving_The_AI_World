# ADR-001: Pandoc PDF Engine Selection
**Status:** ACCEPTED
**Owner:** hermes-coder (openai/gpt-5-codex via OpenRouter)
**Decision date:** 2026-06-02
**Linked task:** Task 0.2 in PLAN.md

## Context

*Surviving the AI World* is authored in Markdown and built to both PDF and
EPUB through Pandoc. The PDF path requires a LaTeX engine. The three realistic
candidates are `pdflatex`, `xelatex`, and `lualatex`.

Constraints that shape the choice:

1. **Unicode.** The book cites authors and incidents with non-ASCII names
   (Harari, Tegmark, Ó Riain, Schönberger), uses curly quotes, em-dashes,
   and may include occasional non-Latin scripts in source titles.
   `pdflatex` requires explicit input encoding handling and breaks on many
   Unicode glyphs.
2. **System fonts.** Trade nonfiction typesetting benefits from access to
   OpenType/TrueType system fonts (DejaVu, Latin Modern, or a future
   typographically-chosen face). `xelatex` and `lualatex` both support this
   via `fontspec`; `pdflatex` does not.
3. **Trade-nonfiction convention.** Both `xelatex` and `lualatex` are
   standard for book-length trade nonfiction in the Pandoc ecosystem.
   `xelatex` has a smaller memory footprint and faster build than
   `lualatex` for documents of this size (~90k words, mostly prose).
4. **CI availability.** Both engines ship in `texlive-xetex` /
   `texlive-luatex` packages on Ubuntu runners. No deployment difference.

## Decision

Use **`xelatex`** as the Pandoc PDF engine, configured via
`--pdf-engine=xelatex` in the `Makefile` and `build/defaults.yaml`.

## Consequences

**Positive:**
- Unicode "just works" — no `inputenc`/`fontenc` ceremony.
- System fonts available via `fontspec` once a typeface is chosen in a
  later phase.
- Faster than `lualatex` for prose-heavy documents at this scale.
- Standard, well-documented choice; low support burden.

**Negative / accepted trade-offs:**
- Slightly slower than `pdflatex` (acceptable — build runs in CI, not
  on hot path).
- `xelatex` does not support every legacy LaTeX package; if a future
  template requirement needs a `pdflatex`-only package, revisit this ADR.

**Reversibility:** MEDIUM. Switching engines later requires retesting the
template and any embedded LaTeX. No content lock-in.
