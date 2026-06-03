# Source-Vetting Rubric

What counts as an acceptable source for *Surviving the AI World*. Hard to change retroactively, so the bar is set deliberately. This file enforces non-negotiables #3 and #5: every non-trivial factual claim has a citation, and the Source DNA must be visibly represented.

Decision of record: `docs/adr/ADR-002-source-tier-rubric.md`.

This rubric pairs with `bible/SCENARIO_GROUNDING.md` (what counts as a real incident for scenario seeds) and `bible/CHAPTER_TEMPLATE.md` (where citations appear in chapter files).

---

## 1. The tiers

### Tier 1 — Primary and peer-reviewed

Always acceptable for any claim, including the central claims of a chapter.

- **Peer-reviewed academic papers.** Journal articles and conference proceedings under formal peer review (NeurIPS, ICML, *Nature*, *Science*, *PNAS*, *JAMA*, etc.). arXiv preprints by named authors at named institutions are acceptable when the preprint is what the cited claim depends on; if a peer-reviewed version exists, cite that.
- **Primary government documents.** NIST publications, DARPA briefings, NSF reports, EU regulations (AI Act, GDPR), UK and US statutes, agency advisories (CISA, FBI IC3), parliamentary committee transcripts.
- **Court rulings and public filings.** Judgments, indictments, complaints, settlements, regulatory consent decrees, SEC filings (10-K, 8-K, S-1), public bankruptcy filings.
- **Official corporate filings and statements of record.** SEC filings, official safety reports (e.g., Anthropic / OpenAI / Google DeepMind model cards and system cards published under the lab's name), audited annual reports.
- **Named scientific and technical reports** from established research institutions (RAND, NIST, MITRE, Brookings) authored by named individuals.

### Tier 2 — Established journalism and institutional research

Acceptable for any claim. The default tier for current-events evidence.

- **Established journalism, long-form preferred.** *MIT Technology Review*, *Wired* (long-form only — not roundups or sponsored), *The Atlantic*, *The New Yorker*, *Financial Times*, *Bloomberg*, *Reuters*, the Associated Press, *The Washington Post*, *The New York Times*, *The Economist*, *The Guardian* (news desks), *ProPublica*, *Rest of World*.
- **Institutional research and policy work.** RAND Corporation, Future of Life Institute (FLI), Brookings, AI Now Institute, the Centre for the Governance of AI, the Stanford HAI policy briefs, the AI Index, the OECD AI Policy Observatory.
- **Trade press in domain.** *IEEE Spectrum*, *Nature News*, *Science News* — when reporting on primary literature they reference.

### Tier 3 — Trade nonfiction by Source DNA authors

Acceptable for **thematic framing**, not for fresh factual claims. Use these to support an idea, an argument, or a way of seeing a problem; use Tier 1 or Tier 2 for the underlying facts.

- **Named Source DNA authors:** Max Tegmark (*Life 3.0*), Yuval Noah Harari (*Sapiens*, *Nexus*), Mustafa Suleyman (*The Coming Wave*), Toby Ord (*The Precipice*), Nick Bostrom (*Superintelligence*), Stuart Russell (*Human Compatible*), Kate Crawford (*Atlas of AI*), Shoshana Zuboff (*The Age of Surveillance Capitalism*).
- **Named project field guides:** *SAS Survival Handbook* (Wiseman), *FM 21-76* (US Army Survival Manual), *Whole Earth Catalog* (Brand et al.), Cody Lundin's manuals.
- **Other established trade nonfiction** by authors with a publication record and editorial review: acceptable case-by-case at the dossier author's judgment, with Sonnet spot-check.

A Tier-3 source can frame a chapter's argument. It cannot be the sole citation for a fresh factual claim — a number, a named event, a measurement, a court ruling, a corporate position.

### Rejected — do not cite

The following do not count as sources for this book. A dossier or chapter that cites them is sent back.

- **Anonymous blogs and Substacks** without named, verifiable authorship.
- **X / Twitter / Bluesky / Threads / Mastodon posts**, even by experts. Cite the underlying paper, interview, or talk that the post points to. If there is no underlying source, the claim does not enter the book.
- **AI-generated summaries.** ChatGPT, Claude, Gemini, Perplexity, NotebookLM, Copilot outputs. These are not citations and they cannot be archived stably.
- **Wikipedia as the citation.** Wikipedia may be used to *find* primary sources; the citation goes to the primary source, not to the Wikipedia article.
- **Unsourced "reports indicate" or "experts say" pieces.** If the piece itself does not name the report or the expert, find the report or the expert and cite them directly.
- **Paywalled sources with no archive available.** See §3.
- **Press releases dressed as news.** A vendor announcement is a vendor announcement. If the claim is testable, find the test; if it is not, do not repeat it.
- **Predatory journals and pay-to-publish venues.** When in doubt, check Beall's List successors or the journal's indexing.

## 2. Sourcing minimums per chapter

- **Per non-trivial factual claim:** ≥1 Tier-1 or Tier-2 citation. A non-trivial claim is anything beyond textbook common knowledge: a number, a date, a named event, an attributed position, a technical mechanism, a legal status.
- **Per chapter (dossier stage):** 8–15 key claims, each with ≥1 Tier-1/2 source. (This matches the dossier acceptance criteria in PLAN.md Phase 3.)
- **Per scenario:** ≥2 Tier-1/2 sources for the seeding incident, per `bible/SCENARIO_GROUNDING.md` §4. For Part 4, the extrapolation rule additionally requires a cited prediction (§5 of that file).
- **Per Part across the book:** at least one named Source DNA author appears in the Knowledge or Further reading of at least one chapter in every Part. The Phase 4 coverage matrix verifies this.

## 3. Paywall protocol

Paywalled Tier-1/2 sources are acceptable when an archive is available.

1. The dossier author attempts a Wayback Machine snapshot (`web.archive.org`) at the live URL. If the snapshot is readable, both URLs go into the endnote — live and archive.
2. If the Wayback snapshot is unavailable or blocked, the author tries Archive.today (`archive.ph`). Same rule: live URL + archive URL in the endnote.
3. If neither archive resolves to the readable content, the author finds a different source. Paywalled-without-archive sources do not enter the book.
4. For Tier-1 sources (court records, government documents) that are public-record by design but hosted behind a paywall (e.g., PACER), the docket reference itself is the canonical citation; the paywalled URL is supplementary.

## 4. Archive at dossier time

Every URL cited in a dossier or chapter is archived to the Wayback Machine **at the time the dossier is written**. Both the live URL and the archive URL appear in the endnote. This is non-negotiable: sources rot, and the Phase 6 re-verification depends on having a frozen reference.

Format in endnotes (per `bible/CHAPTER_TEMPLATE.md` and `bible/STYLE.md`):

```
[^N]: Author, "Title." Publication, Date. <live-URL>. Archived: <wayback-URL>.
```

If a source is updated after the dossier is written, the chapter cites the archived version unless the update is material to the claim. Material updates are flagged in the editorial pass.

## 5. Wikipedia, social media, AI tools: the workflow

These are useful research aids and unacceptable citations. Use them as follows:

- **Wikipedia:** read it, follow its citations, cite what it cites. Never cite Wikipedia itself.
- **Social media:** read it for leads. If an expert posts a claim, look for their paper, talk, or interview and cite that. If there is no underlying source, the claim does not enter the book.
- **AI tools:** treat outputs as drafts. Anything an AI tool produces is verified against Tier-1/2 sources before it goes into a dossier. The AI tool is never named as the source.

## 6. Edge cases

- **Self-published expert writing.** A named expert's Substack or personal blog is Tier 3 at best, and only when the expert has Tier-1/2 publications backing the same claim. Prefer the Tier-1/2 publication.
- **Conference talks and podcasts.** Acceptable when the speaker is the author of a Tier-1/2 source on the same topic. Cite the talk *and* the underlying paper.
- **Foreign-language sources.** Acceptable. The dossier includes an English translation of the quoted passage, the original-language URL, and the archive URL. Tier follows the publication, not the language.
- **Historical sources predating archives.** Books, statutes, and court rulings predating the web are cited per Chicago notes-bibliography style without Wayback URLs; ISBN or stable archive URL preferred where available.
- **Source DNA exceptions.** The Source DNA list (PLAN.md §Constraints) is the project's thematic backbone. Quoting from those authors for framing is encouraged; sourcing fresh facts from them is not.
