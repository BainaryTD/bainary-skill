#!/usr/bin/env bash
# bainary-skill installer
# Supports: global install, project-local install
#
# Usage:
#   Global:        curl -sL https://raw.githubusercontent.com/BainaryTD/bainary-skill/main/install.sh | bash
#   Project-local: curl -sL https://raw.githubusercontent.com/BainaryTD/bainary-skill/main/install.sh | bash -s -- --local

set -e

SKILL_REPO="https://raw.githubusercontent.com/BainaryTD/bainary-skill/main"
SCRIPT_NAME="bainary-skill"
SCRIPT_URL="$SKILL_REPO/scripts/bainary-skill"

BOLD="\033[1m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"
RED="\033[0;31m"
NC="\033[0m"

info()    { echo -e "${BLUE}[install]${NC} $1"; }
success() { echo -e "${GREEN}[install]${NC} $1"; }
error()   { echo -e "${RED}[install]${NC} $1" >&2; exit 1; }

LOCAL=false

for arg in "$@"; do
  case $arg in
    --local) LOCAL=true ;;
    --global) LOCAL=false ;;
  esac
done

if [ "$LOCAL" = true ]; then
  # ── Project-local install ──────────────────────────────────────────────────
  TARGET_DIR="./bin"
  TARGET="$TARGET_DIR/$SCRIPT_NAME"

  info "Installing $SCRIPT_NAME locally to $TARGET ..."
  mkdir -p "$TARGET_DIR"
  curl -sL "$SCRIPT_URL" -o "$TARGET"
  chmod +x "$TARGET"

  # Add ./bin to .gitignore if not already there
  if [ -f ".gitignore" ]; then
    if ! grep -q "^/bin/$SCRIPT_NAME" .gitignore 2>/dev/null; then
      echo "/bin/$SCRIPT_NAME" >> .gitignore
      info "Added /bin/$SCRIPT_NAME to .gitignore"
    fi
  fi

  # Add npm script to package.json if it exists
  if [ -f "package.json" ] && command -v node &>/dev/null; then
    node - <<'EOF'
const fs = require('fs');
const pkg = JSON.parse(fs.readFileSync('package.json', 'utf8'));
if (!pkg.scripts) pkg.scripts = {};
if (!pkg.scripts['bainary']) {
  pkg.scripts['bainary'] = './bin/bainary-skill';
  fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2) + '\n');
  console.log('[install] Added "bainary" script to package.json');
}
EOF
  fi

  success "Installed locally! Usage:"
  echo ""
  echo "  ./bin/bainary-skill learn"
  echo "  ./bin/bainary-skill update"
  echo "  ./bin/bainary-skill status"
  echo ""
  echo "  Or via npm (if package.json was updated):"
  echo "  npm run bainary -- learn"

else
  # ── Global install ─────────────────────────────────────────────────────────
  if [ -w "/usr/local/bin" ]; then
    TARGET="/usr/local/bin/$SCRIPT_NAME"
  elif [ -d "$HOME/.local/bin" ]; then
    TARGET="$HOME/.local/bin/$SCRIPT_NAME"
    # Ensure ~/.local/bin is in PATH hint
    if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
      info "Note: add ~/.local/bin to your PATH if not already set"
    fi
  else
    mkdir -p "$HOME/.local/bin"
    TARGET="$HOME/.local/bin/$SCRIPT_NAME"
  fi

  info "Installing $SCRIPT_NAME globally to $TARGET ..."
  curl -sL "$SCRIPT_URL" -o "$TARGET"
  chmod +x "$TARGET"

  success "Installed globally! Usage:"
  echo ""
  echo "  bainary-skill learn"
  echo "  bainary-skill update"
  echo "  bainary-skill status"
fi
