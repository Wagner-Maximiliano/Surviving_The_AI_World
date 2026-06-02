# Contributing

This repo is driven by the Max Agency — a small fleet of agent roles
(Architect, Coder, CTO, Researcher, Editor) coordinating with one human owner.
The orchestration protocol lives in
[`docs/AMA.md`](https://github.com/Wagner-Maximiliano/Max_Agency/blob/main/docs/AMA.md)
in the Max_Agency repo. Coding rules are in
[`CODING_STANDARDS.md`](https://github.com/Wagner-Maximiliano/Max_Agency/blob/main/CODING_STANDARDS.md).

## Branches

- `main` — protected. Only merged via PR after CTO review + human sign-off.
- Work branches — created per phase or per task. Format:
  `claude/<adjective>-<noun>-<hash>` (auto-named by the Claude harness) or
  `<role>/<short-topic>` (manual).

## Commits

Format (CODING_STANDARDS §9):

```
<phase-id>/<issue-#>: <imperative subject line>
```

Examples:

```
p0/#2: add Pandoc Makefile + xelatex config (ADR-001)
p1/#7: populate style bible with voice rules
```

- One logical change per commit.
- If a pre-commit hook fails, fix the underlying issue and create a **new**
  commit. Never `--amend` past hook failures.

## Pull requests

- Opened by the CTO role (or human owner), not by Coder.
- Body must include: phase ID, linked issue, AC checklist, link to PLAN.md row.
- Squash-merge unless the phase explicitly preserves history.

## Identity

When an agent posts to GitHub (issue, PR, review), it leads with:

```
[agent] <role>:<vendor>:<model>
[profile] <profile-name> (acting in <role> role)
```

See `docs/AMA.md` for the full protocol.

## Phase work

The current phase, owners, acceptance criteria, and exit gates are in
[`PLAN.md`](./PLAN.md). Don't start work outside the active phase without
human approval.
