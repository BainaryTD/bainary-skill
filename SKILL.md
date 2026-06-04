---
name: bainary-skill
description: Web development base skill with project learning, continuous knowledge update, and multi-CLI support (Codex, Grok, Claude Code, Cursor, Aider).
version: 0.1.0
author: Bainary
license: MIT
metadata:
  hermes:
    tags: [web, base-skill, project-learning, multi-cli, adaptive]
    related_skills: [hermes-agent-skill-authoring]
---

# bainary-skill

Web Development Base Skill with Project Learning & Multi-CLI Support

## Overview

`bainary-skill` is a foundational skill for web development that combines the best practices from:

- **mattpocock/skills** — Composable, real engineering discipline
- **thananon/9arm-skills** — Practical structure and community usage
- **multica-ai/andrej-karpathy-skills** — Strong principles (Think Before Coding, Simplicity First, Surgical Changes, Goal-Driven Execution)

**Key differentiators:**
- Actively learns and understands the target project before generating code
- Maintains updatable project knowledge over time
- Works across multiple AI CLIs (Claude Code, Cursor, Codex, Grok, Aider)

## When to Use

- Starting a new web project and want consistent architecture + principles
- Working on an existing web codebase and want the AI to respect its patterns
- Want to maintain long-term project context across multiple sessions
- Using multiple AI coding tools and want unified behavior

**Don't use for:**
- Non-web projects (mobile, CLI tools, embedded)
- One-off scripts with no architecture concerns

## Core Principles (Adapted from Karpathy)

1. **Think Before Coding** — Analyze requirements, data flow, and component boundaries before writing code.
2. **Simplicity First** — Prefer simple, maintainable solutions over clever abstractions.
3. **Surgical Changes** — Modify only what is necessary; avoid touching unrelated code.
4. **Goal-Driven Execution** — Every change should have a clear, verifiable goal (render correctly, pass tests, meet performance targets).

## Project Learning System

`bainary-skill` maintains a `.bainary/` directory inside each project:

```
.bainary/
├── project-knowledge.md      # Main knowledge file
├── architecture.md           # High-level architecture decisions
├── patterns.md               # Recurring patterns discovered
└── conventions.md            # Naming, folder structure, styling rules
```

### Learning Commands

| Command | Description |
|---------|-------------|
| `bainary-skill learn` | Perform initial project discovery and create knowledge base |
| `bainary-skill update` | Update knowledge from recent code changes |
| `bainary-skill status` | Show current knowledge state and last updated time |

## Multi-CLI Support

The skill exports compatible instruction files for different AI CLIs:

| CLI | File | How it works |
|-----|------|--------------|
| Claude Code | `CLAUDE.md` | Copied/symlinked into project root |
| Cursor | `.cursorrules` + `CURSOR.md` | Cursor reads these automatically |
| Codex | `AGENTS.md` | Codex respects this file |
| Grok | `AGENTS.md` | Grok CLI can be pointed to this file |
| Aider | `CONVENTIONS.md` | Aider loads project conventions |

## Usage Workflow

### 1. Initialize New Web Project

```bash
bainary-skill web:init my-app
cd my-app
bainary-skill learn
```

### 2. Daily Development

```bash
bainary-skill update                    # Refresh project knowledge
bainary-skill web:component Button      # Create component respecting project style
bainary-skill web:feature auth          # Create feature module
bainary-skill web:review                # Review changes against principles
```

### 3. Working with Different CLIs

After running `bainary-skill learn`, the project will contain the appropriate instruction files for your preferred CLI.

## Common Pitfalls

- Running generation commands without first running `bainary-skill learn` or `update`
- Ignoring the generated `.bainary/` knowledge when the project evolves significantly
- Mixing multiple conflicting patterns from different CLIs without curation

## Verification Checklist

- [ ] `.bainary/project-knowledge.md` exists and is up to date
- [ ] Generated code follows the four core principles
- [ ] Changes are surgical and respect existing patterns
- [ ] Appropriate CLI instruction file is present in project root

## References

- https://github.com/mattpocock/skills
- https://github.com/thananon/9arm-skills
- https://github.com/multica-ai/andrej-karpathy-skills
