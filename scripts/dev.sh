#!/usr/bin/env bash
set -euo pipefail

printf '\n== AI CEO Holdings Local Dev ==\n\n'

if ! command -v node >/dev/null 2>&1; then
  echo "ERROR: Node.js is required. Install current LTS from https://nodejs.org/"
  exit 1
fi

if [ ! -f package.json ]; then
  echo "ERROR: package.json not found. Import the Replit source first."
  echo "Run: ./scripts/import-replit.sh"
  exit 1
fi

if [ ! -d node_modules ]; then
  echo "Installing dependencies..."
  npm install
fi

echo "Starting development server..."
npm run dev
