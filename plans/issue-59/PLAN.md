## Summary

Establish the `manuscript/toc/` directory before issues #52–55 (tasks 2.1–2.5) begin writing into it. Deliver a `README.md` that specifies the directory structure, file-naming convention, and per-chapter schema, plus one stub file per Part so all downstream tasks write into a consistent, agreed target.

## Scope

**In scope**
- Create the `manuscript/toc/` directory.
- Author `manuscript/toc/README.md` defining layout, naming, and per-chapter schema.
- Add one stub file per Part (one per the set of Parts covered by tasks 2.1–2.5).
- Align the schema with `PLAN.md` Phase 2 acceptance criteria and `bible/CHAPTER_TEMPLATE.md`.

**Out of scope**
- Populating real chapter content (that is tasks 2.1–2.5).
- Changing `PLAN.md`, `bible/CHAPTER_TEMPLATE.md`, or any tooling that consumes the toc files.

## Files to change

- `manuscript/toc/README.md` — new; format specification.
- `manuscript/toc/part-1.md` (and `part-2.md` … `part-N.md`) — new stub per Part, matching the count/naming implied by tasks 2.1–2.5.
- `manuscript/toc/` — new directory (implicitly created by the files above).

## Steps

1. Read `PLAN.md` Phase 2 acceptance criteria to extract required fields, Part count, and any naming/ordering constraints the downstream tasks depend on.
2. Read `bible/CHAPTER_TEMPLATE.md` and map its fields onto a per-chapter schema; reconcile any divergence from PLAN.md and note which source wins.
3. Decide the directory layout and file-naming convention (e.g. one file per Part, `part-<n>.md`, zero-padded or not — pick to match existing repo conventions).
4. Define the per-chapter schema: field list, required vs optional, types/format, ordering, and a worked example entry.
5. Write `manuscript/toc/README.md` documenting the structure, naming rules, schema, and a copy-paste-able stub template for a chapter.
6. Create one stub file per Part containing the header/frontmatter and an empty or example chapter entry conforming to the schema.
7. Cross-check each stub against the README and against the field expectations of tasks 2.1–2.5 so writers have an unambiguous target.

## Acceptance criteria

- `manuscript/toc/` exists and contains `README.md` plus exactly one stub file per Part covered by tasks 2.1–2.5.
- `README.md` fully specifies: directory layout, file-naming convention, and the per-chapter schema (every field, required/optional, format) with at least one example.
- The schema is consistent with both `PLAN.md` Phase 2 acceptance criteria and `bible/CHAPTER_TEMPLATE.md`; any intentional deviation is documented with rationale.
- Each stub file validates against the documented schema and can be appended to without restructuring.
- A reader of tasks 2.1–2.5 can determine, without further questions, which file to write and in what format.

## Risks

- **Field mismatch between sources:** `PLAN.md` and `CHAPTER_TEMPLATE.md` may disagree; pick a precedence rule and document it to avoid churn.
- **Part count / naming drift:** If tasks 2.1–2.5 assume different filenames or Part boundaries, stubs will be wrong — verify against the actual issue text before finalizing.
- **Over-specification:** Locking the schema too tightly now may force rework once real chapters are written; keep optional fields clearly optional.
- **Convention conflict:** Naming/format may clash with existing repo conventions elsewhere under `manuscript/`; check before committing.
