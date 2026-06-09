# bainary-skill CLI for Windows (PowerShell)
# Usage: powershell -File bainary-skill.ps1 <command>
#
# Install globally:       irm https://raw.githubusercontent.com/BainaryTD/bainary-skill/main/install.ps1 | iex
# Install project-local:  (see install.ps1 --local)

param([string]$Command = "help", [string]$Mode = "local")

$BAINARY_DIR = ".bainary"
$SKILL_REPO  = "https://github.com/BainaryTD/bainary-skill"
$RAW_REPO    = "https://raw.githubusercontent.com/BainaryTD/bainary-skill/main"

function Write-Info    { param($msg) Write-Host "[bainary-skill] $msg" -ForegroundColor Cyan }
function Write-Success { param($msg) Write-Host "[bainary-skill] $msg" -ForegroundColor Green }
function Write-Warn    { param($msg) Write-Host "[bainary-skill] $msg" -ForegroundColor Yellow }
function Write-Err     { param($msg) Write-Host "[bainary-skill] $msg" -ForegroundColor Red; exit 1 }

function Fetch { param($url, $dest) Invoke-RestMethod -Uri $url -OutFile $dest }

# ── Detect project-local ─────────────────────────────────────────────────────
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$IsLocal   = ($ScriptDir -eq (Join-Path (Get-Location) "bin")) -or
             ($ScriptDir -eq (Join-Path (Get-Location) "scripts"))

# ── Commands ──────────────────────────────────────────────────────────────────

function cmd_learn {
    Write-Info "Starting project discovery..."
    New-Item -ItemType Directory -Force -Path $BAINARY_DIR | Out-Null

    foreach ($file in @("project-knowledge.md","architecture.md","patterns.md","conventions.md","session-handoff.md")) {
        $dest = "$BAINARY_DIR\$file"
        if (-not (Test-Path $dest)) {
            Write-Info "Creating $dest from template..."
            Fetch "$RAW_REPO/templates/.bainary/$file" $dest
        } else {
            Write-Warn "$dest already exists, skipping"
        }
    }

    Write-Info "Installing CLI instruction files..."
    Fetch "$RAW_REPO/adapters/claude/CLAUDE.md"     "CLAUDE.md"
    Fetch "$RAW_REPO/adapters/codex/AGENTS.md"      "AGENTS.md"
    Fetch "$RAW_REPO/adapters/cursor/.cursorrules"   ".cursorrules"
    Fetch "$RAW_REPO/adapters/cursor/CURSOR.md"     "CURSOR.md"
    Fetch "$RAW_REPO/adapters/aider/CONVENTIONS.md" "CONVENTIONS.md"

    # Set last updated date
    $date = Get-Date -Format "yyyy-MM-dd HH:mm"
    foreach ($file in @("project-knowledge.md","session-handoff.md")) {
        $path = "$BAINARY_DIR\$file"
        if (Test-Path $path) {
            (Get-Content $path) -replace "<!-- DATE -->", $date |
                Set-Content $path
        }
    }

    Write-Success "Done! Fill in .bainary\ files with your project context."
    Write-Host ""
    Write-Host "  Next steps:"
    Write-Host "    1. Ask your AI to read .bainary\ and inspect source code for project style"
    Write-Host "    2. Edit .bainary\project-knowledge.md  — describe your project"
    Write-Host "    3. Edit .bainary\architecture.md       — document key decisions"
    Write-Host "    4. Edit .bainary\conventions.md        — define naming rules"
    Write-Host "    5. Before ending each AI chat, update .bainary\session-handoff.md"
    if ($IsLocal) {
        Write-Host "    6. Run: powershell -File .\bin\bainary-skill.ps1 update"
    } else {
        Write-Host "    6. Run: bainary-skill update"
    }
}

function cmd_update {
    Write-Info "Refreshing CLI instruction files from latest skill version..."
    if (-not (Test-Path $BAINARY_DIR)) {
        Write-Err "No .bainary\ directory found. Run 'bainary-skill learn' first."
    }

    foreach ($file in @("project-knowledge.md","architecture.md","patterns.md","conventions.md","session-handoff.md")) {
        $dest = "$BAINARY_DIR\$file"
        if (-not (Test-Path $dest)) {
            Write-Info "Creating missing $dest from template..."
            Fetch "$RAW_REPO/templates/.bainary/$file" $dest
        }
    }

    Fetch "$RAW_REPO/adapters/claude/CLAUDE.md"     "CLAUDE.md"
    Fetch "$RAW_REPO/adapters/codex/AGENTS.md"      "AGENTS.md"
    Fetch "$RAW_REPO/adapters/cursor/.cursorrules"   ".cursorrules"
    Fetch "$RAW_REPO/adapters/cursor/CURSOR.md"     "CURSOR.md"
    Fetch "$RAW_REPO/adapters/aider/CONVENTIONS.md" "CONVENTIONS.md"

    # Update timestamp
    $date = Get-Date -Format "yyyy-MM-dd HH:mm"
    foreach ($file in @("project-knowledge.md","session-handoff.md")) {
        $path = "$BAINARY_DIR\$file"
        if (Test-Path $path) {
            (Get-Content $path) -replace "Last updated: .*", "Last updated: $date" -replace "<!-- DATE -->", $date |
                Set-Content $path
        }
    }

    Write-Success "Updated! Remember to manually update .bainary\ if architecture changed."
}

function cmd_status {
    Write-Info "bainary-skill status"
    if ($IsLocal) {
        Write-Host "  (project-local install)" -ForegroundColor Yellow
    } else {
        Write-Host "  (global install)" -ForegroundColor Green
    }
    Write-Host ""

    if (-not (Test-Path $BAINARY_DIR)) {
        Write-Warn ".bainary\ not found — run 'bainary-skill learn' to initialize"
        return
    }

    Write-Host "Knowledge files:" -ForegroundColor White
    foreach ($file in @("project-knowledge.md","architecture.md","patterns.md","conventions.md","session-handoff.md")) {
        $path = "$BAINARY_DIR\$file"
        if (Test-Path $path) {
            $lines    = (Get-Content $path).Count
            $modified = (Get-Item $path).LastWriteTime.ToString("yyyy-MM-dd HH:mm")
            Write-Host "  [OK] $file  ($lines lines, modified: $modified)" -ForegroundColor Green
        } else {
            Write-Host "  [X] $file  (missing)" -ForegroundColor Red
        }
    }

    Write-Host ""
    Write-Host "CLI instruction files:" -ForegroundColor White
    foreach ($file in @("CLAUDE.md","AGENTS.md",".cursorrules","CURSOR.md","CONVENTIONS.md")) {
        if (Test-Path $file) {
            Write-Host "  [OK] $file" -ForegroundColor Green
        } else {
            Write-Host "  [-] $file  (not installed)" -ForegroundColor Yellow
        }
    }
}

function cmd_install {
    if ($Mode -eq "global") {
        Write-Info "Running global installer..."
        Invoke-Expression (Invoke-RestMethod "$RAW_REPO/install.ps1")
    } else {
        Write-Info "Running project-local installer..."
        $script = Invoke-RestMethod "$RAW_REPO/install.ps1"
        & ([scriptblock]::Create($script)) --local
    }
}

function cmd_help {
    Write-Host "bainary-skill — Web Development Base Skill v0.2.1" -ForegroundColor White
    Write-Host ""
    Write-Host "Usage: bainary-skill <command> [options]"
    Write-Host ""
    Write-Host "Commands:"
    Write-Host "  learn              Initialize .bainary\ knowledge + install CLI instruction files"
    Write-Host "  update             Refresh CLI files from latest skill version"
    Write-Host "  status             Show knowledge state and installed files"
    Write-Host "  install [global]   Re-install this CLI (default: project-local)"
    Write-Host "  help               Show this help"
    Write-Host ""
    Write-Host "Installation (Windows / PowerShell):"
    Write-Host ""
    Write-Host "  # Global (available everywhere):"
    Write-Host "  irm https://raw.githubusercontent.com/BainaryTD/bainary-skill/main/install.ps1 | iex"
    Write-Host ""
    Write-Host "  # Project-local (.\bin\bainary-skill.ps1):"
    Write-Host "  irm https://raw.githubusercontent.com/BainaryTD/bainary-skill/main/install.ps1 -OutFile install.ps1"
    Write-Host "  .\install.ps1 --local"
    Write-Host ""
    Write-Host "  Project: $SKILL_REPO"
}

# ── Router ────────────────────────────────────────────────────────────────────
switch ($Command.ToLower()) {
    "learn"               { cmd_learn }
    "update"              { cmd_update }
    "status"              { cmd_status }
    "install"             { cmd_install }
    { $_ -in "help","--help","-h" } { cmd_help }
    default               { Write-Err "Unknown command: $Command. Run 'bainary-skill help' for usage." }
}
