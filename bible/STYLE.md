# Style Guide

Mechanical conventions for *Surviving the AI World*. This file resolves the small decisions, numbers, units, dates, acronyms, so 30 chapters and several writers do not each invent their own answer.

**Anchor:** *The Chicago Manual of Style*, 17th edition, is the default. Anything not specified below follows Chicago. The deltas below are intentional choices for this project.

This file pairs with `bible/VOICE.md` (register and rhetoric, which Chicago does not govern) and `bible/CHAPTER_TEMPLATE.md` (structural rules, which sit above style).

---

## 1. Numbers

- Spell out **one** through **nine**; use numerals for **10** and above.
- Always numerals for measurements, money, percentages, coordinates, and times: `5 km`, `\$9,000`, `1.2 percent` (or `1.2%` in tables), `04:12`, `48 hours`.
- Always numerals for years and decades: `2024`, `the 1970s` (no apostrophe).
- Spell out at sentence start, or rewrite the sentence. ("Twelve households reported…" or "In total, 12 households reported…")
- Ranges: en dash, no spaces: `2024–2025`, `pages 12–15`. In prose, prefer `between X and Y` for ambiguous dashes.
- Large round numbers: numerals + word for clarity. `3 million`, not `3,000,000`. `\$1.2 billion`.
- Ordinals: spell out **first** through **ninth**; numerals for **10th** and above.

## 2. Units

- **Metric primary.** SI units in the body. US customary in parentheses *only* if a US reader would be lost without it: `5 km (3 mi)`, `4 litres (1 gallon)`. Do not mix systems within a passage.
- **Unit spacing:** thin space between number and unit in print (Pandoc handles); a regular space in source: `5 km`, `40 °C`, `9 mm`.
- **Time:** ISO-style 24-hour clock for incident timing (`03:42`, `23:15`). Prose times spelled out when narratively appropriate: `just after midnight`.
- **Temperature:** Celsius primary, Fahrenheit in parentheses where the audience needs it: `−10 °C (14 °F)`.
- **Energy and data:** SI prefixes (`kW`, `MWh`, `GB`, `TB`). Use binary prefixes (`MiB`, `GiB`) only when a source uses them.

## 3. Dates

- **Body prose:** `5 June 2026` (day month year, no comma). Avoid `June 5th, 2026`.
- **Machine fields** (YAML frontmatter, filenames, structured data): ISO 8601 `2026-06-05`.
- **Decades:** `the 1970s`, not `the 70s` or `the 70's`.
- **Centuries:** `the twenty-first century`, not `the 21st century`, in prose.
- **Endnote dates:** match the publication's own convention (e.g., a *Reuters* dispatch dated `April 12, 2024` keeps that format inside the citation).

## 4. Acronyms and initialisms

- **Spell out on first use**, abbreviation in parentheses: `the Federal Trade Commission (FTC)`. Use the abbreviation thereafter within the chapter.
- **Standing exceptions**, always abbreviated, never spelled out: `AI`, `US`, `UK`, `EU`, `UN`, `NATO`, `URL`, `PDF`, `DNA`, `CEO`. ("US" and "UK" as adjectives; "the United States" and "the United Kingdom" as nouns where natural.)
- **AI capitalisation:** `AI`, not `ai` or `A.I.`. Specific systems take their branded capitalisation: `GPT-5`, `Claude`, `Gemini`, `Llama 4`, `DeepSeek`, `o3`. Treat product names as proper nouns; do not pluralise with apostrophes (`three GPTs`, not `three GPT's`).
- **Initialisms vs. acronyms:** Chicago default, both written without periods (`NIST`, `FBI`, `CISA`). Article choice follows pronunciation: `an FBI alert`, `a NIST publication`.

## 5. Names and references

### People

- **First mention:** named expert with affiliation. `Stuart Russell, UC Berkeley`. `Toby Ord, Oxford`. `Karen Hao, journalist (formerly MIT Technology Review)`.
- **Subsequent mentions** within the same chapter: surname only. `Russell argues …`.
- **Honorifics:** omit except where required for disambiguation or where the source uses them prominently. No `Dr.` / `Prof.` by default. Government and military titles retained on first use where they bear on authority (`Vice Admiral`, `Senator`).
- **Pseudonyms** (used only when legally required per `bible/SCENARIO_GROUNDING.md`): italicised on first use, footnoted, plain thereafter.

### Institutions, agencies, and systems

- **Agencies and institutions:** spell out on first use unless covered by the standing acronym exceptions in §4. `Federal Emergency Management Agency (FEMA)`, `National Institute of Standards and Technology (NIST)`, `Internet Crime Complaint Center (IC3)`.
- **Subsequent mentions:** use the shortest unambiguous form. `FEMA`, `NIST`, `IC3`, `the FTC`, `the lab` only when the referent is obvious within the chapter.
- **Military and government bodies:** use the formal name on first mention when authority matters. `US Army Corps of Engineers`, `UK Cabinet Office`. After that, shorten naturally: `the Corps`, `the Cabinet Office`.
- **Companies and labs:** use the public-facing name and current styling. `OpenAI`, `Anthropic`, `Google DeepMind`, `xAI`, `Meta`. Do not editorialise with scare quotes or nicknames.
- **Product and model names:** preserve vendor capitalisation and version punctuation exactly: `ChatGPT`, `GPT-5`, `Claude`, `Gemini`, `Llama 4`, `DeepSeek-R1`. If a model family becomes a common noun in prose, keep the brand form on first use and use a plain-English descriptor after (`the model`, `the assistant`, `the chatbot`) unless contrast between systems matters.
- **Prepper-audience naming bias:** prefer concrete roles over bureaucratic abstractions. `county emergency manager`, `ham-radio operator`, `utility crew`, `neighbourhood watch lead` beat `relevant stakeholders` or `community actors`.

## 6. Quotations

- **Direct quotation:** double quotes (American convention). Single quotes for nested quotation. `"She said, 'I will not.'"`
- **Punctuation inside or outside quotes:** Chicago / American, commas and periods inside the closing quote; colons and semicolons outside; question marks and exclamation marks inside if part of the quoted material, outside otherwise.
- **Block quotations:** prose quotations of 100+ words use a blockquote (`>` in Markdown). No surrounding quote marks. Citation in the following endnote.
- **Ellipses in quotations:** Chicago three-dot ellipsis with spaces (` … `). Bracketed when within a quotation.
- **Square brackets** for editorial insertions inside quotations.

## 7. Em dashes, en dashes, hyphens

- **Em dash: never use it.** The em dash is a well-known AI writing tell and is banned in this book. CI enforces it as an error (`styles/Surviving/no-em-dash.yml`), so a single em dash fails the build. Rewrite with a comma, a colon, parentheses, or two sentences. Instead of `The defence is not technical[em dash]it is procedural.` write `The defence is not technical; it is procedural.` or split into two sentences.
- **En dash (–):** ranges (`2024–2025`, `pages 12–15`) and compound modifiers with open compounds (`post–Cold War`). Use sparingly; in prose prefer `between X and Y`.
- **Hyphen (-):** compound modifiers before a noun (`open-source model`, `peer-reviewed paper`); not after the noun (`the paper is peer reviewed`).

## 8. Citations

- **System:** Chicago Manual of Style, notes-bibliography flavour. Numbered endnotes per chapter. A consolidated bibliography is assembled at Phase 7 build time.
- **Per-chapter endnotes:** Pandoc footnote syntax (`[^1]`), rendered as footnotes in PDF and endnotes in EPUB via Pandoc reference handling.
- **Format** (canonical; matches `bible/CHAPTER_TEMPLATE.md`):
  ```
  [^N]: Author, "Title." Publication, Date. <live-URL>. Archived: <wayback-URL>.
  ```
- **Books:**
  ```
  [^N]: Toby Ord, The Precipice: Existential Risk and the Future of Humanity (London: Bloomsbury, 2020), 187.
  ```
- **Journal articles:** include volume, issue, year, page range, and DOI when present.
- **Court rulings:** standard reporter citation (e.g., *Carpenter v. United States*, 138 S. Ct. 2206 (2018)).
- **Repeated citations:** short-form on second use within a chapter (`Ord, Precipice, 192.`). No `ibid.` (Chicago 17th deprecates it for digital workflows).
- **Archive URL** is non-optional for any URL-bearing citation; see `bible/SOURCE_RUBRIC.md` §4.

## 9. Title case and section case

- **Title case**, chapter titles and Part titles: capitalise the first and last words, and all other words except articles, coordinating conjunctions, and prepositions of four letters or fewer (Chicago).
  - Example: `When the Voice on the Phone Is Not Your Daughter`.
- **Sentence case**, every other heading level (`##`, `###`, `####`): capitalise the first word and proper nouns only.
  - Example: `## How voice cloning got cheap`.
- **Frontmatter `title`** field uses title case (matches the chapter title).

## 10. Code, file paths, URLs

- **Inline code, file paths, and URLs:** monospace (Markdown backticks).
- **URLs in body prose:** avoid when possible; cite the source in an endnote instead. When a URL must appear inline (e.g., a how-to that requires a specific site), it appears in full, never as bare text.
- **URLs in endnotes:** full, with `Archived:` Wayback URL on the same line.
- **Long URLs in PDF:** Pandoc handles line breaks at slashes; do not manually break URLs in source.

## 11. Lists

- **Numbered lists:** ordered actions, ranked items, sequential steps. Used in the field-notes block.
- **Bulleted lists:** unordered items. Hyphen `-` markers in Markdown source (Pandoc converts).
- **Lead-ins:** sentence-style introduction followed by colon; list items punctuated as complete sentences when they are complete sentences, as fragments when they are fragments. Be consistent within a list.

## 12. Prepper-audience notes on vocabulary

- **Practical-first.** When a technical term and a plain term both work, use the plain term.
- **Define technical terms on first use** within a chapter. If a term recurs in three or more chapters, it goes in `bible/GLOSSARY.md` (Phase 4) and the per-chapter definition can be dropped after the glossary lands.
- **Do not use `consumer`, `user`, or `stakeholder` to refer to the reader.** Use `reader`, `household`, `neighbour`, `you` (sparingly), or a named role appropriate to the context (`the analyst`, `the parent`, `the operator`).
- **Avoid corporate hedges.** `at this time` → `now`. `in order to` → `to`. `due to the fact that` → `because`. `prior to` → `before`.
- **Names of things matter.** Call a fire a fire, not a `combustion event`. Call a power outage an outage, not a `service interruption`. The voice survives only if the vocabulary does.

---

## Quick reference

| Domain | Rule |
|---|---|
| Numbers | Spell out 1–9; numerals 10+; always numerals for measurements/money/percentages/times |
| Units | Metric primary; US customary in parentheses only if needed; space between number and unit |
| Dates (prose) | `5 June 2026` |
| Dates (machine) | `2026-06-05` |
| Acronyms | Spell out + abbrev on first use; thereafter abbrev. Exceptions: `AI`, `US`, `UK`, `EU` |
| AI capitalisation | `AI`; products per brand (`GPT-5`, `Claude`, `Gemini`) |
| People | First mention: name + affiliation. After: surname |
| Institutions / systems | Spell out on first use unless a standing exception; preserve official product/model styling |
| Prepper naming | Prefer concrete roles (`utility crew`, `county emergency manager`) over abstractions |
| Quotes | Double for direct, single for nested; American punctuation |
| Em dash | **Never use** (AI tell, CI-blocked); rewrite with comma, colon, parentheses, or two sentences |
| En dash | Ranges (`2024–2025`) and open compound modifiers (`post–Cold War`) |
| Citations | Chicago notes-bibliography; numbered endnotes per chapter; archive URL non-optional |
| Title case | Chapter titles and Parts only |
| Sentence case | All sub-headings (`##`, `###`, `####`) |
| Reader | `reader`, `household`, `you` (sparingly), not `consumer`, `user`, `stakeholder` |
| Lists | Numbered for sequence/rank; bulleted with `-` for unordered |
| Code / paths / URLs | Monospace in body; full + archived in endnotes |
| Banned phrases | See `bible/VOICE.md` §5 and `styles/Surviving/banned-phrases.yml` |
