#!/usr/bin/env bash
set -euo pipefail

REPO_REMOTE="${GITHUB_REMOTE:-origin}"
REPLIT_GIT_URL="${REPLIT_GIT_URL:-https://replit.com/@aiagentceo/Attached-Assets.git}"
WORKDIR="${WORKDIR:-.replit-import-tmp}"

printf '\n== AI CEO Holdings Replit Import ==\n'
printf 'Source: %s\n' "$REPLIT_GIT_URL"
printf 'Destination remote: %s\n\n' "$REPO_REMOTE"

if ! command -v git >/dev/null 2>&1; then
  echo "ERROR: git is required. Install Xcode Command Line Tools: xcode-select --install"
  exit 1
fi

if [ -d "$WORKDIR" ]; then
  echo "Removing previous import temp directory: $WORKDIR"
  rm -rf "$WORKDIR"
fi

echo "Cloning Replit source..."
if ! git clone "$REPLIT_GIT_URL" "$WORKDIR"; then
  cat <<'MSG'

ERROR: Could not clone the Replit project.

Fix options:
1. Open the Replit project in your browser.
2. Open Git / version-control settings.
3. Copy the exact Git remote URL Replit provides.
4. Re-run this script:

   REPLIT_GIT_URL="PASTE_REPLIT_GIT_URL_HERE" ./scripts/import-replit.sh

If Replit only allows export/download, download the ZIP, extract it, and copy the files into this repository manually.
MSG
  exit 1
fi

echo "Copying project files into current repo..."
rsync -av \
  --exclude '.git' \
  --exclude 'node_modules' \
  --exclude '.env' \
  --exclude '.env.*' \
  --exclude 'dist' \
  --exclude 'build' \
  "$WORKDIR"/ ./

echo "Cleaning temporary import directory..."
rm -rf "$WORKDIR"

echo "Import complete. Review changes:"
git status --short

cat <<'MSG'

Next commands:

  git add .
  git commit -m "Import Attached-Assets from Replit"
  git push origin main

Then test locally:

  npm install
  npm run dev
MSG
