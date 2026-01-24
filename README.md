# Homebrew Tap

Homebrew formulae for thkt's tools.

## Installation

```bash
brew tap thkt/tap
brew install guardrails
```

## Available Formulae

| Formula                                                 | Description                                            |
| ------------------------------------------------------- | ------------------------------------------------------ |
| [guardrails](https://github.com/thkt/claude-guardrails) | PreToolCall hook for Claude Code - security guardrails |

## Usage

After installation, configure Claude Code's `~/.claude/settings.json`:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Write|Edit|MultiEdit",
        "hooks": [
          {
            "type": "command",
            "command": "guardrails",
            "timeout": 1000
          }
        ]
      }
    ]
  }
}
```
