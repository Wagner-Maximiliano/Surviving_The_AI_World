# Surviving the AI World

A field manual for the disruption ahead — a trade-nonfiction book covering the
pre-AI baseline, the disruption underway, the predictable near future, the
unknown long tail, and a practical playbook.

**Project plan and phase ledger:** see [`PLAN.md`](./PLAN.md) (human and agent coordination lives here).

## I'm a writer. Where do I start?

This book is built by the Max Agency (a fleet of AI agents) and a human author working together. The agency produces **scaffolding** — outlines, research, scenarios, cited claims, and field-notes drafts — and **you** write the chapter prose from it.

**Your job:**
1. Read [`PLAN.md`](./PLAN.md), section "**Phases**", to understand the project timeline and current phase.
2. Depending on the phase:
   - **Phase 0–2:** Agents building the framework. You can review and comment, but no prose to write yet.
   - **Phase 3:** Agents researching 30 chapters. Check back when Phase 4 (scaffolding integration) is done.
   - **Phase 5 onwards:** Your prose-writing phase. You'll receive **research dossiers** in `manuscript/<part>/<chapter>/dossier.md` for each chapter. Use these as your reference and write the chapter prose into `chapter.md`.

**Your constraints:**
- Read [`bible/`](./bible/) for the style, voice, and structure rules every chapter must follow.
- Every factual claim in your prose must have a citation in `chapter.md` (endnotes are generated from these).
- Field-notes must be testable by someone in <1 week (no vague advice).
- The tone is calm, dry, and confident — think SAS Survival Handbook meets policy analysis.

**Your tools:**
```bash
make pdf      # Build your chapters into a PDF (requires pandoc, texlive-xetex, make)
make epub     # Build into EPUB
vale manuscript/  # Lint your prose for voice drift (requires vale)
```

For more details, see [`CONTRIBUTING.md`](./CONTRIBUTING.md).

---

## I'm an agent. Where do I start?

You're picking up a task assigned via GitHub Issue. The task is part of a larger **phase** in [`PLAN.md`](./PLAN.md).

**Your workflow:**
1. Read your **role contract** (in the Max_Agency repo `agents/` folder — `architect.md`, `coder.md`, `cto.md`, or `orchestrator.md`).
2. Read the **task issue** carefully — acceptance criteria, dependencies, and any `CHANGES REQUIRED` comments from prior attempts.
3. Check the **current phase** in [`PLAN.md`](./PLAN.md) to understand what gates must pass before you can proceed.
4. Load relevant **skills** from the Max_Agency repo `skills/` folder (your role contract tells you how).
5. Work on your **assigned branch** in your **own worktree** (one task = one branch = one worktree).

**Key constraints:**
- **Don't write chapter body prose.** Phase 5 onwards is human-authored. You write scaffolding (dossiers, outlines, research, field-notes drafts) in Phases 0–4.
- **Every scenario** must cite a real, documented incident (not invented).
- **Every source** must be Tier 1 or 2 (peer-reviewed, established journalism, or published trade nonfiction). See [`bible/SOURCE_RUBRIC.md`](./bible/SOURCE_RUBRIC.md).
- **Follow the template.** Check [`bible/CHAPTER_TEMPLATE.md`](./bible/CHAPTER_TEMPLATE.md) for the exact structure of research dossiers and field-notes.

**Your tools:**
```bash
make pdf      # Build a test PDF from your scaffolding (requires pandoc, texlive-xetex, make)
vale manuscript/  # Lint your writing for voice drift (requires vale)
```

**Communication:**
- All task coordination is via GitHub Issues and labels. Read [`docs/AMA.md`](../Max_Agency/docs/AMA.md) in the Max_Agency repo for the agent-to-agent protocol (identity, handoff, escalation).
- Commits follow `<phase-id>/<issue-#>: <subject>` format (e.g., `p0/#38: update README and CONTRIBUTING for clarity`).

---

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
  VOICE.md              # Tone and voice rules with examples
  CHAPTER_TEMPLATE.md   # Required structure for every chapter
  SCENARIO_GROUNDING.md # Rules for scenario-opening citations
  SOURCE_RUBRIC.md      # Tier list for acceptable sources
  FIELD_NOTES.md        # Definition of "testable action"
  STYLE.md              # Chicago Manual + project-specific rules
build/                   # Pandoc defaults + build notes
styles/                  # Vale styles (local + synced)
docs/adr/                # Architecture Decision Records
dist/                    # Build artifacts (gitignored)
.github/workflows/       # CI: lint + build + artifact upload
```

## Build locally

Requires `pandoc`, `texlive-xetex`, `make`, and `vale`.

```bash
# Install lint tools (one-time)
vale sync             # pull the proselint package

# Build
make pdf              # -> dist/surviving-the-ai-world.pdf  (xelatex)
make epub             # -> dist/surviving-the-ai-world.epub
make all              # both
make clean            # remove build outputs

# Lint
vale manuscript/      # check all chapters for voice drift and errors
```

Local style (`styles/Surviving/banned-phrases.yml`) flags corporate-speak.
See `.vale.ini` for the complete rule set.

## Setup (pre-commit hooks)

Before your first commit, install pre-commit hooks to catch secrets and formatting issues:

```bash
pip install pre-commit
pre-commit install
```

## Contributing

See [`CONTRIBUTING.md`](./CONTRIBUTING.md) for branch naming, commit format, PR process, and detailed workflows for writers and agents.
