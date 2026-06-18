# Max Agency -- project model settings

Per-project model settings for the **Max Agency** gate. This file lives in *this* repo's
root; the gate reads it on every run and uses these models for **this project only** -- Max
Agency itself is never modified. Edit a value, **commit + push**, and the next gate run uses it.

> Test a model before relying on it: `python gate/check_model.py <role> --model <id>`
> Each role uses a fixed provider, so the id **format differs per field** (see the tables).
> API keys live with each provider (OpenRouter key in `~/.hermes/.env`; `codex` login;
> `claude` login) -- never in this file.

## Active settings

Edit the values inside this block:

```ini
GATE_CODER_MODEL=deepseek/deepseek-v4-flash
GATE_TRIAGE_MODEL=gpt-5.4-mini
GATE_ARCHITECT_MODEL=opus
GATE_CTO_MODEL=opus
```

## Model options (copy a value into the matching field above)

### `GATE_CODER_MODEL` -- hermes -> OpenRouter (format `provider/model`; verify slug at <https://openrouter.ai/models>)

| model | notes |
|---|---|
| `xiaomi/mimo-v2.5` | strong coder (default) |
| `anthropic/claude-sonnet-4.6` | excellent writer -- good for prose/book repos |
| `anthropic/claude-opus-4.8` | top quality, higher cost |
| `openai/gpt-5.4` | strong all-rounder |
| `google/gemini-2.5-pro` | long-context all-rounder |
| `deepseek/deepseek-v3.2` | cheap, capable |
| `qwen/qwen3-coder` | budget coder |
| `x-ai/grok-4` | all-rounder |
| `meta-llama/llama-4-maverick` | open-weight |
| `mistralai/mistral-large-2` | open-weight |
| `deepseek/deepseek-v4-flash` | open-weight |


### `GATE_TRIAGE_MODEL` -- codex CLI (OpenAI auth)

| model | notes |
|---|---|
| `gpt-5.4-mini` | cheap, default (verified accepted) |
| `gpt-5.4` | stronger, pricier |

### `GATE_ARCHITECT_MODEL` / `GATE_CTO_MODEL` -- claude CLI (Anthropic auth)

| model | notes |
|---|---|
| `opus` | latest Opus (default) |
| `sonnet` | faster / cheaper |
| `haiku` | cheapest |
| `claude-opus-4-8` | pin a specific version |
| `claude-sonnet-4-6` | |