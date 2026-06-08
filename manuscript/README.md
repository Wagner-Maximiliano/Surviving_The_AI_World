# Surviving the AI World — Manuscript

## What's here

This directory contains the source manuscript for *Surviving the AI World*, a survival manual for the AI disruption ahead. The full project plan lives in [`../PLAN.md`](../PLAN.md).

## Directory structure

```
manuscript/
  part-1-baseline/         # Part 1: AI Baseline
    ch-01, ch-02, … ch-06
  part-2-disruption/       # Part 2: The Disruption Underway
    ch-01, ch-02, … ch-06
  part-3-predictable-future/
    ch-01, ch-02, … ch-06
  part-4-unknown/          # Part 4: Unknown Long Tail
    ch-01, ch-02, … ch-06
  part-5-playbook/         # Part 5: Practical Playbook
    ch-01, ch-02, … ch-06
  TOC.md                   # Locked table of contents (Phase 2)
```

Each chapter lives in its own directory (`part-N/ch-NN/`) with a `chapter.md` file containing YAML frontmatter (title, part, chapter number, status) and the chapter body.

## Building the book

The full book is built from this directory into `../dist/` using Pandoc.

**Prerequisites:** `pandoc`, `texlive-xetex`, `make`

```bash
# From the repo root:
make pdf        # Build PDF: dist/surviving-the-ai-world.pdf
make epub       # Build EPUB: dist/surviving-the-ai-world.epub
make all        # Build both
make clean      # Remove build artifacts
```

See `../build/` for Pandoc configuration (templates, defaults files).

## Linting

The manuscript is linted for style consistency using Vale (proselint rules + local banned-phrase list).

**Prerequisites:** `vale`

```bash
# From the repo root:
vale sync              # One-time: pull the proselint package
vale manuscript/       # Lint all chapters
```

The linter enforces a calm, dry, confident voice. See `../styles/Surviving/banned-phrases.yml` and `../.vale.ini` for rules.

## Chapter rules

Every chapter must follow the rules in `../bible/` (voice, structure, sourcing, grounding). Key constraints:

- **Scenarios must cite real incidents** — no invented anecdotes.
- **Claims must be sourced** — every non-trivial factual statement gets a numbered endnote + bibliography entry.
- **Field notes must be testable** — tangible actions an individual or small group can do in <1 week.
- **Voice is calm, dry, confident** — SAS Survival Handbook meets *Nexus*.

## Contributing

See [`CONTRIBUTING.md`](./CONTRIBUTING.md) for branch naming, commit format, and the agent-to-agent coordination protocol.

## Pre-commit hooks

Before your first commit, install pre-commit hooks to catch secrets and style issues:

```bash
cd ..
pip install pre-commit
pre-commit install
```

Hooks will run on every commit and reject unsafe changes (no secrets, no trailing whitespace, lint checks).
