# AI CEO Holdings — Replit Clone Workspace

This repository is the GitHub destination for cloning and self-hosting the Replit project.

## Source references

- Replit project: `https://replit.com/@aiagentceo/Attached-Assets`
- Current deployed reference URL: `https://fb16107e-a5de-456c-9f39-59bcce2a77c8-00-1srh6gf88kpcu.picard.replit.dev/`
- Public app URL previously provided: `https://attached-assets--aiagentceo.replit.app/`

## Current status

This repo has been initialized as the destination repo for the clone/import workflow.

The ChatGPT GitHub connector can write to this GitHub repository, but it cannot directly authenticate into Replit or download private Replit source code from `replit.com/@aiagentceo/Attached-Assets`. The actual Replit source must be imported from a local machine or Replit account session that has access to the project.

## Import from Replit

Run this from your Mac after confirming you can access the Replit project.

```bash
chmod +x scripts/import-replit.sh
./scripts/import-replit.sh
```

By default, the script attempts to clone:

```bash
https://replit.com/@aiagentceo/Attached-Assets.git
```

If Replit gives you a different Git URL, copy it from the Replit project Git/version-control settings and run:

```bash
REPLIT_GIT_URL="PASTE_REPLIT_GIT_URL_HERE" ./scripts/import-replit.sh
```

## Local development

After import:

```bash
npm install
npm run dev
```

Common local server URLs:

- `http://localhost:3000`
- `http://localhost:5173`

## Production build

```bash
npm run build
npm run preview
```

## Environment variables

Copy `.env.example` to `.env` and fill in only the integrations you intend to use.

```bash
cp .env.example .env
```

Never commit real API keys, Firebase credentials, Stripe secret keys, Airtable keys, Replit tokens, or other credentials.

## Implementation targets

1. Import source from Replit.
2. Verify package manager, scripts, and runtime port.
3. Normalize project structure for Mac self-hosting.
4. Replace Replit-specific assumptions with portable local configuration.
5. Add Docker support if the imported project does not already include it.
6. Add production deployment commands.
7. Edit branding/details for AI CEO Holdings.
