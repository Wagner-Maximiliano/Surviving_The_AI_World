# PLAN — Surviving the AI World

**Status:** DRAFT → UNDER_REVIEW (CTO issue #1 open)
**Architect:** claude-opus-4-7
**CTO sign-off:** PENDING (issue #1)
**Human approval:** PENDING (will be recorded in `docs/SIGN_OFF.md` and commit message after CTO approves)
**Skills applied:** architect-planning, mdp-project-kickoff, mdp-core, mdp-decision-gates, mdp-model-cost-governance, mdp-verification-rollback, mdp-context-budget, mdp-file-safety, github-workflow

## Goal

Produce *Surviving the AI World*, a ~90,000-word hybrid survival manual structured in five Parts (Baseline, Disruption, Predictable Future, Unknown, Playbook) of roughly six chapters each. Every chapter follows the same fixed pattern: a ~200-word narrative scenario (grounded in a real, documented incident), the core knowledge in clear prose, a "field notes" box of tangible actions, and a "further reading" pointer. Tone is calm, dry, and confident — SAS Survival Handbook meets *Nexus*. The agency's deliverable is **complete scaffolding** (outlines, research dossiers, scenario seeds with real-incident citations, source-vetted claim lists, field-notes drafts, and further-reading pointers) for the human author to write the prose from. The repo also ships a Markdown → Pandoc → PDF/EPUB build pipeline so any committed prose builds reproducibly in CI.

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

## Budget

- **Token cap:** 3,000,000 tokens across the full project (research-heavy; ~80k tokens/chapter avg across 30 chapters including review).
- **$ cap:** $400 USD.
- **Time cap:** ~6 weeks of agency wall-clock to reach end of Phase 6 (scaffolding complete and reviewed). Human prose pass and final build are tracked but out of agency scope for budget purposes.

Triggers per Highlevel_Plan_V2.0: warn human at 80% of either cap; pause all work at 100%.

## Model roster

Per `mdp-model-cost-governance`: use the cheapest reliable path that still protects quality.

| Label | Profile / Model | Cost tier | Role in this project |
|---|---|---|---|
| `assigned:hermes-coder` | Hermes `coder` profile → `openai/gpt-5-codex` via OpenRouter | Lowest | Bulk mechanical work: all toolchain config, all 30 research dossiers, endnotes stubs, TOC chapter-list drafts, cross-reference passes, citation re-verification, CI/release tasks |
| `assigned:claude-haiku` | `claude-haiku-4-5` | Low | Lighter writing: README/CONTRIBUTING, field-notes definition + examples, glossary build, marketing one-pager scaffolding |
| `assigned:claude-sonnet` | `claude-sonnet-4-6` | Medium | Quality layer: voice guide, scenario & source rubrics, cross-Part overlap audit, theme coverage matrix, source gap analysis, field-notes testability audit |
| `assigned:claude-opus` | `claude-opus-4-7` (Architect / CTO) | Highest | Judgment gates only: ADR authoring, final editorial report, plan revision, CTO sign-offs |

**Rule (per mdp-model-cost-governance §Critical Rule):** Never silently escalate to a higher-cost model. If Hermes-coder fails a task twice, request cross-provider review from `claude-sonnet` before a third attempt. After three failures, escalate to Orchestrator. Do not auto-route to Opus.

## Phases

### Phase 0 — Repo & toolchain bootstrap

**Goal:** A working Markdown → Pandoc → PDF/EPUB pipeline with prose linting, runnable locally and in CI, on an empty book skeleton.

**Acceptance criteria:**
- [ ] `make pdf` and `make epub` build a placeholder book from `manuscript/` into `dist/` with no errors.
- [ ] GitHub Actions workflow runs the same build on every push to a chapter file and uploads the PDF/EPUB as artifacts.
- [ ] Vale + proselint run in CI against `manuscript/**/*.md` and fail the build on configured-severity issues.
- [ ] Pre-commit hook rejects committed secrets (per CODING_STANDARDS §8).
- [ ] `README.md` documents the build, lint, and contribution flow in <1 page.
- [ ] Empty Part/Chapter directory skeleton exists for all 5 Parts × 6 chapters with placeholder front matter.
- [ ] Four ADR stub files exist at `docs/adr/ADR-00{1-4}-*.md` (stubs only; bodies filled in their respective tasks).

**Tasks:**

| #   | Title | Why | Depends on | Model | Rollback |
|-----|-------|-----|------------|-------|----------|
| 0.1 | Repo skeleton + directory layout + ADR stubs | Fixed structure unblocks every later task; ADR stubs committed now per Board-criteria flags | — | `hermes-coder` | Delete created dirs; `git revert` |
| 0.2 | Pandoc build config (Makefile + defaults files, xelatex template) `needs-adr: true` → ADR-001 | Reproducible PDF/EPUB build | 0.1 | `hermes-coder` | Revert `Makefile` + `build/` |
| 0.3 | Vale styles + proselint config tuned for calm/dry voice | Catches voice drift mechanically | 0.1 | `hermes-coder` | Remove `.vale.ini`, `styles/` |
| 0.4 | GitHub Actions workflow (build + lint + artifact upload) | CI gate enforces buildability | 0.2, 0.3 | `hermes-coder` | Delete `.github/workflows/book.yml` |
| 0.5 | Pre-commit hooks (secrets, trailing whitespace, lint) | CODING_STANDARDS §8 + §9 | 0.3 | `hermes-coder` | Remove `.pre-commit-config.yaml` |
| 0.6 | README + CONTRIBUTING for the manuscript workflow | Humans + agents both need the entry point | 0.1–0.5 | `claude-haiku` | Revert docs |

### Phase 1 — Book bible (the laws of this manuscript)

**Goal:** Lock the rules every chapter must obey, so 30 chapters of agent-produced scaffolding stay coherent.

**Acceptance criteria:**
- [ ] `bible/VOICE.md` defines the calm/dry/confident tone with 6+ before/after examples drawn from the source DNA.
- [ ] `bible/CHAPTER_TEMPLATE.md` is the canonical chapter skeleton (frontmatter, scenario, knowledge, field notes, further reading, endnotes) with field-by-field rules.
- [ ] `bible/SCENARIO_GROUNDING.md` defines the rubric for "scenario must cite a real incident" (what counts, what doesn't, minimum sourcing) including the Part 4 extrapolation rule.
- [ ] `bible/SOURCE_RUBRIC.md` defines tiered source quality (Tier 1: peer-reviewed / govt primary; Tier 2: established journalism inc. MIT Tech Review, RAND, FLI; Tier 3: trade nonfiction inc. the named authors; rejected: anonymous blogs, X threads, AI-generated summaries).
- [ ] `bible/FIELD_NOTES.md` defines what a "tangible action" is (testable in <1 week by an individual or small group) with 5 worked examples per Part.
- [ ] `bible/STYLE.md` reconciles Chicago Manual conventions with the project's specifics (numbers, units, dates, acronyms, name conventions for the prepper audience).
- [ ] CTO sign-off on the bible as a unit before Phase 2 opens.

**Tasks:**

| #   | Title | Why | Depends on | Model | Rollback |
|-----|-------|-----|------------|-------|----------|
| 1.1 | Voice guide with before/after examples | Voice is the highest-risk consistency vector; needs judgment to get right | 0.6 | `claude-sonnet` | Revert `bible/VOICE.md` |
| 1.2 | Chapter template + frontmatter schema | Mechanical consistency across 30 chapters | 0.1 | `hermes-coder` | Revert template files |
| 1.3 | Scenario grounding rubric (inc. Part 4 extrapolation rule) | Enforces non-negotiable #2; Part 4 edge case needs careful judgment | 1.2 | `claude-sonnet` | Revert rubric |
| 1.4 | Source-vetting rubric + tier list `needs-adr: true` → ADR-002 | Enforces non-negotiables #3 & #5; judgment-heavy; hard to change retroactively | 1.2 | `claude-sonnet` | Revert rubric |
| 1.5 | Field-notes definition + worked examples | Prevents "advice" drifting into vague exhortation | 1.2 | `claude-haiku` | Revert doc |
| 1.6 | Style guide (Chicago + project deltas) | Saves 30× rework downstream; mostly mechanical | 1.2 | `hermes-coder` | Revert doc |

### Phase 2 — Table of contents lock

**Goal:** A frozen 30-chapter TOC with a one-paragraph premise per chapter, slotted into the 5-Part architecture. Locked here so research in Phase 3 doesn't get re-cut.

**Acceptance criteria:**
- [ ] `manuscript/TOC.md` lists all 30 chapters with: title, Part, ordinal, one-paragraph premise (≤120 words), the "knowledge promise" (what the reader will be able to do or understand after the chapter), and the source DNA most relied on.
- [ ] No chapter overlaps another by >25% premise area (reviewer judgement, documented in a comment).
- [ ] Part 1 (Baseline) is dominantly practical; Part 4 (Unknown) is dominantly speculative; this gradient is visible across the TOC.
- [ ] Every named author in the Source DNA appears in at least one chapter's "most relied on" field.
- [ ] CTO sign-off on TOC before Phase 3 opens.

**Tasks:**

| #   | Title | Why | Depends on | Model | Rollback |
|-----|-------|-----|------------|-------|----------|
| 2.1 | Draft Part 1 (Baseline) 6-chapter list | Anchors the practical end of the gradient | 1.6 | `hermes-coder` | Revert TOC entry |
| 2.2 | Draft Part 2 (Disruption) 6-chapter list | Grounded in current incidents | 1.6 | `hermes-coder` | Revert TOC entry |
| 2.3 | Draft Part 3 (Predictable Future) 6-chapter list | 5–15yr scenarios from policy literature | 1.6 | `hermes-coder` | Revert TOC entry |
| 2.4 | Draft Part 4 (Unknown) 6-chapter list | Speculative end of gradient | 1.6 | `hermes-coder` | Revert TOC entry |
| 2.5 | Draft Part 5 (Playbook) 6-chapter list | Synthesises Parts 1–4 | 2.1–2.4 | `hermes-coder` | Revert TOC entry |
| 2.6 | Cross-Part overlap + gradient audit `needs-adr: true` → ADR-003 (TOC lock) | Catches duplication and tone drift; permanently locks the TOC | 2.1–2.5 | `claude-sonnet` | Re-cut TOC before Phase 3 opens; after Phase 3 starts, scope change requires Orchestrator + human approval |

### Phase 3 — Per-chapter research dossiers

**Goal:** For each of the 30 chapters, ship a research dossier the human author can write prose from without further lookup.

**Acceptance criteria (per chapter):**
- [ ] `manuscript/<part>/<chapter>/dossier.md` exists with: scenario seed (≥2 candidate real incidents, each with 2+ Tier-1/2 sources), 8–15 key claims (each with ≥1 Tier-1/2 citation), 5–10 candidate field-notes actions, 3–5 further-reading pointers from the source DNA.
- [ ] `manuscript/<part>/<chapter>/endnotes.md` initialised with the citation list referenced from `dossier.md`.
- [ ] All sources pass `SOURCE_RUBRIC.md`. Sonnet spot-checks 1-in-5 dossiers for source quality and voice fit.
- [ ] No dossier exceeds 4,000 words of agent prose (this is scaffolding, not draft).

**Tasks:**

**Research methodology** `needs-adr: true` → ADR-004. Orchestrator must publish and CTO must approve `docs/adr/ADR-004-research-methodology.md` before any dossier task opens.

30 dossier tasks, one per chapter (`3.1`–`3.30`), each:
- **Primary model:** `hermes-coder` for all 30 chapters. Hermes Developer does the bulk research writing.
- **Spot-check model:** `claude-sonnet` reviews 1-in-5 dossiers (tasks 3.5, 3.10, 3.15, 3.20, 3.25, 3.30) against `SOURCE_RUBRIC.md` and `VOICE.md` before sign-off.
- Depends on: 2.6 + ADR-004 approved + the corresponding TOC entry.
- Rollback: revert the chapter directory.

Parallelisation: up to 6 `hermes-coder` dossier tasks in flight concurrently (one per Part), each in its own worktree per AMA §3.

### Phase 4 — Scaffolding integration & cross-chapter coherence

**Goal:** Make the 30 dossiers behave as one book, not 30 essays.

**Acceptance criteria:**
- [ ] Recurring themes (psychology under uncertainty, community/trust, analog-digital tension, ethics of surviving) appear in `bible/THEMES.md` with a per-chapter coverage matrix.
- [ ] Cross-reference suggestions (`see Ch. X`) added to dossiers where applicable, listed in `manuscript/CROSSREF.md`.
- [ ] Terminology consistency report: any term used in ≥3 chapters has a single agreed definition in `bible/GLOSSARY.md`.
- [ ] Source overlap map: which sources are reused across chapters, to spot over-reliance.

**Tasks:**

| #   | Title | Why | Depends on | Model | Rollback |
|-----|-------|-----|------------|-------|----------|
| 4.1 | Theme coverage matrix | Recurring themes are a brief requirement; needs synthesis judgment | Phase 3 | `claude-sonnet` | Revert `bible/THEMES.md` |
| 4.2 | Cross-reference pass | Turns 30 essays into a book; mechanical cross-linking | 4.1 | `hermes-coder` | Revert `manuscript/CROSSREF.md` |
| 4.3 | Glossary build | Terminology consistency; mechanical extraction from dossiers | Phase 3 | `claude-haiku` | Revert `bible/GLOSSARY.md` |
| 4.4 | Source overlap & gap analysis | Detects over-reliance or missing Source DNA; judgment on what "over-reliance" means | Phase 3 | `claude-sonnet` | Revert report |

### Phase 5 — Human prose pass (gate, not agency work)

**Goal:** Human author writes chapter prose from the dossiers. Tracked here as a milestone so the agency pipeline (lint, build, CI) supports it, but no agent writes body prose.

**Acceptance criteria:**
- [ ] All 30 `chapter.md` body files exist and build cleanly.
- [ ] Vale + proselint pass at configured severity.
- [ ] Every endnote referenced in a chapter resolves to an entry in `endnotes.md`.

**Tasks:** Human-owned. Agency tasks here are limited to keeping CI green and surfacing lint/build regressions (`hermes-coder` handles CI triage; any regression that requires judgement about whether it reflects voice or content drift goes to `claude-sonnet`).

### Phase 6 — Editorial pass on completed prose

**Goal:** Agents fact-check, citation-verify, and consistency-check the human's prose without rewriting it.

**Acceptance criteria:**
- [ ] Every claim with a citation: agent re-verifies the source still says what the endnote says it does. Mismatches filed as issues, not edits.
- [ ] Cross-reference resolution: every `see Ch. X` actually points at the intended content.
- [ ] Glossary adherence: terms used per `GLOSSARY.md` definitions; deviations flagged as issues.
- [ ] Field-notes audit: every field-notes box passes the "testable in <1 week" rubric, or an issue is filed.
- [ ] CTO sign-off on editorial report before Phase 7 opens.

**Tasks:**

| #   | Title | Why | Depends on | Model | Rollback |
|-----|-------|-----|------------|-------|----------|
| 6.1 | Citation re-verification (30 tasks, one per chapter) | Sources rot; the book must ship current | Phase 5 | `hermes-coder` | n/a — read-only; produces issues |
| 6.2 | Cross-reference & glossary audit | Catches drift introduced in human prose; mechanical | Phase 5 | `hermes-coder` | n/a — issues only |
| 6.3 | Field-notes testability audit | Enforces non-negotiable #4 in prose; needs judgment about what "testable in <1 week" means | Phase 5 | `claude-sonnet` | n/a — issues only |
| 6.4 | Final editorial report | One artifact for CTO sign-off; highest-judgment synthesis | 6.1–6.3 | `claude-opus` | Revert report file |

### Phase 7 — Final build & shipping artifacts

**Goal:** Produce the deliverables a publisher or self-publishing pipeline needs.

**Acceptance criteria:**
- [ ] `dist/surviving-the-ai-world.pdf` and `.epub` build clean from CI on a tagged release.
- [ ] `dist/sample-chapter.pdf` (one chapter, marketing-ready) builds from a separate Pandoc target.
- [ ] `dist/marketing-onepager.md` exists (positioning, audience, comp titles, TOC, sample paragraph), human-reviewed.
- [ ] Cover placeholder (text-only, design TBD by human) included in the EPUB.
- [ ] Tagged GitHub release contains all four artifacts.

**Tasks:**

| #   | Title | Why | Depends on | Model | Rollback |
|-----|-------|-----|------------|-------|----------|
| 7.1 | Sample-chapter build target | Marketing needs a vertical slice; Makefile config | Phase 6 | `hermes-coder` | Revert Makefile target |
| 7.2 | Marketing one-pager scaffolding | Agency-produced scaffolding, human edits; writing task | Phase 6 | `claude-haiku` | Revert file |
| 7.3 | Cover placeholder + EPUB metadata | EPUB needs both to validate; config task | Phase 6 | `hermes-coder` | Revert epub config |
| 7.4 | Tagged release + artifact upload | Single shippable deliverable | 7.1–7.3 | `hermes-coder` | Delete tag + release |

## Parallelisation map

- Phase 0: 0.2 ∥ 0.3 (different config domains); 0.4 depends on both.
- Phase 1: 1.1 ∥ 1.3 ∥ 1.4 ∥ 1.5 ∥ 1.6 (independent docs); 1.2 first as it defines fields the others reference.
- Phase 2: 2.1 ∥ 2.2 ∥ 2.3 ∥ 2.4 (independent Parts); 2.5 last; 2.6 depends on all.
- Phase 3: up to 6 `hermes-coder` dossier tasks in flight concurrently — one per Part — each in its own worktree per AMA §3. Sonnet spot-checks are sequential after each batch of 5.
- Phase 4: 4.1 ∥ 4.3 (independent); 4.2 depends on 4.1; 4.4 ∥ 4.1 once Phase 3 closes.
- Phase 6: 6.1 ∥ 6.2 ∥ 6.3; 6.4 last.
- Phase 7: 7.1 ∥ 7.2 ∥ 7.3; 7.4 last.

## Risks and unknowns

- **Voice drift across 30 chapters.** → Mitigation: Phase 1 `VOICE.md` with before/after examples; Vale custom style enforcing banned phrasings; Sonnet spot-checks 1-in-5 dossiers in Phase 3 for voice fit as well as source quality.
- **Source rot during the project lifecycle.** → Mitigation: archive every cited URL to the Wayback Machine at dossier-time; store archive URLs alongside live URLs in endnotes. Phase 6 re-verification catches mid-flight drift.
- **Scenario grounding fails for speculative Part 4 chapters.** → Resolution path: `SCENARIO_GROUNDING.md` (task 1.3, owned by Sonnet) must define an extrapolation rule — scenario must extrapolate from a cited real incident or cited expert prediction; pure invention remains disallowed. CTO approves the rule in Phase 1.
- **Agency-vs-human handoff on prose (Phase 5).** → Mitigation: agency owns nothing in Phase 5 except CI; explicit issue templates differentiate "dossier issue" from "prose issue" to keep ownership unambiguous.
- **Budget overrun on 30 research-heavy dossiers.** → Mitigation: hard cap dossier word count (4k); after the first 3 dossiers, Orchestrator measures actual tokens/dossier and re-projects against the $400 cap; escalate at 80%. Hermes-coder being the bulk model keeps cost low.
- **Prepper-audience framing vs. Source DNA tone.** The brief picks prepper/survival as the primary audience but lists Source DNA (Harari, Tegmark, Ord) that skews tech-policy. → Mitigation: `VOICE.md` (Sonnet-authored) codifies "practical-first language, intellectually serious substance"; Sonnet validates calibration on the first completed dossier before Phase 3 continues.

## Assumption ledger

Defaults I chose where the human didn't specify. **Ordered riskiest first.** Every item here is one the plan depends on — if wrong, it causes rework.

| Domain | Default | Why I chose it | Rework cost if wrong |
|---|---|---|---|
| **Toolchain — PDF engine** | xelatex (via Pandoc `--pdf-engine=xelatex`) | Best Unicode and font support; standard for complex documents | HIGH — switching engines mid-project requires retesting the template and all built artifacts |
| **TOC count** | Exactly 6 chapters per Part (30 total) | Human said "~6 chapters"; I locked to exactly 6 for mechanical consistency | MEDIUM — TOC drives all of Phase 3; adjusting to 5 or 7 per Part after Phase 2 requires re-scoping 30→25 or 35 dossier tasks |
| **Phase sequencing** | Phases 0–2 fully sequential before Phase 3 opens | Ensures the bible and TOC are stable before research begins | MEDIUM — alternative is parallel; saves ~1–2 weeks but risks rework if TOC changes mid-dossier |
| **Citation style** | Chicago Manual of Style (numbered endnotes) | Most common in trade nonfiction; prepper audience is familiar | LOW — style can be changed uniformly at Phase 7 build time via Pandoc CSL |
| **Prose linter** | Vale + proselint | Open-source, CI-friendly, configurable; best combo for voice enforcement | LOW — alternatives exist (LanguageTool API); swap is a one-file config change |
| **CI provider** | GitHub Actions | Repo is on GitHub; no external CI needed | LOW — easily swapped to a separate CI provider with one workflow file change |
| **Source archival** | Wayback Machine for URL rot mitigation | Free, widely trusted, no API key needed | LOW — additive; not removing it just means some sources may rot unarchived |

## Board-criteria flags (ADR stubs required)

Tasks marked `needs-adr: true` because they touch architecture, dependency choice, or irreversible/large-blast-radius decisions:

- **Task 0.2** `needs-adr: true` — Pandoc + xelatex toolchain selection. Stub: `docs/adr/ADR-001-pandoc-pdf-engine.md`
- **Task 1.4** `needs-adr: true` — Source-vetting rubric and tier list. Defines what counts as acceptable evidence for the whole book; hard to change retroactively. Stub: `docs/adr/ADR-002-source-tier-rubric.md`
- **Task 2.6** `needs-adr: true` — TOC lock. After this gate Phase 3 research is commissioned; un-locking the TOC collapses all 30 dossier tasks. Stub: `docs/adr/ADR-003-toc-lock.md`
- **Phase 3 methodology** `needs-adr: true` — Research dossier methodology (what agents search, what sources they can cite, how they handle paywalled sources). Drives the quality of all 30 dossiers. Stub: `docs/adr/ADR-004-research-methodology.md`

ADR stubs will be committed as part of Phase 0 (task 0.1) alongside the directory skeleton.

## Out of scope

- Writing chapter body prose (human-owned per non-negotiable #1).
- Book cover design (placeholder only; design is human-owned).
- Audiobook production, translation, foreign-rights packaging.
- Publisher submission, agent queries, marketing campaign execution.
- Any chapter beyond the 30 in the locked TOC. Scope expansion → new PLAN revision.
