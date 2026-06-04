# bainary-skill installer for Windows (PowerShell)
# No WSL or bash required.
#
# Usage (PowerShell):
#   Global:        irm https://raw.githubusercontent.com/BainaryTD/bainary-skill/main/install.ps1 | iex
#   Project-local: irm https://raw.githubusercontent.com/BainaryTD/bainary-skill/main/install.ps1 -OutFile install.ps1; .\install.ps1 -Local
#
# Usage (CMD.exe):
#   powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/BainaryTD/bainary-skill/main/install.ps1 -OutFile install.ps1; powershell -ExecutionPolicy Bypass -File install.ps1 -Local"

param(
    [switch]$Local,
    [switch]$Global
)

$SKILL_REPO  = "https://raw.githubusercontent.com/BainaryTD/bainary-skill/main"
$SCRIPT_NAME = "bainary-skill.ps1"
$SCRIPT_URL  = "$SKILL_REPO/scripts/bainary-skill.ps1"

function Write-Info    { param($msg) Write-Host "[install] $msg" -ForegroundColor Cyan }
function Write-Success { param($msg) Write-Host "[install] $msg" -ForegroundColor Green }
function Write-Err     { param($msg) Write-Host "[install] $msg" -ForegroundColor Red; exit 1 }

# ── Decide install mode ──────────────────────────────────────────────────────
$isLocal = $Local.IsPresent
if (-not $isLocal -and -not $Global.IsPresent) {
    # Called via piped iex — default to global
    $isLocal = $false
}

if ($isLocal) {
    # ── Project-local install ────────────────────────────────────────────────
    $TargetDir = ".\bin"
    $Target    = "$TargetDir\$SCRIPT_NAME"

    Write-Info "Installing $SCRIPT_NAME locally to $Target ..."
    New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
    Invoke-RestMethod -Uri $SCRIPT_URL -OutFile $Target

    # Create a .cmd shim so `bin\bainary-skill.cmd` works from CMD.exe too
    $shimPath = "$TargetDir\bainary-skill.cmd"
    @"
@echo off
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0bainary-skill.ps1" %*
"@ | Set-Content $shimPath

    # Add to .gitignore
    if (Test-Path ".gitignore") {
        $ignore = Get-Content ".gitignore" -Raw
        if ($ignore -notmatch [regex]::Escape("/bin/$SCRIPT_NAME")) {
            Add-Content ".gitignore" "`n/bin/$SCRIPT_NAME"
            Write-Info "Added /bin/$SCRIPT_NAME to .gitignore"
        }
        if ($ignore -notmatch [regex]::Escape("/bin/bainary-skill.cmd")) {
            Add-Content ".gitignore" "/bin/bainary-skill.cmd"
            Write-Info "Added /bin/bainary-skill.cmd to .gitignore"
        }
    }

    # Add npm script to package.json
    if (Test-Path "package.json") {
        try {
            $pkg = Get-Content "package.json" -Raw | ConvertFrom-Json
            if (-not $pkg.scripts) { $pkg | Add-Member -NotePropertyName scripts -NotePropertyValue @{} }
            if (-not $pkg.scripts.bainary) {
                $pkg.scripts | Add-Member -NotePropertyName bainary -NotePropertyValue ".\bin\bainary-skill.cmd"
                $pkg | ConvertTo-Json -Depth 10 | Set-Content "package.json"
                Write-Info 'Added "bainary" script to package.json'
            }
        } catch { Write-Info "Could not update package.json (skipped)" }
    }

    Write-Success "Installed locally! Usage:"
    Write-Host ""
    Write-Host "  .\bin\bainary-skill.cmd learn"
    Write-Host "  .\bin\bainary-skill.cmd update"
    Write-Host "  .\bin\bainary-skill.cmd status"
    Write-Host ""
    Write-Host "  Or directly via PowerShell:"
    Write-Host "  powershell -File .\bin\bainary-skill.ps1 learn"
    Write-Host ""
    Write-Host "  Or via npm (if package.json was updated):"
    Write-Host "  npm run bainary -- learn"

} else {
    # ── Global install ───────────────────────────────────────────────────────
    # Install to %USERPROFILE%\bin (added to user PATH automatically)
    $GlobalBin = "$env:USERPROFILE\bin"
    $Target    = "$GlobalBin\$SCRIPT_NAME"

    New-Item -ItemType Directory -Force -Path $GlobalBin | Out-Null

    # Add to user PATH if missing
    $userPath = [Environment]::GetEnvironmentVariable("PATH", "User")
    if ($userPath -notlike "*$GlobalBin*") {
        [Environment]::SetEnvironmentVariable("PATH", "$userPath;$GlobalBin", "User")
        Write-Info "Added $GlobalBin to user PATH (restart terminal to take effect)"
    }

    Write-Info "Installing $SCRIPT_NAME globally to $Target ..."
    Invoke-RestMethod -Uri $SCRIPT_URL -OutFile $Target

    # Create a .cmd shim so `bainary-skill` works from CMD.exe too
    $shimPath = "$GlobalBin\bainary-skill.cmd"
    @"
@echo off
powershell -NoProfile -ExecutionPolicy Bypass -File "%USERPROFILE%\bin\bainary-skill.ps1" %*
"@ | Set-Content $shimPath

    Write-Success "Installed globally! Usage:"
    Write-Host ""
    Write-Host "  bainary-skill learn"
    Write-Host "  bainary-skill update"
    Write-Host "  bainary-skill status"
    Write-Host ""
    Write-Host "  (Restart your terminal if 'bainary-skill' is not found yet)"
}
