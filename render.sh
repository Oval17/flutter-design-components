#!/usr/bin/env bash
# One-command renderer for Flutter Reels.
# Installs deps and renders all 100 reels into ./videos as 10s MP4s.

set -e
cd "$(dirname "$0")"

echo "▶ Flutter Reels · bulk renderer"
echo

# 1) ffmpeg check
if ! command -v ffmpeg >/dev/null 2>&1; then
  echo "× ffmpeg not found."
  echo "  Install with:  brew install ffmpeg     (macOS)"
  echo "                 sudo apt install ffmpeg (Linux)"
  exit 1
fi
echo "✓ ffmpeg: $(ffmpeg -version | head -1)"

# 2) Node check
if ! command -v node >/dev/null 2>&1; then
  echo "× node not found. Install Node 18+ from https://nodejs.org"
  exit 1
fi
echo "✓ node:   $(node --version)"

# 3) Chrome check (macOS path)
CHROME_MAC="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
if [[ ! -x "$CHROME_MAC" ]] && [[ -z "$CHROME" ]]; then
  echo "⚠ Google Chrome not found at standard macOS path."
  echo "  Either install Chrome, or set CHROME=/path/to/chrome before running."
fi

# 4) Install puppeteer-core (small — uses system Chrome)
if [[ ! -d node_modules/puppeteer-core ]]; then
  echo "→ installing puppeteer-core..."
  npm install --silent puppeteer-core
fi
echo "✓ deps installed"
echo

# 5) Run renderer (forward any args, e.g. `./render.sh 0 4` for first 5)
node render.js "$@"
