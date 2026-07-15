# Claude Code Instructions

This project uses **bainary-skill** principles. Read this file before making any changes.

## Core Principles

1. **Think Before Coding** — Analyze requirements, data flow, and component boundaries first.
2. **Simplicity First** — Prefer simple, maintainable solutions over clever abstractions.
3. **Surgical Changes** — Modify only what is necessary; never touch unrelated code.
4. **Goal-Driven Execution** — Every change must have a clear, verifiable goal.

## Before You Code

1. Read `.bainary/project-knowledge.md` — understand the project context
2. Read `.bainary/session-handoff.md` — continue from the last AI chat/task
3. Read `.bainary/architecture.md` — understand system design decisions
4. Read `.bainary/patterns.md` — follow existing patterns, don't invent new ones
5. Read `.bainary/conventions.md` — follow naming, folder, and styling rules
6. If patterns/conventions are generic or incomplete, inspect existing source code first and update `.bainary/` with the project's real style before coding

## Optional Minimal-Change Mode

This mode is off by default. When `.bainary/mode` contains `minimal`, apply the following only to coding tasks:
- Question whether the requested code is needed (YAGNI)
- Reuse existing project code before adding abstractions or dependencies
- Prefer standard-library and native-platform solutions
- Fix shared root causes instead of patching individual callers
- Choose the smallest maintainable diff and leave one runnable check for non-trivial logic

Never remove input validation, security, accessibility, error handling, data-loss protection, or explicit requirements. Return to normal behavior when `.bainary/mode` is absent or does not contain `minimal`.

## Automatic Project Learning

At the end of every meaningful chat/task, before the final response, learn what changed automatically. Do not wait for the user to ask.

If `.bainary/session-handoff.md` exists:
- Update it with current focus, what changed this session, decisions made, files touched and why, risks, and next steps
- Record newly discovered project style, component/API/testing patterns, naming rules, or workflow conventions
- Move stable reusable knowledge into `.bainary/patterns.md`, `.bainary/conventions.md`, or `.bainary/architecture.md`
- Keep `.bainary/project-knowledge.md` current when tech stack, entry points, or status changes
- Briefly mention in the final response that project handoff/knowledge was updated

Do not record temporary noise, fixed failed attempts, raw command output, unrelated chat, secrets, tokens, or `.env` values.

## When Writing Code

- Match the existing code style exactly
- Use the same libraries/frameworks already in the project
- Prefer editing existing files over creating new ones
- Write descriptive commit messages

## When You're Unsure

Stop and ask. Don't guess architecture decisions.

## Verification

Before finishing any task:
- [ ] Code follows the four core principles
- [ ] `.bainary/` knowledge is still accurate (update if needed)
- [ ] No unrelated files were modified
- [ ] Changes are testable and verifiable
