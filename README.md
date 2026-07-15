# bainary-skill

> Web Development Base Skill with Project Learning & Multi-CLI Support

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-0.3.0-blue.svg)](CHANGELOG.md)

> **AI ไม่ควรเริ่มโปรเจกต์ใหม่ทุกครั้งที่เปิดแชท**
>
> `bainary-skill` เปลี่ยน AI จากผู้ช่วยที่จำอะไรไม่ได้ ให้กลายเป็น teammate ที่รู้ว่าโปรเจกต์นี้ใช้ pattern อะไร, architecture อยู่ตรงไหน และครั้งที่แล้วค้างอะไรไว้ — ก่อนจะเขียนโค้ดแม้แต่บรรทัดเดียว
>
> **เรียนรู้ก่อนเขียน · จำ context ข้ามแชท · แก้เท่าที่จำเป็น · ไม่สร้างหนี้ให้ทีม**

---

## ทำไมต้อง Bainary?

เพราะการบอก AI แค่ว่า “ช่วยเขียนเว็บให้หน่อย” แล้วหวังว่ามันจะเข้าใจทั้งระบบ
ไม่ใช่ software architecture — มันคือการโยนเหรียญ

`bainary-skill` บังคับ workflow ที่ควรเป็นเรื่องปกติให้เกิดขึ้นจริง:

| ปัญหาที่เจอบ่อย | Bainary จัดการให้ |
|---|---|
| AI เปิดแชทใหม่แล้วลืมทุกอย่าง | `.bainary/session-handoff.md` เชื่อมงานข้าม session |
| AI เขียนไม่เข้ากับ codebase | อ่าน patterns, conventions และ source code ก่อน |
| แก้ bug แล้วสร้าง bug ใหม่ข้าง ๆ | Think Before Coding + Surgical Changes |
| โปรเจกต์เล็กแต่ได้ abstraction 17 ชั้น | เปิด `minimal` mode เมื่ออยากให้ AI ใจเย็นลง |
| เปลี่ยน AI CLI แล้วต้องเริ่ม setup ใหม่ | ใช้ knowledge ชุดเดียวกับ Claude, Codex, Cursor, Grok และ Aider |

**นี่ไม่ใช่ prompt ยาว ๆ ที่แปะแล้วลืม** — มันเป็น skill package + CLI + project knowledge system ที่ติดตั้งและอัปเดตได้จริง

---

## จุดเด่นแบบไม่ต้องถ่อมตัว

- 🧠 **AI อ่านโปรเจกต์ก่อนแตะโค้ด** — ไม่เดา architecture จากชื่อโฟลเดอร์
- 🧬 **Project memory ที่ commit ได้** — ความรู้ไม่ได้หายไปพร้อมกับหน้าต่างแชท
- 🔁 **Continuity loop อัตโนมัติ** — งานวันนี้กลายเป็น context ของพรุ่งนี้
- 🧹 **Surgical changes** — ลดไฟล์ที่แตะ ลดโค้ดที่ไม่จำเป็น ลดโอกาสสร้างปัญหาใหม่
- 🪶 **Minimal-change mode แบบเรียกใช้ได้** — ได้แนวคิด Ponytail โดยไม่บังคับใช้ทุก response
- 🌍 **Multi-CLI ตั้งแต่ต้น** — ไม่ lock-in กับ agent ตัวเดียว
- 🛡️ **Minimal ไม่ได้แปลว่าประมาท** — validation, security, accessibility และ error handling ยังอยู่ครบ

---


## What is bainary-skill?

`bainary-skill` เป็น foundational skill สำหรับ web development ที่:

- 🧠 **เรียนรู้ project ของคุณ** ก่อน generate code ทุกครั้ง
- 🎨 **จับ project style/code patterns** จาก codebase จริงในแชทแรก
- 🔄 **รักษา knowledge** ข้ามหลาย session
- 🧾 **บันทึก session handoff** หลังคุยกับ AI เสร็จ เพื่อเปิดแชทใหม่แล้วต่อเนื่อง
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

### 3. กรอก knowledge files / ให้ AI เรียนรู้ project style

```
.bainary/
├── project-knowledge.md   ← อธิบาย project ของคุณ
├── session-handoff.md     ← สรุปแชทล่าสุด + next steps เพื่อเปิดแชทใหม่ต่อเนื่อง
├── architecture.md        ← key design decisions
├── patterns.md            ← code patterns ที่ใช้
└── conventions.md         ← naming & folder rules
```

ในแชทแรกของ AI ให้ใช้ prompt นี้ก่อนสั่งเขียนโค้ด:

```text
Read .bainary/project-knowledge.md, .bainary/session-handoff.md,
.bainary/architecture.md, .bainary/patterns.md, and .bainary/conventions.md.
Then inspect the existing source code to learn this project's coding style,
folder structure, naming conventions, component/API patterns, testing style,
and dependencies. Update .bainary/patterns.md, .bainary/conventions.md,
and .bainary/project-knowledge.md with missing findings before coding.
```

ก่อนจบแชทกับ AI ให้ใช้ prompt นี้:

```text
Before finishing, update .bainary/session-handoff.md with the current focus,
what changed, decisions made, files touched, risks, and next steps. Move any
stable new style/convention/pattern knowledge into .bainary/patterns.md,
.bainary/conventions.md, or .bainary/architecture.md so the next AI chat can continue.
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
| `bainary-skill learn` | สร้าง `.bainary/` + `session-handoff.md` + ติดตั้ง CLI instruction files |
| `bainary-skill update` | Refresh CLI files จาก latest skill version |
| `bainary-skill status` | แสดงสถานะ knowledge files และ CLI files |
| `bainary-skill mode minimal` | เปิด optional minimal-change/Ponytail mode สำหรับ project นี้ |
| `bainary-skill mode normal` | ปิด mode เสริมและกลับสู่การทำงานปกติ |
| `bainary-skill mode status` | แสดง mode ปัจจุบัน |
| `bainary-skill install` | ติดตั้งใหม่ (project-local) |
| `bainary-skill install --global` | ติดตั้งใหม่แบบ global |

ถ้า project มีไฟล์ `CLAUDE.md`, `AGENTS.md`, `.cursorrules`, `CURSOR.md` หรือ
`CONVENTIONS.md` อยู่แล้ว `learn`/`update` จะไม่เขียนทับโดยอัตโนมัติ ให้ใช้
`--force` เฉพาะเมื่อต้องการแทนที่ instruction file เหล่านั้นโดยตั้งใจ:

```bash
bainary-skill update --force
```

แต่ละ project จะมี `.bainary/skill-version` เพื่อบอกเวอร์ชันของ skill ที่ใช้ล่าสุด
โดยคำสั่ง `update` จะอัปเดตไฟล์นี้ แต่จะไม่เขียนทับ knowledge files เดิม

### Optional minimal-change mode

โหมดนี้เป็นแนวคิดจาก Ponytail สำหรับงานที่ต้องการลด over-engineering, dependency,
boilerplate และการแก้โค้ดเกินขอบเขต โดย **ไม่ได้เปิดใช้อัตโนมัติ**:

```bash
bainary-skill mode minimal
# ทำงาน coding ที่ต้องการความ minimal
bainary-skill mode normal
```

โหมดนี้ยังห้ามลดทอน validation, security, accessibility, error handling,
การป้องกัน data loss หรือ requirement ที่ระบุชัดเจน

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
├── session-handoff.md     # Last chat summary, decisions, risks, next steps
├── architecture.md        # Architecture decisions + data flow
├── patterns.md            # Code patterns (fetching, state, forms ฯลฯ)
└── conventions.md         # Naming, folder structure, commit style
```

AI CLI ทุกตัวจะอ่านไฟล์เหล่านี้ก่อนเขียนโค้ด — ทำให้ AI เข้าใจ project context ของคุณ

### Continuity Loop

1. **เริ่มโปรเจกต์ / เปิดแชทใหม่:** ให้ AI อ่าน `.bainary/` ทั้งหมดก่อน
2. **ถ้า style ยังว่าง:** ให้ AI inspect codebase แล้วเติม `patterns.md` + `conventions.md`
3. **ระหว่างทำงาน:** ถ้ามี decision หรือ pattern ใหม่ ให้บันทึกใน `.bainary/`
4. **ก่อนจบแชท:** ให้ AI update `session-handoff.md` เพื่อให้แชทถัดไปต่อได้ทันที

### Automatic Project Learning

AI CLI ที่ใช้ instruction ของ `bainary-skill` จะถูกกำหนดให้ update project handoff เองหลังจบงานที่มีสาระสำคัญ โดยไม่ต้องรอให้ user พิมพ์เตือนว่า "เรียนรู้สิ่งนี้" หรือ "update handoff"

ก่อน final response ของงาน coding/debugging/design/refactor/documentation ให้ AI:

- update `.bainary/session-handoff.md` ด้วยสิ่งที่เปลี่ยนใน session นี้, decisions, files touched, patterns ที่เรียนรู้, risks, และ next steps
- ย้ายความรู้ที่ stable/reusable ไปยัง `.bainary/patterns.md`, `.bainary/conventions.md`, `.bainary/architecture.md`, หรือ `.bainary/project-knowledge.md`
- ไม่บันทึก noise ชั่วคราว เช่น raw command output, failed attempts ที่แก้แล้ว, unrelated chat, secrets, tokens, หรือ `.env` values

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
    │   ├── session-handoff.md
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
