# PLAN V2 — Surviving the AI World

**Status:** DRAFT — pending CTO review
**Architect:** claude-sonnet-4-6 (acting as Architect per Max Agency role contract)
**Based on:** PLAN V1 (CTO-approved 2026-06-02, commit `d61d0db`)
**V2 date:** 2026-06-09
**V2 change summary:** Phases 0 and 1 marked complete; model roster updated (Opus 4.7 → 4.8, Hermes bulk model updated to `minimax/minimax-m3`); budget note added for untracked Phase 0+1 spend; Phase 2 now the active gate; no scope changes.
**Skills applied:** architect-planning, mdp-project-kickoff, mdp-core, mdp-decision-gates, mdp-model-cost-governance, mdp-verification-rollback, mdp-context-budget, mdp-file-safety, github-workflow

---

## Goal

Produce *Surviving the AI World*, a ~90,000-word hybrid survival manual structured in five Parts (Baseline, Disruption, Predictable Future, Unknown, Playbook) of roughly six chapters each. Every chapter follows the same fixed pattern: a ~200-word narrative scenario (grounded in a real, documented incident), the core knowledge in clear prose, a "field notes" box of tangible actions, and a "further reading" pointer. Tone is calm, dry, and confident — SAS Survival Handbook meets *Nexus*. The agency's deliverable is **complete scaffolding** (outlines, research dossiers, scenario seeds with real-incident citations, source-vetted claim lists, field-notes drafts, and further-reading pointers) for the human author to write the prose from. The repo also ships a Markdown → Pandoc → PDF/EPUB build pipeline so any committed prose builds reproducibly in CI.

---

## Constraints

- **Stack:** Markdown (CommonMark + Pandoc extensions) as authoring format; Pandoc + LaTeX (xelatex) for PDF; Pandoc for EPUB; GitHub Actions for CI build; Vale + proselint for prose linting; YAML frontmatter per chapter for metadata.
- **Deadlines:** None set — open-ended, but each phase has an internal gate before the next opens.
- **Integrations:** GitHub Issues/Projects (single source of truth per Highlevel_Plan_V2.0); GitHub Actions for build + lint; no external services beyond GitHub.
- **Non-negotiables:**
  1. Agents produce scaffolding only. Agents must **not** ship finished prose into chapter body files — prose is the human's job.
  2. Every scenario opener must cite a documented real-world incident (no invented anecdotes).
  3. Every non-trivial factual claim in a chapter has a citation in the chapter's endnotes file.
  4. Audience is the prepper / survival community: practical-first tone, deeper Part 1 & Part 5, light on speculation outside Part 4.
  5. Source DNA must be visibly represented: SAS Survival Handbook, FM 21-76, Whole Earth Catalog, Tegmark, Harari, Suleyman, Ord, MIT Technology Review, RAND, Future of Life Institute.
  6. Citation style: numbered endnotes per chapter + consolidated bibliography. "Further reading" is a separate, shorter pointer block (not a substitute for citations).

---

## Budget

- **Token cap:** 3,000,000 tokens across the full project.
- **$ cap:** $400 USD.
- **Phase 0+1 spend:** Untracked — actual consumption not recorded. The remaining cap is treated as the full original cap ($400 / 3M tokens) for planning purposes. **Action item for Orchestrator:** measure token spend on the first 3 Phase 2 tasks and re-project before Phase 3 opens. Escalate to human if projected total exceeds 80% of cap.
- **Time cap:** ~6 weeks of agency wall-clock to reach end of Phase 6 (scaffolding complete and reviewed). Clock resets from V2 approval date (2026-06-09).

Triggers per Highlevel_Plan_V2.0: warn human at 80% of either cap; pause all work at 100%.

---

## Model Roster

Per `mdp-model-cost-governance`: use the cheapest reliable path that still protects quality.

| Label | Profile / Model | Cost tier | Role in this project |
|---|---|---|---|
| `assigned:hermes-coder` | Hermes `coder` profile → `minimax/minimax-m3` (Hermes default, via OpenRouter) | Lowest | Bulk mechanical work: all toolchain config, all 30 research dossiers, endnotes stubs, TOC chapter-list drafts, cross-reference passes, citation re-verification, CI/release tasks |
| `assigned:claude-haiku` | `claude-haiku-4-5` | Low | Lighter writing: README/CONTRIBUTING, field-notes definition + examples, glossary build, marketing one-pager scaffolding |
| `assigned:claude-sonnet` | `claude-sonnet-4-6` | Medium | Quality layer: voice guide, scenario & source rubrics, cross-Part overlap audit, theme coverage matrix, source gap analysis, field-notes testability audit |
| `assigned:claude-opus` | `claude-opus-4-8` (Architect / CTO) | Highest | Judgment gates only: ADR authoring, final editorial report, plan revision, CTO sign-offs |

**Rule (per mdp-model-cost-governance §Critical Rule):** Never silently escalate to a higher-cost model. If `hermes-coder` fails a task twice, request cross-provider review from `claude-sonnet` before a third attempt. After three failures, escalate to Orchestrator.

**V2 note on `hermes-coder` model:** The underlying model is now `minimax/minimax-m3` (Hermes default) rather than `openai/gpt-5-codex` as originally planned. Quality baseline for research-heavy dossier work is unvalidated at this model. **Mitigation:** Orchestrator commissions the first Phase 3 dossier as a calibration task; `claude-sonnet` spot-checks it immediately (not on the 1-in-5 schedule) before the remaining 29 are batched. If quality is materially below the `SOURCE_RUBRIC.md` bar, Orchestrator escalates to human before continuing Phase 3.

---

## Phases

### Phase 0 — Repo & Toolchain Bootstrap ✅ COMPLETE

**Completed:** 2026-06-02 (commit `d61d0db`)

All acceptance criteria met:
- `make pdf` and `make epub` build placeholder book from `manuscript/` into `dist/` with no errors.
- GitHub Actions workflow runs on every push to a chapter file and uploads PDF/EPUB artifacts.
- Vale + proselint run in CI against `manuscript/**/*.md`.
- Pre-commit hook rejects committed secrets.
- `README.md` documents build, lint, and contribution flow.
- Empty Part/Chapter directory skeleton exists for all 5 Parts × 6 chapters with placeholder frontmatter.
- ADR stubs `ADR-001` through `ADR-004` committed at `docs/adr/`.

No open tasks.

---

### Phase 1 — Book Bible ✅ COMPLETE

**Completed:** 2026-06-09 (latest merge: PR #22, commit `69dde65`)

All acceptance criteria met:
- `bible/VOICE.md` — tone guide with before/after examples.
- `bible/CHAPTER_TEMPLATE.md` — canonical chapter skeleton.
- `bible/SCENARIO_GROUNDING.md` — real-incident rubric incl. Part 4 extrapolation rule.
- `bible/SOURCE_RUBRIC.md` — tiered source quality (Tier 1/2/3 + rejected).
- `bible/FIELD_NOTES.md` — testability definition + worked examples.
- `bible/STYLE.md` — Chicago Manual conventions + project deltas + banned phrases list.
- ADR-001, ADR-002 bodies authored (not just stubs).
- CTO sign-off recorded in `docs/SIGN_OFF.md`.

No open tasks.

---

### Phase 2 — Table of Contents Lock 🔴 ACTIVE GATE

**Goal:** A frozen 30-chapter TOC with a one-paragraph premise per chapter, slotted into the 5-Part architecture. Locked here so research in Phase 3 doesn't get re-cut.

**Acceptance criteria:**
- [ ] `manuscript/TOC.md` lists all 30 chapters with: title, Part, ordinal, one-paragraph premise (≤120 words), the "knowledge promise" (what the reader will be able to do or understand after the chapter), and the source DNA most relied on.
- [ ] No chapter overlaps another by >25% premise area (reviewer judgement, documented in a comment).
- [ ] Part 1 (Baseline) is dominantly practical; Part 4 (Unknown) is dominantly speculative; this gradient is visible across the TOC.
- [ ] Every named author in the Source DNA appears in at least one chapter's "most relied on" field.
- [ ] ADR-003 body authored and merged (TOC lock rationale recorded).
- [ ] ADR-004 body authored and merged (research dossier methodology approved) — **this is the hard gate before Phase 3 opens**.
- [ ] CTO sign-off on the TOC and ADR-004 before Phase 3 issues are created.

**Tasks:**

| #   | Title | Why | Depends on | Model | Rollback |
|-----|-------|-----|------------|-------|----------|
| 2.1 | Draft Part 1 (Baseline) 6-chapter list | Anchors the practical end of the gradient | Phase 1 complete | `hermes-coder` | Revert TOC entry |
| 2.2 | Draft Part 2 (Disruption) 6-chapter list | Grounded in current incidents | Phase 1 complete | `hermes-coder` | Revert TOC entry |
| 2.3 | Draft Part 3 (Predictable Future) 6-chapter list | 5–15yr scenarios from policy literature | Phase 1 complete | `hermes-coder` | Revert TOC entry |
| 2.4 | Draft Part 4 (Unknown) 6-chapter list | Speculative end of gradient | Phase 1 complete | `hermes-coder` | Revert TOC entry |
| 2.5 | Draft Part 5 (Playbook) 6-chapter list | Synthesises Parts 1–4 | 2.1–2.4 | `hermes-coder` | Revert TOC entry |
| 2.6 | Cross-Part overlap + gradient audit → ADR-003 body | Catches duplication and tone drift; permanently locks the TOC | 2.1–2.5 | `claude-sonnet` | Re-cut TOC before Phase 3 opens; after Phase 3 starts, scope change requires Orchestrator + human approval |
| 2.7 | Author ADR-004 body (research dossier methodology) | Phase 3 cannot open without CTO-approved methodology | 2.6 | `claude-sonnet` | Revert ADR-004 body to stub; Phase 3 stays closed |

**Gate enforcement:** Orchestrator must hold all Phase 3 issues at `blocked` until task 2.7 is merged and CTO sign-off is recorded on ADR-004.

**Parallelisation:** 2.1 ∥ 2.2 ∥ 2.3 ∥ 2.4 (independent Parts); 2.5 after all four; 2.6 after 2.5; 2.7 after 2.6 (sequential — ADR-004 gates Phase 3).

---

### Phase 3 — Per-Chapter Research Dossiers

**Goal:** For each of the 30 chapters, ship a research dossier the human author can write prose from without further lookup.

**Gate:** ADR-004 body merged + CTO sign-off recorded. Orchestrator enforces this via `blocked` label on all Phase 3 issues until the ADR-004 PR is merged.

**V2 calibration gate:** The first dossier (`3.1`) is treated as a calibration task. `claude-sonnet` spot-checks it immediately — before the remaining 29 are assigned — against `SOURCE_RUBRIC.md`, `VOICE.md`, and the no-body-prose AC. If quality is below bar, Orchestrator escalates to human before Phase 3 continues.

**Acceptance criteria (per chapter):**
- [ ] `manuscript/<part>/<chapter>/dossier.md` exists with: scenario seed (≥2 candidate real incidents, each with 2+ Tier-1/2 sources), 8–15 key claims (each with ≥1 Tier-1/2 citation), 5–10 candidate field-notes actions, 3–5 further-reading pointers from the source DNA.
- [ ] `manuscript/<part>/<chapter>/endnotes.md` initialised with the citation list referenced from `dossier.md`.
- [ ] All sources pass `SOURCE_RUBRIC.md`. Sonnet spot-checks 1-in-5 dossiers (plus the calibration dossier 3.1) for source quality, voice fit, and absence of body prose.
- [ ] No dossier exceeds 4,000 words of agent prose (scaffolding, not draft).
- [ ] `dossier.md` contains **no chapter-body prose** — no narrative paragraphs beyond the structured seed/claim/field-notes/further-reading format.

**Tasks:** 30 dossier tasks, one per chapter (`3.1`–`3.30`), each:
- **Primary model:** `hermes-coder` (`minimax/minimax-m3`) for all 30 chapters.
- **Calibration spot-check:** `claude-sonnet` reviews task `3.1` immediately on completion, before any further Phase 3 assignments are made.
- **Ongoing spot-check:** `claude-sonnet` reviews tasks `3.5`, `3.10`, `3.15`, `3.20`, `3.25`, `3.30` against `SOURCE_RUBRIC.md`, `VOICE.md`, and the no-body-prose AC.
- **Depends on:** ADR-004 merged + CTO sign-off + corresponding TOC entry.
- **Rollback:** revert the chapter directory.

**Parallelisation:** Up to 6 `hermes-coder` dossier tasks in flight concurrently (one per Part), each in its own worktree per AMA §3. **Exception:** dossiers 3.2–3.6 are held until calibration spot-check on 3.1 passes.

---

### Phase 4 — Scaffolding Integration & Cross-Chapter Coherence

**Goal:** Make the 30 dossiers behave as one book, not 30 essays.

**Acceptance criteria:**
- [ ] Recurring themes (psychology under uncertainty, community/trust, analog-digital tension, ethics of surviving) appear in `bible/THEMES.md` with a per-chapter coverage matrix.
- [ ] Cross-reference suggestions (`see Ch. X`) added to dossiers where applicable, listed in `manuscript/CROSSREF.md`.
- [ ] Terminology consistency report: any term used in ≥3 chapters has a single agreed definition in `bible/GLOSSARY.md`.
- [ ] Source overlap map: which sources are reused across chapters, to spot over-reliance.

**Tasks:**

| #   | Title | Why | Depends on | Model | Rollback |
|-----|-------|-----|------------|-------|----------|
| 4.1 | Theme coverage matrix | Recurring themes are a brief requirement; needs synthesis judgment | Phase 3 complete | `claude-sonnet` | Revert `bible/THEMES.md` |
| 4.2 | Cross-reference pass | Turns 30 essays into a book; mechanical cross-linking | 4.1 | `hermes-coder` | Revert `manuscript/CROSSREF.md` |
| 4.3 | Glossary build | Terminology consistency; mechanical extraction from dossiers | Phase 3 complete | `claude-haiku` | Revert `bible/GLOSSARY.md` |
| 4.4 | Source overlap & gap analysis | Detects over-reliance or missing Source DNA; judgment on what "over-reliance" means | Phase 3 complete | `claude-sonnet` | Revert report |

**Parallelisation:** 4.1 ∥ 4.3 ∥ 4.4 (independent, all depend only on Phase 3 complete); 4.2 depends on 4.1.

---

### Phase 5 — Human Prose Pass (Gate, Not Agency Work)

**Goal:** Human author writes chapter prose from the dossiers. Tracked here as a milestone so the agency pipeline (lint, build, CI) supports it, but no agent writes body prose.

**Acceptance criteria:**
- [ ] All 30 `chapter.md` body files exist and build cleanly.
- [ ] Vale + proselint pass at configured severity.
- [ ] Every endnote referenced in a chapter resolves to an entry in `endnotes.md`.

**Tasks:** Human-owned. Agency tasks are limited to keeping CI green and surfacing lint/build regressions (`hermes-coder` handles CI triage; regressions requiring voice/content drift judgment go to `claude-sonnet`).

---

### Phase 6 — Editorial Pass on Completed Prose

**Goal:** Agents fact-check, citation-verify, and consistency-check the human's prose without rewriting it.

**Acceptance criteria:**
- [ ] Every claim with a citation re-verified; all mismatches filed as issues (not edits).
- [ ] Every `see Ch. X` cross-reference resolves to the intended content.
- [ ] All terms in ≥3 chapters match their `GLOSSARY.md` definitions; deviations filed as issues.
- [ ] Every field-notes box audited against the "testable in <1 week" rubric; failures filed as issues.
- [ ] `docs/editorial-report.md` committed, summarising all filed issues grouped by chapter.
- [ ] CTO sign-off on `docs/editorial-report.md` before Phase 7 opens.

**Tasks:**

| #   | Title | Why | Depends on | Model | Rollback |
|-----|-------|-----|------------|-------|----------|
| 6.1 | Citation re-verification (30 tasks, one per chapter) | Sources rot; the book must ship current | Phase 5 complete | `hermes-coder` | n/a — read-only; produces issues |
| 6.2 | Cross-reference & glossary audit | Catches drift introduced in human prose; mechanical | Phase 5 complete | `hermes-coder` | n/a — issues only |
| 6.3 | Field-notes testability audit | Enforces non-negotiable #4 in prose; needs judgment | Phase 5 complete | `claude-sonnet` | n/a — issues only |
| 6.4 | Final editorial report | One artifact for CTO sign-off; highest-judgment synthesis | 6.1–6.3 | `claude-opus` | Revert report file |

**Parallelisation:** 6.1 ∥ 6.2 ∥ 6.3; 6.4 last.

---

### Phase 7 — Final Build & Shipping Artifacts

**Goal:** Produce the deliverables a publisher or self-publishing pipeline needs.

**Acceptance criteria:**
- [ ] `make pdf` and `make epub` build from final human-authored prose without errors; CI green on the release tag.
- [ ] `dist/surviving-the-ai-world.pdf` and `dist/surviving-the-ai-world.epub` present in the tagged release artifacts.
- [ ] `dist/sample-chapter.pdf` present in the tagged release artifacts.
- [ ] `dist/marketing-onepager.md` committed and human-reviewed.
- [ ] Cover placeholder (text-only) embedded in EPUB; EPUB validates with `epubcheck`.
- [ ] Tagged GitHub release exists with all four artifacts attached and release notes listing Part/chapter count.

**Tasks:**

| #   | Title | Why | Depends on | Model | Rollback |
|-----|-------|-----|------------|-------|----------|
| 7.1 | Sample-chapter build target | Marketing needs a vertical slice; Makefile config | Phase 6 complete | `hermes-coder` | Revert Makefile target |
| 7.2 | Marketing one-pager scaffolding | Agency-produced scaffolding, human edits | Phase 6 complete | `claude-haiku` | Revert file |
| 7.3 | Cover placeholder + EPUB metadata | EPUB needs both to validate | Phase 6 complete | `hermes-coder` | Revert epub config |
| 7.4 | Tagged release + artifact upload | Single shippable deliverable | 7.1–7.3 | `hermes-coder` | Delete tag + release |

**Parallelisation:** 7.1 ∥ 7.2 ∥ 7.3; 7.4 last.

---

## Parallelisation Map

- **Phase 0:** Complete.
- **Phase 1:** Complete.
- **Phase 2:** 2.1 ∥ 2.2 ∥ 2.3 ∥ 2.4 (independent Parts); 2.5 after all four; 2.6 after 2.5; 2.7 after 2.6.
- **Phase 3:** Up to 6 `hermes-coder` dossier tasks in flight concurrently — one per Part — each in its own worktree. Blocked until 2.7 merged + CTO sign-off. Dossiers 3.2–3.6 held until calibration spot-check on 3.1 passes.
- **Phase 4:** 4.1 ∥ 4.3 ∥ 4.4 (all depend only on Phase 3 complete); 4.2 after 4.1.
- **Phase 6:** 6.1 ∥ 6.2 ∥ 6.3; 6.4 last.
- **Phase 7:** 7.1 ∥ 7.2 ∥ 7.3; 7.4 last.

---

## Risks and Unknowns

- **`minimax/minimax-m3` dossier quality unvalidated.** The original plan used `openai/gpt-5-codex` for bulk research; Hermes now defaults to `minimax/minimax-m3`. Quality for citation-heavy research writing is unknown. → Mitigation: calibration gate on dossier 3.1 (immediate Sonnet spot-check before batch continues). Escalate to human if below bar.
- **Phase 0+1 budget untracked.** Actual token/$ spend for completed phases is not recorded. → Mitigation: Orchestrator measures actual tokens/task on the first 3 Phase 2 tasks, re-projects total, and reports to human before Phase 3 opens. If projected total > 80% of cap, escalate immediately.
- **Voice drift across 30 chapters.** → Mitigation: `VOICE.md` with before/after examples (Phase 1 complete); Vale custom style enforcing banned phrasings (Phase 0 complete); Sonnet spot-checks 1-in-5 dossiers plus calibration check.
- **Source rot during the project lifecycle.** → Mitigation: archive every cited URL to Wayback Machine at dossier-time; store archive URLs in endnotes. Phase 6 re-verification catches mid-flight drift.
- **Scenario grounding fails for speculative Part 4 chapters.** → Resolution: `SCENARIO_GROUNDING.md` (Phase 1, complete) defines the extrapolation rule — scenario must extrapolate from a cited real incident or expert prediction. CTO approved in Phase 1 sign-off.
- **Agency-vs-human handoff on prose (Phase 5).** → Mitigation: agency owns nothing in Phase 5 except CI; explicit issue templates differentiate "dossier issue" from "prose issue."
- **Budget overrun on 30 research-heavy dossiers.** → Mitigation: hard cap dossier word count (4k); after first 3 dossiers Orchestrator re-projects against $400 cap; escalate at 80%. `hermes-coder` being the bulk model keeps cost low.

---

## Assumption Ledger

Defaults carried forward from V1 (ordered riskiest first):

| Domain | Default | Why | Rework cost if wrong |
|---|---|---|---|
| **Hermes bulk model quality** | `minimax/minimax-m3` is adequate for research dossiers | Hermes default; calibration gate mitigates | HIGH — if below bar, Phase 3 needs reassignment to `claude-sonnet` (cost impact significant) |
| **Phase 0+1 budget** | Full original cap still available | Spend untracked; treated as negligible for planning | MEDIUM — if actual spend was >20%, Phase 3 task count may need trimming |
| **Toolchain — PDF engine** | xelatex (via Pandoc `--pdf-engine=xelatex`) | Best Unicode and font support; Phase 0 complete, no change needed | LOW — already built and validated |
| **TOC count** | Exactly 6 chapters per Part (30 total) | Phase 2 will execute against this; no scope change confirmed | LOW — confirmed unchanged in V2 |
| **Citation style** | Chicago Manual of Style (numbered endnotes) | Style guide complete (Phase 1); Pandoc CSL can change at Phase 7 | LOW |

---

## Board-Criteria Flags (Open)

All ADR stubs exist from Phase 0. Status at V2:

| ADR | Decision | Status |
|---|---|---|
| ADR-001 | Pandoc + xelatex toolchain | **Body authored** (Phase 0 complete) |
| ADR-002 | Source-vetting rubric + tier list | **Body authored** (Phase 1 complete) |
| ADR-003 | TOC lock | **Stub only** — body authored as part of task 2.6 |
| ADR-004 | Research dossier methodology | **Stub only** — body authored as part of task 2.7; hard gate before Phase 3 |

---

## Out of Scope

- Writing chapter body prose (human-owned per non-negotiable #1).
- Book cover design (placeholder only; design is human-owned).
- Audiobook production, translation, foreign-rights packaging.
- Publisher submission, agent queries, marketing campaign execution.
- Any chapter beyond the 30 in the locked TOC. Scope expansion → new PLAN revision.
