# Aider Conventions — bainary-skill

This project follows **bainary-skill** web development principles.

## Before Starting

Read project context in `.bainary/`:
- `project-knowledge.md` — project overview
- `session-handoff.md` — latest AI chat summary and next steps
- `architecture.md` — architecture decisions
- `patterns.md` — code patterns in use
- `conventions.md` — naming and structure rules

If `patterns.md` or `conventions.md` is still generic, inspect the existing source code first and update them with the project's real style/code patterns before coding.

## Core Principles

1. **Think Before Coding** — Analyze and plan before writing
2. **Simplicity First** — Prefer simple, maintainable code
3. **Surgical Changes** — Change only what the task requires
4. **Goal-Driven Execution** — Every change has a verifiable purpose

## Naming Conventions

Follow whatever is defined in `.bainary/conventions.md` for this project.
Default fallbacks if not specified:
- Components: PascalCase (`UserCard`, `NavBar`)
- Utilities/hooks: camelCase (`useAuth`, `formatDate`)
- Constants: UPPER_SNAKE_CASE (`API_BASE_URL`)
- Files: match the export name

## Commit Style

```
feat: add user authentication
fix: resolve mobile nav overlap
refactor: simplify data fetching in Dashboard
docs: update .bainary/patterns.md
```

## Optional Minimal-Change Mode

This mode is off by default. When `.bainary/mode` contains `minimal`, apply the following only to coding tasks:
- Question whether the requested code is needed (YAGNI)
- Reuse existing project code before adding abstractions or dependencies
- Prefer standard-library and native-platform solutions
- Fix shared root causes instead of patching individual callers
- Choose the smallest maintainable diff and leave one runnable check for non-trivial logic

Never remove input validation, security, accessibility, error handling, data-loss protection, or explicit requirements. Return to normal behavior when `.bainary/mode` is absent or does not contain `minimal`.

## Automatic Project Learning

Before finishing any meaningful task, automatically update `.bainary/session-handoff.md` with the current focus, what changed this session, decisions made, files touched and why, newly discovered project patterns, risks, and next steps. Do not wait for the user to ask.

Move stable reusable knowledge into `.bainary/patterns.md`, `.bainary/conventions.md`, `.bainary/architecture.md`, or `.bainary/project-knowledge.md` so the next chat can continue. Do not record temporary noise, raw command output, fixed failed attempts, unrelated chat, secrets, tokens, or `.env` values.

## What Aider Should Not Do

- Do not rewrite working code outside the task scope
- Do not introduce new dependencies without mentioning it
- Do not change folder structure without updating `.bainary/architecture.md`
