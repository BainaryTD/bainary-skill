# Changelog

All notable changes to `bainary-skill` are documented here.

## [0.2.1] — 2026-06

### Added
- `.bainary/session-handoff.md` template for carrying AI chat context, decisions, risks, and next steps into the next session.
- First-chat project style learning workflow: AI assistants are instructed to inspect the existing codebase and update `.bainary/patterns.md`, `.bainary/conventions.md`, and `.bainary/project-knowledge.md` before coding when knowledge is incomplete.
- End-of-chat continuity workflow: AI assistants are instructed to update `.bainary/session-handoff.md` and move stable learnings into the relevant `.bainary/` knowledge files.

### Improved
- `learn`, `update`, and `status` now include `session-handoff.md` in project knowledge management.
- Adapter instructions for Claude, Codex, Cursor, Grok, and Aider now include session continuity rules.

## [0.2.0] — 2025-06

### Added
- `adapters/cursor/` — Cursor IDE support (`.cursorrules` + `CURSOR.md`)
- `adapters/aider/CONVENTIONS.md` — Aider CLI support
- `adapters/web-project/README.md` — Documentation for web-project adapter
- `templates/.bainary/` — Full set of project knowledge templates
  - `project-knowledge.md`
  - `architecture.md`
  - `patterns.md`
  - `conventions.md`
- `templates/web-project/package.json` — Next.js 14 project starter
- `templates/web-project/.gitignore` — Standard gitignore
- `scripts/bainary-skill` — CLI with `learn`, `update`, `status` commands

### Improved
- `adapters/claude/CLAUDE.md` — Expanded with verification checklist and workflow
- `adapters/codex/AGENTS.md` — Expanded with code generation rules
- `adapters/grok/AGENTS.md` — Expanded with constraints and verification

## [0.1.0] — Initial Release

### Added
- `SKILL.md` — Core skill definition with Karpathy principles
- `adapters/claude/`, `adapters/codex/`, `adapters/grok/` — Initial adapters
- `templates/web-project/` — Basic web project template
