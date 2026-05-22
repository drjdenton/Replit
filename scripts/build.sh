#!/usr/bin/env bash
set -euo pipefail

printf '\n== AI CEO Holdings Production Build ==\n\n'

if [ ! -f package.json ]; then
  echo "ERROR: package.json not found. Import the Replit source first."
  echo "Run: ./scripts/import-replit.sh"
  exit 1
fi

npm install
npm run build

echo "Build complete. Run the project preview or start command defined in package.json."
