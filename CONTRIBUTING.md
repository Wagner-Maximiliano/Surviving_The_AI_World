# Contributing to Surviving the AI World

## Overview

This repo is built by the **Max Agency** (a fleet of AI agents) coordinating with a **human author**. The project follows a **phase-based plan** in [`PLAN.md`](./PLAN.md). Read that file first to understand your role in the project timeline.

**Agents:** Your coordination protocol is [`docs/AMA.md`](https://github.com/Wagner-Maximiliano/Max_Agency/blob/main/docs/AMA.md) in the Max_Agency repo. Coding standards are in [`CODING_STANDARDS.md`](https://github.com/Wagner-Maximiliano/Max_Agency/blob/main/CODING_STANDARDS.md).

---

## For Writers (Humans)

### Your role in the phases

- **Phases 0–4:** Review and approve scaffolding as agents build the framework, style bible, research dossiers, and cross-chapter integration.
- **Phase 5:** You write chapter prose from research dossiers. Agents keep CI green and flag lint issues, but they don't write your prose.
- **Phase 6:** Agents fact-check and consistency-check your prose (read-only; they file issues, not edits).

### How to write a chapter

1. **Wait for your dossier.** Agents provide `manuscript/<part>/<chapter>/dossier.md` with research, scenarios, claims (with citations), and field-notes drafts.
2. **Read the bible.** [`bible/VOICE.md`](./bible/VOICE.md) defines tone. [`bible/CHAPTER_TEMPLATE.md`](./bible/CHAPTER_TEMPLATE.md) defines structure.
3. **Write `chapter.md`.** Use the dossier as your reference; write your own prose. Follow the structure: scenario (with citation to a real incident), body knowledge, field notes, further reading, endnotes.
4. **Lint before you push.** Run `vale manuscript/` to catch voice drift. Fix any errors flagged at your configured severity.
5. **Commit and push.** Use the message format `p5/#<issue>: <subject>` (e.g., `p5/#100: write part-1-baseline ch-01`).
6. **Open a PR.** Agents will review and flag any issues (deviations from the dossier, unsourced claims, untestable field notes). You are not required to accept their suggestions — the prose is yours.

### Rules that apply to your prose

- **Every factual claim** must have a citation. Use numbered endnotes per Chicago Manual of Style (see `bible/STYLE.md`).
- **Every field note** must be testable by someone in <1 week (individual or small group). Vague advice ("stay informed", "build community") is not acceptable.
- **Tone:** Calm, dry, confident. Read the before/after examples in `bible/VOICE.md`.
- **Scenario opening:** Must cite a real, documented incident (not invented or purely hypothetical). The sources must be Tier 1 or 2 per `bible/SOURCE_RUBRIC.md`.

### Your approval gates

- Once all 30 chapters are prose-complete and linted, the CTO reviews the whole book for consistency before final build.
- You have the final say on prose content; agents can suggest but cannot rewrite.

---

## For Agents

### Your workflow

1. **Pick up an issue** labeled with your assigned model and phase.
2. **Read [`PLAN.md`](./PLAN.md)** to understand your phase's goals, acceptance criteria, and dependencies.
3. **Read your role contract** (in Max_Agency repo: `agents/architect.md`, `coder.md`, `cto.md`, `orchestrator.md`).
4. **Load relevant skills** (from Max_Agency repo `skills/`; your role contract tells you how).
5. **Check for `CHANGES REQUIRED` comments** on the issue. If any exist, address **all** of them before opening a new PR.
6. **Work on your assigned branch** in your own worktree (one task = one branch). Never edit a branch you weren't assigned to.
7. **Commit, push, open PR, move issue to `review`.** The CTO will review; Orchestrator will handle merge.

### Branches

- `main` — protected. Only CTO/Orchestrator merge after review + human sign-off.
- Work branches — created per task. Format: `phase-<n>/<issue-#>-<slug>` (e.g., `phase-0/38-readme-contributing`).

### Commits

Format (CODING_STANDARDS §9):

```
<phase-id>/<issue-#>: <imperative subject line>
```

Examples:

```
p0/#38: update README and CONTRIBUTING for clarity
p3/#45: research and scaffold part-1-baseline ch-03 dossier
```

Rules:
- One logical change per commit.
- If a pre-commit hook fails, fix the issue and create a **new** commit. Never `--amend` past hook failures.

### Pull requests

- **Opened by:** You (the assigned agent), via `gh pr create`.
- **Body:** Include phase ID, linked issue, acceptance-criteria checklist, and PLAN.md row link.
- **Review:** CTO will review. You may NOT approve your own PR or merge.
- **Merge:** Handled by Orchestrator after CTO approval.

### Scaffolding vs. prose

**You write:**
- Outlines, research frameworks, dossiers, scenario seeds (with citations), claimed statements (with sources), field-notes drafts.

**You do NOT write:**
- Chapter body prose (Phase 5 onwards). That's the human author's job.
- Vague advice or invented scenarios. Every scenario must cite a real incident. Every claim must have a source.

### Sources and citations

- **Tier 1:** Peer-reviewed academic, government/official reports.
- **Tier 2:** Established journalism (MIT Tech Review, RAND, Future of Life Institute), published trade nonfiction.
- **Tier 3:** NOT acceptable. No anonymous blogs, no X threads, no AI-generated summaries.

See [`bible/SOURCE_RUBRIC.md`](./bible/SOURCE_RUBRIC.md) for the full rubric.

### Agent-to-agent coordination

When you post to GitHub (issue, PR, review), lead with:

```
[agent] <role>:<vendor>:<model>
[profile] <profile-name> (acting in <role> role)
```

Example:
```
[agent] coder:anthropic:claude-haiku-4-5
[profile] claude-routine
[issue] #38   [branch] phase-0/38-readme-contributing
```

Full protocol: [`docs/AMA.md`](https://github.com/Wagner-Maximiliano/Max_Agency/blob/main/docs/AMA.md) in Max_Agency repo.

### Phase gates

Don't start work outside the current active phase without CTO + human approval. Check [`PLAN.md`](./PLAN.md) for the current phase and blockers (e.g., Phase 3 is blocked until ADR-004 is merged).

---

## Pre-commit hooks

Before your first commit:

```bash
pip install pre-commit
pre-commit install
```

Hooks check for secrets (gitleaks), formatting, and trailing whitespace. If a hook fails:
1. Fix the underlying issue (e.g., remove the secret, reformat).
2. **Create a new commit.** Never `--amend` past a hook failure.

---

## Building and linting

```bash
# Build a test PDF from current manuscript state
make pdf

# Lint for voice drift and errors
vale sync              # one-time: pull proselint package
vale manuscript/       # check all chapters

# Full build (PDF + EPUB)
make all
```

Local style rules are in `styles/Surviving/` and `.vale.ini`.

---

## Questions?

- **Agents:** See [`PLAN.md`](./PLAN.md) for phase details, acceptance criteria, and blockers. See Max_Agency repo for `agents/`, `docs/`, and `skills/`.
- **Writers:** Read the `bible/` folder for style, voice, and structural rules.
- **Both:** Read [`PLAN.md`](./PLAN.md) for the full project scope, timeline, and constraints.
