# bainary-skill

> Web Development Base Skill with Project Learning & Multi-CLI Support

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-0.2.0-blue.svg)](CHANGELOG.md)

## What is this?

`bainary-skill` is a foundational skill for web development that:
- **Learns your project** before generating code
- **Maintains knowledge** across multiple sessions
- **Works with every AI CLI** — Claude Code, Cursor, Codex, Grok, Aider

Built on Karpathy's core principles: **Think Before Coding**, **Simplicity First**, **Surgical Changes**, **Goal-Driven Execution**.

## Quick Start

### 1. Install the CLI

```bash
curl -sL https://raw.githubusercontent.com/BainaryTD/bainary-skill/main/scripts/bainary-skill \
  -o /usr/local/bin/bainary-skill && chmod +x /usr/local/bin/bainary-skill
```

### 2. Initialize your project

```bash
cd your-web-project
bainary-skill learn
```

### 3. Fill in the knowledge files

```
.bainary/
├── project-knowledge.md   ← describe your project
├── architecture.md        ← key design decisions
├── patterns.md            ← code patterns in use
└── conventions.md         ← naming & structure rules
```

### 4. Start coding with any AI CLI

```bash
# Claude Code
claude

# Codex
codex

# Cursor
cursor .

# Aider
aider
```

All of them will automatically load the correct instruction files.

## CLI Commands

| Command | Description |
|---------|-------------|
| `bainary-skill learn` | Initialize `.bainary/` + install CLI instruction files |
| `bainary-skill update` | Refresh CLI files from latest skill version |
| `bainary-skill status` | Show knowledge state and installed files |

## Supported AI CLIs

| CLI | File installed | Status |
|-----|---------------|--------|
| Claude Code | `CLAUDE.md` | ✅ |
| Cursor | `.cursorrules` + `CURSOR.md` | ✅ |
| Codex | `AGENTS.md` | ✅ |
| Grok | `AGENTS.md` | ✅ |
| Aider | `CONVENTIONS.md` | ✅ |

## Repository Structure

```
bainary-skill/
├── SKILL.md                    # Hermes skill definition
├── README.md                   # This file
├── CHANGELOG.md                # Version history
├── scripts/
│   └── bainary-skill           # CLI script
├── adapters/
│   ├── claude/CLAUDE.md        # Claude Code instructions
│   ├── cursor/.cursorrules     # Cursor rules
│   ├── cursor/CURSOR.md        # Cursor instructions
│   ├── codex/AGENTS.md         # Codex instructions
│   ├── grok/AGENTS.md          # Grok instructions
│   ├── aider/CONVENTIONS.md    # Aider conventions
│   └── web-project/            # web-project adapter docs
└── templates/
    ├── .bainary/               # Project knowledge templates
    │   ├── project-knowledge.md
    │   ├── architecture.md
    │   ├── patterns.md
    │   └── conventions.md
    └── web-project/            # Web project starter files
        ├── package.json
        └── .gitignore
```

## License

MIT — see [LICENSE](LICENSE) or [SKILL.md](SKILL.md)
