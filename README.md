# thkt/tap

Homebrew formulae for Claude Code tools.

## Quick Install

```bash
brew tap thkt/tap
```

### Hook Suite

A 4-tool quality pipeline for Claude Code. Install all for comprehensive
coverage:

```bash
brew install guardrails formatter reviews gates
```

These hooks run automatically at different points in a Claude Code session:

```text
Write/Edit  ──→  guardrails (pre)  ──→  [write]  ──→  formatter (post)
/audit      ──→  reviews (pre)     ──→  [skill with analysis context]
Completion  ──→  gates (stop)      ──→  [block on quality issues]
```

| Tool       | Hook        | Timing            | Role                              |
| ---------- | ----------- | ----------------- | --------------------------------- |
| guardrails | PreToolUse  | Before Write/Edit | Lint (oxlint) + security checks   |
| formatter  | PostToolUse | After Write/Edit  | Auto-format (oxfmt)               |
| reviews    | PreToolUse  | Before Skill      | Static analysis context injection |
| gates      | Stop        | Agent completion  | Quality gates (knip, tsgo, madge) |

### CLI Tools

```bash
brew install scout yomu recall
```

## Available Formulae

### Hooks

| Formula                                            | Description                                               |
| -------------------------------------------------- | --------------------------------------------------------- |
| [guardrails](https://github.com/thkt/guardrails)   | PreToolUse hook — lint + security checks on Write/Edit    |
| [formatter](https://github.com/thkt/formatter)     | PostToolUse hook — auto-format files using oxfmt or biome |
| [reviews](https://github.com/thkt/reviews)         | PreToolUse hook — static analysis context for /audit      |
| [gates](https://github.com/thkt/gates)             | Stop hook — quality gates (knip, tsgo, madge)             |

### CLI

| Formula                                            | Description                                               |
| -------------------------------------------------- | --------------------------------------------------------- |
| [scout](https://github.com/thkt/scout)             | Web search (Gemini Grounding) and page fetch CLI          |
| [yomu](https://github.com/thkt/yomu)               | Frontend-specialized semantic code search CLI             |
| [recall](https://github.com/thkt/recall)           | Semantic search for past Claude Code sessions            |
| [notch](https://github.com/thkt/notch)             | Notion Page to Markdown CLI                               |
| [claude-idr](https://github.com/thkt/claude-idr)   | Implementation Decision Records from git diffs            |

## Hook Suite Configuration

After installing the hook suite, add to `~/.claude/settings.json`:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Write|Edit|MultiEdit",
        "hooks": [
          { "type": "command", "command": "guardrails", "timeout": 1000 }
        ]
      },
      {
        "matcher": "Skill",
        "hooks": [
          { "type": "command", "command": "reviews", "timeout": 45000 }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Write|Edit|MultiEdit",
        "hooks": [
          { "type": "command", "command": "formatter", "timeout": 2000 }
        ]
      }
    ],
    "Stop": [
      {
        "hooks": [
          { "type": "command", "command": "gates", "timeout": 70000 }
        ]
      }
    ]
  }
}
```

Per-project configuration is done via `.claude/tools.json`. See each tool's
README for details.
