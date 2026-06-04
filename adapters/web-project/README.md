# web-project adapter

This adapter provides unified instruction files for a web project using bainary-skill.

## What This Adapter Does

When you run `bainary-skill learn` in a web project, this adapter generates:

| Output File | Target CLI |
|-------------|-----------|
| `CLAUDE.md` | Claude Code |
| `AGENTS.md` | Codex / Grok |
| `.cursorrules` + `CURSOR.md` | Cursor IDE |
| `CONVENTIONS.md` | Aider |

## Usage

```bash
cd my-web-project
bainary-skill learn          # generates .bainary/ + CLI instruction files
bainary-skill update         # refresh after significant changes
bainary-skill status         # show knowledge state
```

## File Sources

Each output file is derived from the matching adapter in:
- `adapters/claude/` → `CLAUDE.md`
- `adapters/codex/` → `AGENTS.md`
- `adapters/cursor/` → `.cursorrules` + `CURSOR.md`
- `adapters/aider/` → `CONVENTIONS.md`
