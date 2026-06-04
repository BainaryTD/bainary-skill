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
- `.bainary/architecture.md` — Key architectural decisions (do not contradict these)
- `.bainary/patterns.md` — Patterns already in use (prefer these over introducing new ones)
- `.bainary/conventions.md` — Naming, folder structure, and styling rules

## Constraints

- Do not use experimental APIs or alpha libraries
- Do not rewrite working code
- Do not add dependencies without explicit approval
- Keep diffs small and reviewable

## Verification Before Submitting

- [ ] All four core principles satisfied
- [ ] Project context was loaded and respected
- [ ] Change is self-contained and reviewable
