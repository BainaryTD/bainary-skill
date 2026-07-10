#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CLI="$ROOT_DIR/scripts/bainary-skill"
TMP_DIR="$(mktemp -d)"
SERVER_PID=""
cleanup() {
  [ -n "$SERVER_PID" ] && kill "$SERVER_PID" 2>/dev/null || true
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

PORT_FILE="$TMP_DIR/port"
python3 - "$ROOT_DIR" "$PORT_FILE" <<'PY' &
import functools
import http.server
import pathlib
import sys

root = pathlib.Path(sys.argv[1])
port_file = pathlib.Path(sys.argv[2])
class Handler(http.server.SimpleHTTPRequestHandler):
    def log_message(self, *_):
        pass
handler = functools.partial(Handler, directory=str(root))
server = http.server.ThreadingHTTPServer(("127.0.0.1", 0), handler)
port_file.write_text(str(server.server_address[1]))
server.serve_forever()
PY
SERVER_PID=$!
for _ in $(seq 1 50); do [ -s "$PORT_FILE" ] && break; sleep 0.1; done
PORT=$(cat "$PORT_FILE")
RAW="http://127.0.0.1:$PORT"

PROJECT="$TMP_DIR/project"
mkdir -p "$PROJECT"
(
  cd "$PROJECT"
  BAINARY_RAW_REPO="$RAW" "$CLI" learn >/dev/null
  test -f .bainary/skill-version
  test "$(tr -d '\r\n' < .bainary/skill-version)" = "0.2.2"
  test -f CLAUDE.md
  printf 'custom project instructions\n' > CLAUDE.md
  BAINARY_RAW_REPO="$RAW" "$CLI" update >/dev/null
  grep -Fx 'custom project instructions' CLAUDE.md >/dev/null
  BAINARY_RAW_REPO="$RAW" "$CLI" update --force >/dev/null
  grep -F 'Claude Code Instructions' CLAUDE.md >/dev/null
  BAINARY_RAW_REPO="$RAW" "$CLI" status >/dev/null
)

FAIL_PROJECT="$TMP_DIR/fail-project"
mkdir -p "$FAIL_PROJECT"
if (cd "$FAIL_PROJECT" && BAINARY_RAW_REPO="$RAW/not-found" "$CLI" learn >/dev/null 2>&1); then
  echo "expected download failure, but learn succeeded" >&2
  exit 1
fi

echo "CLI smoke tests passed"
