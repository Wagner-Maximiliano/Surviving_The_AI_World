# Vale styles

Local custom style: `Surviving/`.

Third-party styles (`proselint`) are downloaded by `vale sync` and intentionally
not vendored — they sit under `styles/proselint/` after sync and are ignored by
git (see repo `.gitignore` if you add them locally).

## Setup

```bash
# macOS
brew install vale

# Then, from the repo root:
vale sync       # pulls proselint package into styles/
vale manuscript/
```

CI runs `vale sync && vale manuscript/` automatically.
