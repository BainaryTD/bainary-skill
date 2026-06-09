# Grok CLI Instructions

This project uses **bainary-skill** principles.

## Core Rules

1. **Think Before Coding** — Understand the problem fully before writing code.
2. **Simplicity First** — The simplest working solution is the best solution.
3. **Surgical Changes** — Touch only what the task requires.
4. **Goal-Driven Execution** — Every PR/commit must have a single clear purpose.

## Project Context Files

Before any task, load:
- `.bainary/project-knowledge.md` — What this project is and how it works
- `.bainary/session-handoff.md` — Latest AI chat summary, decisions, and next steps
- `.bainary/architecture.md` — Key architectural decisions (do not contradict these)
- `.bainary/patterns.md` — Patterns already in use (prefer these over introducing new ones)
- `.bainary/conventions.md` — Naming, folder structure, and styling rules

If `.bainary/patterns.md` or `.bainary/conventions.md` is still generic, inspect the existing source code first and update them with the project's real style/code patterns before coding.

## Session Continuity

Before finishing a chat/task, update `.bainary/session-handoff.md` with current focus, summary, decisions, files touched, risks, and next steps. Move stable new learnings into `.bainary/patterns.md`, `.bainary/conventions.md`, or `.bainary/architecture.md` so the next chat continues with context.

## Constraints

- Do not use experimental APIs or alpha libraries
- Do not rewrite working code
- Do not add dependencies without explicit approval
- Keep diffs small and reviewable

## Verification Before Submitting

- [ ] All four core principles satisfied
- [ ] Project context was loaded and respected
- [ ] Change is self-contained and reviewable
