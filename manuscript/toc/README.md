# Table of Contents — Structure and Precedence

This directory holds the locked per-Part TOC stubs for *Surviving the AI World*.

## File naming convention

Every per-Part TOC file follows the pattern:

```
part<N>-<slug>.md
```

where `<N>` is the Part number (1–5) and `<slug>` is the lowercase, hyphenated Part name.

## Canonical filenames

| Part | File |
|------|------|
| Part 1 — Baseline | `part1-baseline.md` |
| Part 2 — Disruption | `part2-disruption.md` |
| Part 3 — Predictable Future | `part3-predictable-future.md` |
| Part 4 — Unknown | `part4-unknown.md` |
| Part 5 — Playbook | `part5-playbook.md` |

These five files are the only canonical per-Part TOC files. No other files belong in this directory.

## Per-chapter entry schema

Each chapter listed in a per-Part TOC file must include the following fields:

| Field | Type | Constraint |
|-------|------|------------|
| `title` | string | Chapter title in title case |
| `Part` | integer | 1–5 |
| `ordinal` | integer | 1–6, the chapter's position within its Part |
| `premise` | string | One paragraph, **≤ 120 words**. Describes what the chapter covers and why it matters. |
| `knowledge promise` | string | What the reader will be able to do or understand after finishing the chapter. |
| `source DNA most relied on` | string | The canonical source (from the project's Source DNA list) the chapter depends on most heavily. |

### Example entry

```markdown
- **Title:** When the Voice on the Phone Is Not Your Daughter
  - **Part:** 2
  - **Ordinal:** 3
  - **Premise:** Voice-cloning fraud exploits the one channel most people still trust implicitly: a phone call from someone they love. This chapter walks through how the technology got cheap, what the fraud actually exploits, and why the obvious defences are already failing. (≤120 words)
  - **Knowledge promise:** The reader will be able to evaluate voice-call authenticity under pressure and set up a family duress protocol.
  - **Source DNA most relied on:** Suleyman, *The Coming Wave*
```

## Overwrite policy

Later tasks (Phase 2 chapter-list drafting, Phase 3 dossier work) **overwrite these per-Part files in place**. The stubs in this directory are intentionally thin — they exist to reserve the file slots and document the schema, not to hold final content. When a later task writes a full chapter list to one of these files, it replaces the stub entirely. The stubs must remain thin; do not expand them into full chapter lists here.

## Permanent precedence rule

Two documents govern content in this repo, and they apply at different scopes:

1. **`PLAN.md` Phase 2 acceptance criteria** governs **TOC entries** — the chapter list, premises, knowledge promises, and source-DNA mappings in the per-Part files in this directory.
2. **`bible/CHAPTER_TEMPLATE.md`** governs **full chapters** — the structure, sections, frontmatter schema, and content rules for individual chapter files under `manuscript/part-*/ch-*/`.

When a conflict arises between the two scopes, the document governing the relevant scope wins. TOC-level decisions defer to `PLAN.md` Phase 2; chapter-level decisions defer to `bible/CHAPTER_TEMPLATE.md`.
