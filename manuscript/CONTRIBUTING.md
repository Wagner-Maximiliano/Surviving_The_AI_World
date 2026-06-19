# Contributing to the Manuscript

This manuscript is developed by a coordinated team of humans and AI agents following the Max Agency model. Coordination happens via GitHub Issues and the AMA (Agent-to-Agent) protocol.

## Before you start

Read these in order:

1. [`README.md`](./README.md): overview of the manuscript structure
2. [`../PLAN.md`](../PLAN.md): the full project roadmap and phase gates
3. [`../bible/`](../bible/): rules every chapter must follow (voice, structure, sourcing, grounding, field notes, style)
4. [`../docs/AMA.md`](../docs/AMA.md) (in Max_Agency repo): agent-to-agent coordination protocol

## Chapter structure

Each chapter is a Markdown file with YAML frontmatter:

```markdown
---
title: Chapter Title
part: 1                # Which part (1-5)
chapter: 3             # Which chapter within part (1-6)
status: placeholder    # Status: placeholder | draft | review | locked
---

Chapter body...
```

The chapter body must follow the template in `../bible/CHAPTER_TEMPLATE.md`:

1. **Narrative scenario**: ~200 words, grounded in a real, documented incident
2. **Core knowledge**: the chapter's main prose
3. **Field notes**: 2-3 tangible, testable actions
4. **Further reading**: pointers to deeper sources
5. **Endnotes**: numbered references + bibliography entries

See `../bible/CHAPTER_TEMPLATE.md` for the full structure and rules.

## Branches and commits

Work on a branch named `phase-<n>/<issue-#>-<topic>` (e.g., `phase-1/23-part-1-voice-guide`).

Commit messages follow the format:

```
phase-<n>/<issue-#>: <imperative subject line>
```

Examples:

```
phase-0/6: add pre-commit config
phase-1/23: draft voice guide with before/after examples
phase-3/45: add scenario for ch-02 (grounded in NIST incident)
```

- One logical change per commit.
- If a pre-commit hook fails, fix the underlying issue and create a **new** commit. Never `--amend` past hook failures.

## Pull requests

PRs are opened by the CTO role (or human owner), not individual contributors. The PR body includes:

- Phase ID
- Linked issue #
- Link to `PLAN.md` task row
- Acceptance criteria checklist

## Acceptance criteria for chapters

Every chapter must meet ALL of these before merge:

- [ ] Title, part, and chapter number are set correctly in frontmatter
- [ ] Scenario cites a documented real incident (see `../bible/SCENARIO_GROUNDING.md`)
- [ ] Every non-trivial claim has a numbered endnote with a full bibliography entry (see `../bible/SOURCE_RUBRIC.md`)
- [ ] Sources are Tier 1 or Tier 2 per `../bible/SOURCE_RUBRIC.md` (peer-reviewed, government primary, established journalism)
- [ ] Field notes are testable actions (not vague exhortation) per `../bible/FIELD_NOTES.md`
- [ ] Prose follows the voice rules in `../bible/VOICE.md` (calm, dry, confident)
- [ ] Style follows `../bible/STYLE.md` (Chicago Manual + project deltas)
- [ ] No `TODO` comments in the chapter file
- [ ] No secrets, API keys, or sensitive data
- [ ] Vale lint passes: `vale manuscript/part-X/ch-NN/`

## Scenarios and sourcing

- **Scenarios must be grounded.** Find a real, documented incident that illustrates the chapter's core idea. Reference it in the opening (e.g., "In 2023, ..."). See `../bible/SCENARIO_GROUNDING.md` for the full rubric.
- **Sources must be tiered.** Tier 1 (peer-reviewed / government): highest authority. Tier 2 (MIT Tech Review, RAND, established journalism): good. Tier 3 (trade nonfiction): acceptable if cited clearly. Reject: anonymous blogs, X threads, AI-generated summaries. See `../bible/SOURCE_RUBRIC.md` for full details.
- **Every claim gets an endnote.** Use numbered footnotes (`[^1]`) and a footnotes section at the end of the chapter. Endnotes feed into `../docs/adr/ADR-004-bibliography.md` for the consolidated bibliography.

## Field notes

Field notes are the "so what?" at the end of every chapter: tangible actions readers can take in the next week. Each field note must be:

- **Testable by an individual or small group**
- **Completable in <1 week**
- **Concrete, not aspirational** (no "think about..." or "consider...")

See `../bible/FIELD_NOTES.md` for 5+ worked examples per part.

## Coordination protocol

If you're an AI agent, you must declare yourself on every first comment of an interaction:

```
[agent] <role>:<provider>:<model>
[profile] <profile-name>
[issue] #<N>   [branch] <branch-name>
```

See `../docs/AMA.md` for the full protocol, including cross-provider review, escalation, and disagreement resolution.

## Questions?

- For clarifications about chapter rules, link to the relevant section in `../bible/`
- For questions about phases or issue assignment, open an issue and reference `PLAN.md` task #
- For coordination or escalation, follow the protocol in `../docs/AMA.md`
