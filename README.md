# Surviving the AI World

A field manual for the disruption ahead — a trade-nonfiction book covering the
pre-AI baseline, the disruption underway, the predictable near future, the
unknown long tail, and a practical playbook.

Project plan and phase ledger: see [`PLAN.md`](./PLAN.md).

## Repo layout

```
manuscript/              # Book source (Markdown, per-chapter dirs)
  part-1-baseline/       # Parts 1-5, each with ch-01 .. ch-06
  part-2-disruption/
  part-3-predictable-future/
  part-4-unknown/
  part-5-playbook/
  TOC.md                 # Locked at end of Phase 2
bible/                   # Style/canon bible (populated Phase 1)
build/                   # Pandoc defaults + build notes
styles/                  # Vale styles (local + synced)
docs/adr/                # Architecture Decision Records
dist/                    # Build artifacts (gitignored)
.github/workflows/       # CI: lint + build + artifact upload
```

## Build

Requires `pandoc`, `texlive-xetex`, `make`, and `vale`.

```bash
make pdf      # -> dist/surviving-the-ai-world.pdf  (xelatex, see ADR-001)
make epub     # -> dist/surviving-the-ai-world.epub
make all      # both
make clean    # remove build outputs
```

## Lint

```bash
vale sync             # one-time: pull proselint package
vale manuscript/      # lint all chapters
```

Local style (`styles/Surviving/banned-phrases.yml`) flags corporate-speak.
See `.vale.ini` for the rule set.

## Contributing

See [`CONTRIBUTING.md`](./CONTRIBUTING.md) for branch naming, commit format,
and the agent-to-agent protocol used by the Max Agency.

Install pre-commit hooks (gitleaks + format checks) before your first commit:

```bash
pip install pre-commit
pre-commit install
```
