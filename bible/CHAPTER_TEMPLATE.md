# Chapter Template

The canonical skeleton every chapter of *Surviving the AI World* must follow. This template is normative. Chapters that deviate are sent back for rework.

The template defines five sections in fixed order: **Scenario**, **Knowledge**, **Field notes**, **Further reading**, **Endnotes**. The frontmatter is non-optional and must validate against the schema below.

This file is the structural contract referenced by `bible/SCENARIO_GROUNDING.md`, `bible/SOURCE_RUBRIC.md`, `bible/FIELD_NOTES.md`, and `bible/STYLE.md`. When a downstream rule conflicts with this template, this template wins on shape; the rubric wins on content.

---

## 1. Frontmatter schema

Every chapter file opens with a YAML frontmatter block. Field order is fixed. No extra fields. No empty values: use `TBD` only in dossier stage, never in committed chapter prose.

```yaml
---
title: "Chapter title in title case"
part: 1                     # integer 1–5
chapter: 1                  # integer 1–6, ordinal within the Part
status: "dossier"           # one of: dossier | drafting | review | final
primary_sources:            # 3–8 entries; canonical short names from Source DNA
  - "SAS Survival Handbook"
  - "MIT Technology Review"
  - "Tegmark, Life 3.0"
themes:                     # 2–5 tags from bible/THEMES.md (Phase 4)
  - "analog-digital tension"
  - "community and trust"
word_target: 3000           # integer; chapter body word target (excluding endnotes)
last_reviewed: 2026-06-02   # ISO 8601 date; updated on every editorial pass
---
```

Schema rules:

- `part` and `chapter` together uniquely identify the chapter. The pair must match the chapter's path under `manuscript/`.
- `status` advances monotonically: `dossier` → `drafting` → `review` → `final`. Never regresses without a CTO-approved comment in the PR.
- `primary_sources` uses short, recognisable names. Full citations live in `endnotes.md`.
- `themes` ties chapters to the cross-Part theme matrix produced in Phase 4. Empty in Phase 3; populated in Phase 4.
- `word_target` is the *body* target. Endnotes and the field-notes box do not count.
- `last_reviewed` is the date of the most recent editorial pass on this file.

---

## 2. Section order and rules

Sections appear in the order below. Section headings are `##`. Subsection headings are `###`. No `#` headings inside a chapter file, the chapter title comes from frontmatter and is set by the build.

### `## Scenario`

A narrative opening that drops the reader into a concrete moment.

| Field | Rule |
|---|---|
| Length | 200 words, ±25% (150–250) |
| Format | Narrative prose. Single block, no subheadings |
| Tense | Present or near-future. Not past. Not conditional |
| Opening | Concrete sensory detail (a sound, a screen, an object). **No exposition before the action begins** |
| Sourcing | Seeded from a documented real-world incident (see `bible/SCENARIO_GROUNDING.md`). The seeding incident is cited in endnote `[^1]` |
| Names | Real names when public record permits. Pseudonymised only when legally required, and the substitution is footnoted |
| Dialogue | Paraphrased from primary source only. No invented dialogue |
| Voice | Matches `bible/VOICE.md`: calm, dry, no panic, no triumphalism |

The Scenario answers the question *what does this look like when it happens?* and ends in a way that hands the reader off into the Knowledge section without a transition paragraph.

### `## Knowledge`

The substantive content of the chapter. This is where the reader gets the model, the mechanism, the history, or the framework the rest of the chapter depends on.

| Field | Rule |
|---|---|
| Length | Bulk of the chapter. `word_target` minus ~300 (Scenario) minus ~250 (Field notes block) minus ~150 (Further reading) |
| Structure | 3–6 named subsections (`###`). Each subsection covers one idea fully before the next begins |
| Claims | Every non-trivial factual claim, numbers, named events, attributed positions, technical mechanisms, gets a numbered endnote |
| Sourcing | Sources meet `bible/SOURCE_RUBRIC.md`. At least one Tier-1 or Tier-2 citation per non-trivial claim |
| Voice | Authoritative without preaching. Defines terms on first use. No second-person scolding. No futurist jargon |
| Cross-references | Use `(see Ch. X.Y)` for explicit cross-references; the Phase 4 pass verifies these resolve |

The Knowledge section is the part that ages slowest if sourced well. Treat it like reference material that happens to read clearly, not like an essay.

### `## Field notes`

A boxed-style block of concrete actions the reader can take in the next week. Rendered as a Pandoc fenced div.

````
::: field-notes
1. **Imperative verb + concrete object.** One to three sentences. Testable in under a week by an individual or small group.
2. **Next action.** ...
:::
````

| Field | Rule |
|---|---|
| Count | 5 to 8 numbered actions. Hard ceiling at 8 |
| Each item | Imperative verb + concrete object + measurable outcome. 1–3 sentences |
| Testability | An honest reader can determine, within a week, whether they did the thing |
| Format | Pandoc fenced div with class `field-notes`. Numbered list inside. Bold opening clause |
| Forbidden | Vague exhortations ("be aware", "consider", "stay informed"), open-ended goals ("live sustainably"), or actions requiring resources most readers cannot acquire in a week |

`bible/FIELD_NOTES.md` defines acceptable and unacceptable shapes in detail with 25 worked examples.

### `## Further reading`

A short pointer block, not a substitute for the chapter's endnotes.

| Field | Rule |
|---|---|
| Count | 3–5 entries |
| Source | Drawn from the project's Source DNA. At least one named author per Part across the book |
| Format | `- *Title*, Author (Year). <One sentence on why this matters for the chapter>.` |
| Annotation | The one-sentence note explains relevance to *this chapter*, not the book |
| Forbidden | Articles already cited in the endnotes (these belong in endnotes, not here). Web-only pointers without a stable title. AI-generated summaries |

### `## Endnotes`

Numbered citations referenced from the Scenario and Knowledge sections.

| Field | Rule |
|---|---|
| Numbering | Sequential from `[^1]` in order of first reference in the chapter |
| Style | Chicago Manual of Style, notes-bibliography flavour, per `bible/STYLE.md` |
| Archive | Every URL has a `Archived:` Wayback URL captured at dossier time |
| Format | `[^N]: <Author, "Title.">. <Publication>, <date>. <URL>. Archived: <Wayback URL>.` |
| Paywalls | If the live URL is paywalled, the archive URL is non-optional (see `bible/SOURCE_RUBRIC.md`) |

A consolidated bibliography is assembled across chapters in Phase 7. Chapter-local endnotes are the source of truth.

---

## 3. What is NOT in this template

The following do not appear in any chapter file. A chapter that contains any of them is sent back.

- **Chatty asides.** No "as we'll see", "buckle up", "here's the thing". The voice carries; it does not banter.
- **First-person opinion.** Chapters speak from the project, not from an author persona. "I think" and "in my view" are out.
- **Embedded marketing.** No links to the author's site, courses, newsletter, or affiliate products. Further reading is for the reader's next book, not the author's next sale.
- **AI-generated images.** Diagrams must be human-authored or sourced under a permissive license with attribution. Generative images are not used anywhere in the book.
- **Auto-generated text without attribution.** Any agent-written scaffolding the human keeps must be edited in their voice before commit. Dossier prose is not chapter prose.
- **Promotional callouts for tools, vendors, or platforms.** Tools may be named when necessary; they are not endorsed.
- **Hedging filler.** "It is worth noting that", "one might argue", "in some sense". Cut them.
- **Speculation outside Part 4.** Parts 1–3 and 5 stay grounded in current capability and documented incident. Forward-looking framing belongs in Part 4 under the `SCENARIO_GROUNDING.md` extrapolation rule.

---

## 4. Worked example

A stub of Chapter 2.3 (illustrative; not the actual chapter) showing the template populated. Numbers and citations here are placeholders for shape, not for fact.

```markdown
---
title: "When the Voice on the Phone Is Not Your Daughter"
part: 2
chapter: 3
status: "dossier"
primary_sources:
  - "MIT Technology Review"
  - "Federal Trade Commission consumer alerts"
  - "Suleyman, The Coming Wave"
themes:
  - "trust under synthetic media"
  - "family OPSEC"
word_target: 3000
last_reviewed: 2026-06-02
---

## Scenario

The call comes at 11:14 on a Tuesday night. The voice is her daughter's:
the cadence, the small catch on the second syllable of "Mom", the way she
clears her throat before bad news. She is in a holding cell in Tijuana.
She needs $9,000 wired to a bail bondsman within the hour. The bondsman
takes the phone. He sounds tired and competent. He gives a case number.
[... ~180 more words, ending on the moment of decision, no exposition ...]
[^1]

## Knowledge

### How voice cloning got cheap

In 2023, cloning a recognisable voice required roughly thirty seconds of
clean audio and a consumer GPU.[^2] By 2025, three seconds was enough on
commodity cloud inference.[^3] [...]

### What the fraud actually exploits

[...]

### Why the obvious defences fail

[...]

## Field notes

::: field-notes
1. **Agree a family duress phrase tonight.** Pick a sentence none of you
   would ever say in casual conversation. Write it nowhere. Use it only
   when the caller's identity is in doubt.
2. **Test the phrase next Sunday.** Call one family member without
   warning. Confirm they remember it. If they don't, pick a new one and
   try again the following week.
3. **Cap wire-transfer authority at your bank.** Visit your branch this
   week and set a daily wire ceiling that requires a 24-hour cooling-off
   period to raise.
4. [...]
:::

## Further reading

- *The Coming Wave*, Mustafa Suleyman (2023). Frames synthetic-media
  fraud as a containment problem rather than a detection problem.
- *Deepfakes and the New Disinformation War*, Chesney & Citron (2019).
  The earliest serious legal-policy treatment; still the clearest
  taxonomy.
- *MIT Technology Review*, "The voice on the phone is a deepfake."
  (April 2024). The reporting that anchored this chapter's scenario.

## Endnotes

[^1]: FBI Internet Crime Complaint Center, "Public Service Announcement
  I-051023-PSA: Voice cloning fraud against family members." 10 May
  2023. https://www.ic3.gov/Media/Y2023/PSA230510. Archived:
  https://web.archive.org/web/20230515000000/https://www.ic3.gov/Media/Y2023/PSA230510.

[^2]: Karen Hao, "Anyone can clone your voice in three seconds." *MIT
  Technology Review*, 4 March 2024.
  https://www.technologyreview.com/2024/03/04/voice-cloning. Archived:
  https://web.archive.org/web/20240306000000/https://www.technologyreview.com/2024/03/04/voice-cloning.

[^3]: [...]
```

Use the worked example to calibrate shape, not content. The actual Chapter 2.3 will be sourced and written from its own dossier.
