# bainary-skill

> Web Development Base Skill with Project Learning & Multi-CLI Support

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-0.2.0-blue.svg)](CHANGELOG.md)

---

## What is bainary-skill?

`bainary-skill` เป็น foundational skill สำหรับ web development ที่:

- 🧠 **เรียนรู้ project ของคุณ** ก่อน generate code ทุกครั้ง
- 🔄 **รักษา knowledge** ข้ามหลาย session
- 🤖 **รองรับทุก AI CLI** — Claude Code, Cursor, Codex, Grok, Aider

สร้างบน Karpathy's core principles:

| Principle | ความหมาย |
|-----------|----------|
| **Think Before Coding** | วิเคราะห์และวางแผนก่อนเขียนโค้ด |
| **Simplicity First** | เลือก solution ที่ง่ายและ maintain ได้ |
| **Surgical Changes** | แก้แค่ที่จำเป็น ไม่แตะโค้ดที่ไม่เกี่ยว |
| **Goal-Driven Execution** | ทุก change ต้องมี verifiable goal |

---

## Installation

### 🪟 Windows — ไม่ต้องใช้ WSL หรือ bash

#### CMD.exe

**Project-local install** (เฉพาะ project นั้น):

```cmd
cd your-project
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/BainaryTD/bainary-skill/main/install.cmd -OutFile install.cmd; .\install.cmd --local"
```

ใช้งาน:

```cmd
.\bin\bainary-skill.cmd learn
.\bin\bainary-skill.cmd update
.\bin\bainary-skill.cmd status
```

#### PowerShell

**Global install** (ใช้ได้ทุก project):

```powershell
irm https://raw.githubusercontent.com/BainaryTD/bainary-skill/main/install.ps1 | iex
```

**Project-local install** (เฉพาะ project นั้น):

```powershell
cd your-project
irm https://raw.githubusercontent.com/BainaryTD/bainary-skill/main/install.ps1 -OutFile install.ps1
.\install.ps1 -Local
```

ใช้งาน (หลัง global install):

```powershell
bainary-skill learn
bainary-skill update
bainary-skill status
```

ใช้งาน (project-local):

```powershell
.\bin\bainary-skill.cmd learn
# หรือถ้ามี package.json:
npm run bainary -- learn
```

---

### 🐧 macOS / Linux (bash)

### 🌍 Global Install (แนะนำสำหรับใช้ข้าม project)

```bash
curl -sL https://raw.githubusercontent.com/BainaryTD/bainary-skill/main/install.sh | bash
```

ใช้ได้ทุกที่ในเครื่อง:

```bash
bainary-skill learn
bainary-skill update
bainary-skill status
```

---

### 📁 Project-Local Install (เฉพาะ project นั้น)

```bash
cd your-project
curl -sL https://raw.githubusercontent.com/BainaryTD/bainary-skill/main/install.sh | bash -s -- --local
```

ติดตั้งที่ `./bin/bainary-skill` และ auto-add npm script (ถ้ามี `package.json`):

```bash
./bin/bainary-skill learn

# หรือถ้ามี package.json:
npm run bainary -- learn
```

> **ทำไมต้อง project-local?**
> - ไม่ต้องติดตั้ง global บนทุกเครื่อง
> - แต่ละ project ใช้ version ที่ตัวเองต้องการได้
> - ทำงานได้ใน CI/CD โดยไม่ต้อง pre-install

---

### ⚡ npx (ไม่ต้อง install เลย)

```bash
npx github:BainaryTD/bainary-skill learn
```

---

## Quick Start

### 1. ติดตั้ง

**Windows CMD.exe:**
```cmd
# Project-local
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/BainaryTD/bainary-skill/main/install.cmd -OutFile install.cmd; .\install.cmd --local"
```

**Windows PowerShell:**
```powershell
# Global
irm https://raw.githubusercontent.com/BainaryTD/bainary-skill/main/install.ps1 | iex

# หรือ project-local
irm https://raw.githubusercontent.com/BainaryTD/bainary-skill/main/install.ps1 -OutFile install.ps1
.\install.ps1 -Local
```

**macOS / Linux:**
```bash
# Global
curl -sL https://raw.githubusercontent.com/BainaryTD/bainary-skill/main/install.sh | bash

# หรือ project-local
curl -sL https://raw.githubusercontent.com/BainaryTD/bainary-skill/main/install.sh | bash -s -- --local
```

### 2. Initialize project

```bash
cd your-web-project
bainary-skill learn        # หรือ ./bin/bainary-skill learn (project-local)
```

### 3. กรอก knowledge files

```
.bainary/
├── project-knowledge.md   ← อธิบาย project ของคุณ
├── architecture.md        ← key design decisions
├── patterns.md            ← code patterns ที่ใช้
└── conventions.md         ← naming & folder rules
```

### 4. เปิด AI CLI แล้วเริ่มโค้ดได้เลย

```bash
claude        # Claude Code
codex         # Codex
cursor .      # Cursor IDE
aider         # Aider
```

---

## CLI Commands

| Command | Description |
|---------|-------------|
| `bainary-skill learn` | สร้าง `.bainary/` + ติดตั้ง CLI instruction files |
| `bainary-skill update` | Refresh CLI files จาก latest skill version |
| `bainary-skill status` | แสดงสถานะ knowledge files และ CLI files |
| `bainary-skill install` | ติดตั้งใหม่ (project-local) |
| `bainary-skill install --global` | ติดตั้งใหม่แบบ global |

---

## Supported AI CLIs

| CLI | File ที่ติดตั้ง | Status |
|-----|---------------|--------|
| Claude Code | `CLAUDE.md` | ✅ |
| Cursor | `.cursorrules` + `CURSOR.md` | ✅ |
| Codex | `AGENTS.md` | ✅ |
| Grok | `AGENTS.md` | ✅ |
| Aider | `CONVENTIONS.md` | ✅ |

---

## Project Knowledge System

หลังจาก `bainary-skill learn` project จะมี `.bainary/` directory:

```
.bainary/
├── project-knowledge.md   # Overview, tech stack, entry points
├── architecture.md        # Architecture decisions + data flow
├── patterns.md            # Code patterns (fetching, state, forms ฯลฯ)
└── conventions.md         # Naming, folder structure, commit style
```

AI CLI ทุกตัวจะอ่านไฟล์เหล่านี้ก่อนเขียนโค้ด — ทำให้ AI เข้าใจ project context ของคุณ

---

## Repository Structure

```
bainary-skill/
├── SKILL.md                        # Hermes skill definition
├── README.md                       # This file
├── CHANGELOG.md                    # Version history
├── package.json                    # npm/npx support
├── install.sh                      # Installer (macOS/Linux/WSL)
├── install.ps1                     # Installer (Windows PowerShell)
├── install.cmd                     # Installer wrapper (Windows CMD.exe)
│
├── scripts/
│   ├── bainary-skill               # CLI script (bash)
│   └── bainary-skill.ps1           # CLI script (PowerShell / Windows)
│
├── adapters/                       # Per-CLI instruction files
│   ├── claude/CLAUDE.md
│   ├── cursor/.cursorrules
│   ├── cursor/CURSOR.md
│   ├── codex/AGENTS.md
│   ├── grok/AGENTS.md
│   ├── aider/CONVENTIONS.md
│   └── web-project/README.md
│
└── templates/
    ├── .bainary/                   # Project knowledge templates
    │   ├── project-knowledge.md
    │   ├── architecture.md
    │   ├── patterns.md
    │   └── conventions.md
    └── web-project/               # Web project starter files
        ├── package.json
        └── .gitignore
```

---

## License

MIT © [Bainary](https://github.com/BainaryTD)
