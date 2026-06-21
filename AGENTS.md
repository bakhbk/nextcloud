# Nextcloud — Project Index

## Overview
Nextcloud via Docker Compose: MariaDB + Nextcloud + Redis. Port: 8080 (HTTP). Data stored on host and in Docker volumes.

## Quick Start
```bash
make setup                                    # prepare: directories, .env, passwords
make up                                       # start containers
# → http://localhost:8080  — Nextcloud web interface (initial setup)
```

## Working Rules
- **Public project** — never commit/transmit real credentials, IPs, configs, API keys, tokens, certificates, or private keys. Use placeholders only.
- **No host exposure** — never expose host paths, Docker volume names, or internal network details. All examples must be generic and non-functional.
- **No data deletion** — never execute `rm -rf` on user data paths. Provide commands instead and ask for confirmation.
- **Self-update** — immediately update AGENTS.md when repository files change.

## Quick Start
- Passwords in `.env` — change before first run.
- `docker compose down -v` — remove volumes (clean DB).
- For production: add reverse proxy (Caddy/Nginx) + SSL.
