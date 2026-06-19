# Table of Contents: Format Spec

This directory holds the book's 30-chapter Table of Contents, split across 5
Part files (6 chapters each). The structure here is locked. Downstream tasks
populate the entries in place; they do not restructure.

## Directory layout

All files live under `manuscript/toc/`:

```
manuscript/toc/
  README.md                    (this file)
  part1-baseline.md
  part2-disruption.md
  part3-predictable-future.md
  part4-unknown.md
  part5-playbook.md
```

## Naming convention (locked)

Files are named `part<N>-<slug>.md`, where `<N>` is the Part number (1-5) and
`<slug>` is the lowercase hyphenated label of the Part. The five canonical
filenames are:

1. `part1-baseline.md`
2. `part2-disruption.md`
3. `part3-predictable-future.md`
4. `part4-unknown.md`
5. `part5-playbook.md`

No other filenames are valid. If a later task references a Part file, it
references one of these five exact paths.

## Per-chapter entry schema

Each Part file contains 6 chapter entries. Every entry has the following
fields, in this order:

| Field | Required | Notes |
|-------|----------|-------|
| `title` | Yes | Chapter title, title case |
| `Part` | Yes | Integer 1-5, matches the Part file |
| `ordinal` | Yes | Integer 1-6, chapter ordinal within the Part |
| `premise` | Yes | One-paragraph summary, capped at 120 words |
| `knowledge promise` | Yes | One sentence: what the reader will know after finishing |
| `source DNA most relied on` | Yes | Short name of the primary source drawn from the project Source DNA |

### Schema rules

- `title` uses title case per `bible/STYLE.md` section 9.
- `Part` and `ordinal` together uniquely identify the chapter within the TOC.
- `premise` is capped at 120 words. Entries exceeding this are rejected at
  review time.
- `knowledge promise` is a single sentence starting with a present-tense verb
  ("Learn...", "Understand...", "Recognize...").
- `source DNA most relied on` uses the short canonical name from the project's
  Source DNA list.

## Precedence rule (permanent)

Two documents govern chapter content in this project:

1. **`plans/issue-59/PLAN.md` Phase 2 acceptance criteria** is the authority for
   the TOC entry schema. The fields, constraints, and semantics defined above
   follow from that document.
2. **`bible/CHAPTER_TEMPLATE.md`** governs full chapter manuscripts authored
   later (Phase 3 onward). It defines section order, frontmatter shape, and
   per-chapter prose rules.

When these two documents disagree on per-chapter fields, **`PLAN.md` wins for
the TOC**. `CHAPTER_TEMPLATE.md` wins for full chapter prose. This precedence
is permanent and applies to every Part file in this directory.

## Stub constraint

Each Part file starts as a thin stub containing only a header identifying the
Part and one example entry that conforms to the schema above. Tasks 2.1-2.5
(#52-56) overwrite these stubs in place with real chapter entries. The stubs
must remain thin so they can be populated without restructuring. A coder
reading a stub can fill it by appending entries that match the example shape.

## How to populate a Part file

1. Read the stub at `manuscript/toc/part<N>-<slug>.md`.
2. Replace the example entry with real chapter entries that match the schema.
3. Add 5 more entries (6 total) for the remaining chapters in that Part.
4. Do not change the file structure or field order.
5. Open a PR against the default branch with the completed entries.
