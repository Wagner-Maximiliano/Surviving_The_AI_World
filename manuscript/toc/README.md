# Table of Contents — Structure & Conventions

**Status:** LOCKED per ADR-003. This directory is the canonical landing point for
all TOC entries. Its contents are populated during Phase 2 (tasks 2.1–2.5) and
frozen once CTO sign-off is recorded. No further structural changes after
Phase 2 gate closes.

---

## File Naming Convention (locked)

Every TOC entry file lives at `manuscript/toc/` and follows the pattern:

    part<N>-<slug>.md

Where:

| Component | Meaning |
|-----------|---------|
| `part<N>` | Part number (1–5), matching the five Parts in the book |
| `<slug>` | Lowercase, hyphen-separated English descriptor of the Part |

The five canonical files (one per Part) are:

| # | File | Corresponds to |
|---|------|---------------|
| 1 | `part1-baseline.md` | Part 1 — Baseline (the world as-is) |
| 2 | `part2-disruption.md` | Part 2 — Disruption (what is changing) |
| 3 | `part3-predictable-future.md` | Part 3 — Predictable Future (where we are heading) |
| 4 | `part4-unknown.md` | Part 4 — Unknown (the open questions) |
| 5 | `part5-playbook.md` | Part 5 — Playbook (what to do about it) |

This convention is **locked**. No other files belong in `manuscript/toc/`.
Later tasks that write per-Part chapter content (tasks 2.1–2.5) **overwrite**
these exact files in place — they do not create new files or rename them.

---

## Per-Chapter Entry Schema

Each Part file contains a list of chapter entries, one per chapter. Every entry
follows this schema:

| Field | Required | Description |
|-------|----------|-------------|
| `title` | yes | Chapter title (max ~60 chars) |
| `Part` | yes | Part identifier (1–5) this chapter belongs to |
| `ordinal` | yes | Chapter number within the Part (1–6) |
| `premise` | yes | One-paragraph summary of the chapter's content, **≤120 words** |
| `knowledge promise` | yes | What the reader will be able to do or understand after this chapter |
| `source DNA most relied on` | yes | The single most important source this chapter draws from |

**Schema origin:** Defined in `PLAN.md` Phase 2 acceptance criteria. That
document is the **permanent authority** for the TOC entry schema.

---

## Precedence Rule (permanent)

Two documents define chapter structure at different levels of detail. When they
disagree, this rule resolves:

| Authority | Governs | Priority |
|-----------|---------|---------|
| `PLAN.md` Phase 2 acceptance criteria | TOC entry schema (title, Part, ordinal, premise, knowledge promise, source DNA) | **HIGH** — wins for the TOC |
| `bible/CHAPTER_TEMPLATE.md` | Full chapter body structure (scenario grounding, field notes, further reading, endnotes) | **LOW** — TOC entries do not use chapter template fields |

**Rationale:** The TOC is a structural index, not a chapter draft. Its entries
are locked before any chapter prose is written. The chapter template governs
the *full chapter* — a different artifact produced in a different phase. Where
the two documents list overlapping or contestable fields (e.g. whether
"premise" is a TOC-only field or also appears in the chapter template), the
TOC defers to `PLAN.md` because the TOC is frozen before the chapter template
is applied.

---

## Stub Constraint

The five Part files in this directory are **thin stubs**. Each contains:

1. A YAML frontmatter block identifying the Part
2. Exactly **one example chapter entry** that conforms to the schema above

They contain **no authored chapter content** — no body prose, no real chapter
premises, no actual source citations. Their purpose is to:

- Establish the structural convention so downstream tasks have a consistent
  target to write into
- Provide a single example that validates the schema is self-consistent
- Remain overwritable — tasks 2.1–2.5 (Phase 2) each produce their own
  per-Part file as the deliverable, writing into the exact same path

**Do not expand these stubs.** If you need more than one TOC entry per Part,
create the appropriate file for your Part and overwrite the stub.

---

## References

- [MANUAL TOC (existing)](../TOC.md) — placeholder, superseded by this directory
- [ADR-003 (TOC lock)] (../../docs/adr/ADR-003-toc-lock.md) — stub, body to be
  authored in task 2.6
- [PLAN.md] (../../PLAN.md) — canonical project plan, Phase 2 acceptance criteria
- [bible/CHAPTER_TEMPLATE.md] (../../bible/CHAPTER_TEMPLATE.md) — full chapter
  body template (not applicable to TOC entries)