# ADR-002: Source-Vetting Tier Rubric
**Status:** ACCEPTED
**Owner:** claude-sonnet-4-6 (acting in coder role for Phase 1, task 1.4)
**Decision date:** 2026-06-02
**Linked task:** Task 1.4 in PLAN.md

## Context

*Surviving the AI World* runs 30 chapters across five Parts and must hold a consistent standard of evidence over a ~6-week production cycle and a multi-year shelf life. Two project-wide non-negotiables drive this decision:

- **#3:** every non-trivial factual claim in a chapter has a citation in the chapter's endnotes.
- **#5:** the Source DNA (SAS Survival Handbook, FM 21-76, Whole Earth Catalog, Tegmark, Harari, Suleyman, Ord, *MIT Technology Review*, RAND, Future of Life Institute) must be visibly represented.

The audience is the prepper / practical-survival community. They are skeptical of both AI hype and AI doom. They will reject the book if its evidence base is thin, anonymous, or fashionable. Once the dossier phase begins (Phase 3, 30 parallel tasks), retroactive changes to what counts as a source would require re-cutting work across all 30 chapters. The bar must be set now.

The risk space we are pricing:

- **Source rot.** URLs die; paywalls shift; outlets fold. The book must remain verifiable in 2 years and 10 years.
- **Authority laundering.** A claim sourced from an AI summary of a Wikipedia article of a Substack of a tweet looks like a citation chain and is not one.
- **Voice contamination.** Heavy reliance on a single register (academic, vendor PR, social-media op-ed) pulls the prose toward that register and away from the project's calm, dry, practical voice.
- **Source DNA neglect.** If dossier authors default to whatever Google surfaces, the project's named field guides and named thinkers disappear from the book.

## Decision

Adopt the three-tier rubric specified in `bible/SOURCE_RUBRIC.md`:

- **Tier 1:** peer-reviewed papers, primary government documents, court rulings, official corporate filings, named technical reports from established institutions.
- **Tier 2:** established journalism (long-form preferred) and institutional research from named outlets and bodies (e.g., *MIT Technology Review*, RAND, FLI, Brookings, AI Now, OECD AI Observatory, Reuters, AP, FT, Bloomberg, *NYT*, *WaPo*, *The Atlantic*).
- **Tier 3:** trade nonfiction by Source DNA authors and named field guides — for thematic framing only, not fresh factual claims.

**Rejected** as citations (always): anonymous blogs, X / Bluesky / Threads / Mastodon, AI-generated summaries, Wikipedia, unsourced "reports indicate" pieces, predatory journals, paywalled sources without an archive, press releases dressed as news.

**Minimums:** every non-trivial factual claim carries ≥1 Tier-1/2 citation; every dossier has 8–15 such key claims; every scenario seed has ≥2 Tier-1/2 sources (and a cited prediction, for Part 4 — see `bible/SCENARIO_GROUNDING.md` §5); every Part has at least one Source DNA author surfaced across its chapters.

**Archival:** every URL cited is archived to the Wayback Machine at dossier time; both live URL and archive URL appear in the endnote. Paywalled Tier-1/2 sources are acceptable only when a readable archive resolves; otherwise a different source is found.

The canonical document is `bible/SOURCE_RUBRIC.md`. This ADR records *why*; the rubric records *what*.

## Consequences

### Why Wikipedia is rejected as a citation

Wikipedia is an excellent finding aid and a moving target. Articles change without notice, citations within Wikipedia can degrade silently, and a chapter citing Wikipedia inherits whatever the article said on whatever day it was archived. The trade-off — convenience vs. stable evidentiary value — favours stability. Dossier authors are required to follow Wikipedia's citations to the primary source and cite that. Cost: more dossier time per claim. Benefit: every citation in the book points to something that has a chance of still being there, and still meaning what we claimed it meant, when a reader checks it in 2030.

### Why X / Twitter / Bluesky / Threads / Mastodon are rejected, even from experts

Social-media posts are non-canonical even when the poster is the world expert on the topic. They are revisable or deletable by the poster; they are not editorially reviewed; archiving them is unreliable; and they tend to compress claims in ways the underlying paper or talk does not. The rule is *cite the underlying source*. If the expert's claim exists only on social media, the claim does not enter the book. Cost: we lose some "the latest thinking is X" framings. Benefit: every attributed expert position in the book traces to something the expert published in a form they stand behind.

### Why archives are mandatory

A 90,000-word book of cited claims will, without archival, become partially unverifiable within 18–36 months as URLs rot and paywalls migrate. Archive at dossier time costs each author roughly one minute per source. The alternative — discovering rot during the Phase 6 editorial pass or, worse, after publication — is order-of-magnitude more expensive and erodes reader trust. The Wayback Machine and Archive.today are free, well-trusted, and require no API keys.

### Why Tier 3 (Source DNA trade nonfiction) is limited to framing

Authors like Tegmark, Harari, Suleyman, and Ord are central to the book's intellectual posture and are excellent at framing problems. They are not the right source for the underlying facts those frames sit on — those facts come from the primary literature the authors themselves cite. Limiting Tier 3 to framing keeps the chapters honest about where the evidence actually comes from, and keeps the Source DNA visible without making it carry weight it was not written to carry.

### Costs we are accepting

- **Slower dossier production.** Tier-1/2 sourcing with archival adds time per claim. Phase 3 budget assumes this; the cost is paid for by the avoided rework in Phase 6 and the avoided credibility hit at publication.
- **Some incidents will be rejected.** Compelling stories that exist only on social media, anonymous blogs, or in AI summaries will not enter the book. Dossier authors are instructed to find a different incident rather than weaken the rubric.
- **Some claims will be downgraded or cut.** Where Tier-1/2 sourcing cannot be found, the claim is either removed or rephrased to what the sourcing supports.

### Reversibility

This decision is hard to reverse mid-project. After Phase 3 opens, lowering the bar would require re-sourcing every chapter that benefited from the lower bar; raising it would require re-sourcing every chapter that did not yet meet the higher bar. The bar is therefore set deliberately at "strict enough to age well" rather than "as strict as possible". If a category of source proves systematically unworkable during Phase 3 (e.g., a key government docket becomes inaccessible), the issue is escalated to the Architect and CTO rather than worked around silently.

### Alternatives considered

- **Two tiers (primary vs. journalism, with everything else rejected).** Rejected because it would force the named Source DNA authors out of the citation list entirely, undermining non-negotiable #5.
- **Looser social-media policy** (cite expert tweets when the expert has Tier-1/2 publications). Rejected because the rule "cite the underlying source" produces the same outcome with stable artefacts.
- **Wikipedia as Tier 3.** Rejected on stability grounds (see above).
- **No archival requirement.** Rejected on rot grounds; the cost of after-the-fact rescue is far higher than archive-at-dossier-time.
