# Scenario Grounding Rubric

Every chapter of *Surviving the AI World* opens with a ~200-word narrative scenario. This file defines what is allowed in that scenario and what is not. It enforces the project's second non-negotiable: **every scenario cites a documented real-world incident.**

This rubric is normative. A scenario that fails it is sent back regardless of how good the prose is.

It pairs with `bible/CHAPTER_TEMPLATE.md` (shape), `bible/SOURCE_RUBRIC.md` (what counts as a citation), and `bible/VOICE.md` (register).

---

## 1. The rule

Every scenario must be seeded from a documented real-world incident. For Parts 1, 2, 3, and 5, the incident is the scenario: names, dates, mechanism, outcome. The prose may compress or shift perspective, but the events are real and cited.

For Part 4 (Unknown) only, the scenario may extrapolate from a cited real incident. The extrapolation rule is given in §5. Pure invention is disallowed in every Part.

The seeding incident is named in endnote `[^1]` of the chapter. The chapter's dossier carries at least two Tier-1/2 sources for it, both archived to the Wayback Machine at dossier time.

## 2. What counts as a real incident

Four categories. A scenario seed must fall into one of them.

1. **Reported events from Tier-1 or Tier-2 sources.** A named outlet (per `bible/SOURCE_RUBRIC.md` §Tier 2) reporting a specific event with named or pseudonymous participants. Examples: an *MIT Technology Review* piece on a deepfake fraud case; a *Reuters* report on a grid failure; an *AP* dispatch on an autonomous-vehicle incident.
2. **Court records and public filings.** A judgment, indictment, complaint, settlement, or regulatory filing in a public docket. Examples: an FTC consent decree, an SEC complaint, a criminal indictment naming a defendant and a method.
3. **Primary government documents.** Reports, briefings, and advisories from named agencies. Examples: a DARPA briefing, a NIST publication, a CISA advisory, an FBI IC3 public service announcement, a parliamentary committee transcript.
4. **Named first-person accounts in established outlets.** A first-person essay or long-form piece by a named individual, published in a Tier-1/2 outlet, recounting their own experience. Examples: a victim's account of voice-cloning fraud in *The Atlantic*; a researcher's first-person essay in *The New Yorker*.

If a candidate seed does not fit one of these categories, it is not eligible. Find another.

## 3. What does NOT count

The following are common temptations and are out of bounds for scenario seeds.

- **Anonymous posts.** Reddit threads, anonymous blog posts, leaked screenshots without provenance.
- **Social-media threads.** X / Twitter / Bluesky / Threads / Mastodon. Even when the poster is an expert, cite the underlying paper or interview, not the thread.
- **AI-generated summaries.** No ChatGPT/Claude/Gemini outputs as a scenario source. They are not citations and they cannot be archived to anything stable.
- **Paraphrased "I heard about" anecdotes.** A second-hand story passed along by a credible person is not a source. Find the original and cite it, or drop it.
- **Hypothetical examples dressed as incidents.** Phrases like "imagine that" or "suppose a household" indicate invention. Outside Part 4 (and even there, see §5), these are out.
- **Composite cases.** A scenario stitched from elements of three different real incidents is invention. Pick one. Cite it. If the chapter needs the pattern across multiple incidents, that belongs in Knowledge, not Scenario.
- **Wikipedia as the seed source.** Wikipedia may be used to find the primary sources; it is not the citation. The dossier and endnote cite the primary sources directly.

## 4. Minimum sourcing

Every scenario seed carries at least two Tier-1 or Tier-2 sources in the dossier, both archived to the Wayback Machine at dossier time. The endnote in the chapter cites at least one of them by name with live URL and archive URL.

For court records and primary government documents, one Tier-1 source plus the docket / agency URL counts as two.

If only one Tier-1/2 source exists for an otherwise compelling incident, the dossier flags it and Sonnet judges whether the chapter can lean on it. Default answer: find a second source or pick another incident.

## 5. The Part 4 extrapolation rule

Part 4 (Unknown) covers futures the present has not yet produced. A Part 4 scenario may extrapolate forward, but it cannot invent. The rule:

- **(i) A real incident** that establishes the trajectory. Same category test as §2. Cited in endnote `[^1]`.
- **(ii) A published prediction** from a credible expert that extrapolates that trajectory forward. The expert must have a publication record in the relevant field. Acceptable sources include named books, peer-reviewed papers, RAND policy papers, Future of Life Institute reports, and on-the-record interviews in Tier-1/2 outlets. The prediction is cited in endnote `[^2]`.

The scenario may then dramatise the trajectory at a point between the cited incident and the cited prediction, or at the prediction's horizon. It must not exceed the prediction's claim. If the expert says "within 10–20 years", the scenario does not set itself in year 50.

Named experts whose work qualifies for (ii) by default include: Nick Bostrom, Max Tegmark, Mustafa Suleyman, Toby Ord, Stuart Russell, Yoshua Bengio, Helen Toner. Institutional sources include RAND, FLI, AI Now Institute, the Centre for the Governance of AI. Other experts qualify case-by-case; the dossier justifies the choice.

Pure invention remains disallowed in Part 4. A Part 4 scenario without both (i) and (ii) is sent back. Part 3 chapters use same real-incident rule. Knowledge handles near-future framing.

## 6. Tense and framing rules

- **Tense.** Present or near-future. Past tense is reserved for endnotes and Knowledge sections.
- **Names.** Use real names where the public record permits. Pseudonymise only when legally required (juveniles, sealed records, witness protection). Substitutions are footnoted.
- **Dialogue.** Paraphrase from primary source only. No invented dialogue. If the primary source quotes a participant, the scenario may quote them back; nothing else gets quote marks.
- **Opening.** Concrete sensory detail. A sound, a screen, an object, a smell, a temperature. No exposition before the action begins. No "in recent years" framing.
- **Handoff.** The scenario ends in a way that hands the reader into the Knowledge section without a transition paragraph. No "in this chapter, we will explore."
- **Voice.** Per `bible/VOICE.md`. Calm, dry. No panic, no triumphalism, no nihilism.

## 7. Length

200 words ±25% (150–250 words). Hard cap at 250. Scenarios that run long get cut, not shrunk — find the one detail the rest of the scenario depends on and start there.

## 8. Worked examples

Two examples of acceptable scenario seeds. Each lists the real incident, two Tier-1/2 sources, and a 50-word sketch of how the scenario would open. Sources cited here are real; the sketches are illustrative.

### 8.1 Part 2 (Disruption) — voice-cloning fraud

**Real incident:** In May 2023, the FBI Internet Crime Complaint Center (IC3) issued Public Service Announcement I-051023-PSA warning of voice-cloning fraud against family members. Within twelve months, multiple US households had reported losses ranging from \$5,000 to over \$50,000 to scams using cloned voices of grandchildren or adult children.

**Two Tier-1/2 sources:**

1. FBI IC3, "Public Service Announcement I-051023-PSA: Voice cloning fraud against family members." 10 May 2023. (Tier 1: primary government document.)
2. Pranshu Verma, "They thought loved ones were calling for help. It was an AI scam." *The Washington Post*, 5 March 2023. (Tier 2: established journalism.)

**50-word opening sketch:**
> The call comes at 11:14 on a Tuesday. The voice is her daughter's — the cadence, the small catch on the second syllable of "Mom." She is in a holding cell in Tijuana. She needs \$9,000 wired to a bondsman within the hour. The bondsman takes the phone.

### 8.2 Part 4 (Unknown) — automated cyber-offensive capability

**Real incident (i):** In 2023, researchers at Anthropic and external red teams documented language models successfully chaining publicly known CVEs into working exploits in controlled tests, with success rates rising materially between model generations. Reports were summarised in *MIT Technology Review* and in arXiv preprints from the relevant labs.

**Published prediction (ii):** Toby Ord, *The Precipice* (2020), estimates a roughly 1-in-10 chance of existential catastrophe from unaligned AI this century, with a sub-component covering misuse of advanced AI by small groups for catastrophic cyber-offensive operations within a 10–30 year window. RAND's 2024 report on AI and biosecurity offers a parallel framing for cyber.

**Two Tier-1/2 sources:**

1. *MIT Technology Review* coverage of frontier-model red-team results (2024). (Tier 2.)
2. Toby Ord, *The Precipice: Existential Risk and the Future of Humanity* (Bloomsbury, 2020). (Tier 3 for thematic framing; the underlying probability discussion is sourced to Ord's own published probabilistic estimates, which are quoted directly.)

**50-word opening sketch:**
> The SOC analyst's pager goes off at 03:42. The dashboard shows three intrusions on three unrelated tenants, started within nine minutes of each other, all using the same chain of four CVEs. None of the CVEs is new. The chaining is. No human assembled it.

In each case the chapter's dossier will carry the full source list and Wayback URLs; the endnotes will cite at minimum the FBI PSA (Example 8.1) or the *MIT Technology Review* piece and Ord (Example 8.2). The scenarios may compress or shift perspective; they do not exceed what the cited sources support.
