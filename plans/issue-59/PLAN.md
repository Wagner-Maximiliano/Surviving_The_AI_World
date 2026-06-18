## Summary

Create `manuscript/toc/` and establish its format so the downstream TOC-population tasks (#52–56, Phase 2 tasks 2.1–2.5) have a consistent, agreed-upon target. The deliverable is a `manuscript/toc/README.md` that documents the directory layout, file naming, and per-chapter entry schema, plus five thin placeholder stub files — one per Part. This task locks the structural decisions; it does not author chapter content.

## Scope

**In scope**
- Create the `manuscript/toc/` directory.
- Author `manuscript/toc/README.md` specifying naming convention, per-chapter schema, and the schema-precedence rule.
- Create five thin stub files, one per Part, using the locked naming convention.

**Out of scope**
- Populating the stubs with real chapter entries — that is the job of tasks 2.1–2.5 (#52–56), each of which owns and overwrites its corresponding Part file.
- Any change to `PLAN.md` or `bible/CHAPTER_TEMPLATE.md`.
- Full-chapter formatting (governed by `CHAPTER_TEMPLATE.md`, not this TOC).

## Files to change

| File | Action |
|------|--------|
| `manuscript/toc/README.md` | Create — format spec + precedence rule |
| `manuscript/toc/part1-baseline.md` | Create — thin stub |
| `manuscript/toc/part2-disruption.md` | Create — thin stub |
| `manuscript/toc/part3-predictable-future.md` | Create — thin stub |
| `manuscript/toc/part4-unknown.md` | Create — thin stub |
| `manuscript/toc/part5-playbook.md` | Create — thin stub |

**Naming convention (locked):** `part<N>-<slug>.md`, exactly 5 files, one per Part. This is not negotiable or "to match conventions" — it follows the convention already established by issue #55, which writes `manuscript/toc/part4-unknown.md`. The five Parts per `PLAN.md` are Baseline, Disruption, Predictable Future, Unknown, and Playbook, yielding exactly the five filenames above.

## Steps

1. **Create the directory** `manuscript/toc/`.

2. **Write `manuscript/toc/README.md`** documenting:
   - The naming convention `part<N>-<slug>.md` and the canonical list of 5 files.
   - The **per-chapter entry schema** (one entry per chapter within each Part file): `title`, `Part`, `ordinal`, a `premise` of ≤120 words, a `knowledge promise` line, and a `source DNA most relied on` line.
   - The **precedence rule** (permanent): `PLAN.md` Phase 2 acceptance criteria is the authority for the TOC entry schema. `bible/CHAPTER_TEMPLATE.md` governs full chapters authored later, **not** TOC entries. Where the two disagree on per-chapter fields, `PLAN.md` wins for the TOC.
   - The **stub constraint** (see Acceptance criteria): tasks 2.1–2.5 fill these files in place; stubs must be thin so they can be populated without restructuring.

3. **Create the 5 thin stub files.** Each contains only a header/frontmatter identifying the Part plus exactly one example chapter entry that conforms to the schema, marked clearly as a placeholder/example. No real content.

## Acceptance criteria

- `manuscript/toc/README.md` exists and specifies: the `part<N>-<slug>.md` convention, the 5 canonical filenames, the per-chapter schema (`title`, `Part`, `ordinal`, ≤120-word `premise`, `knowledge promise` line, `source DNA most relied on` line), and the precedence rule (PLAN.md authoritative for TOC; CHAPTER_TEMPLATE.md for full chapters).
- All 5 stub files exist at the exact paths listed above.
- Each stub is **thin**: header/frontmatter + a single example chapter entry only — no authored chapter content. The stubs are explicitly designed to be overwritten by tasks 2.1–2.5 (#52–56), each of which produces its own per-Part file as its deliverable into the same path. A coder reading a stub can populate it without changing its structure.
- The schema in README.md is internally consistent with the one example entry shown in each stub.

## Risks

- **Clobber relationship (handled, not a hazard):** tasks 2.1–2.5 overwrite these exact files. This is intended. The mitigation — thin stubs whose structure matches the README schema — is built into the deliverable above so the later tasks fill rather than restructure.
- **Source disagreement:** `PLAN.md` and `bible/CHAPTER_TEMPLATE.md` may list different per-chapter fields. Resolved by the precedence rule (PLAN.md wins for the TOC), documented permanently in README.md.
- **Slug drift:** if a later issue references a Part filename with a different slug than locked here, the convention in README.md is the single source of truth; reconcile to these five names rather than introducing a parallel scheme.
