# Nextcloud — Project Index

## Overview
Nextcloud via Docker Compose: MariaDB + Redis + Nextcloud. Port: 8080 (HTTP). Data stored on host via bind mounts.

## Quick Start
```bash
make setup                                    # prepare: directories, .env, passwords
make up                                       # start containers
# → http://localhost:8080  — Nextcloud web interface (initial setup)
```

## Data Structure

| Component | Location | Purpose |
|-----------|----------|---------|
| Database | `~/.nextcloud/db` (SSD) | MariaDB data, persists across `down -v` |
| System files | `~/.nextcloud/system` (SSD) | Nextcore core/apps, persists across `down -v` |
| User data | `/Volumes/hss/nextcloud/userdata` (HDD) | User files, portable to any machine |

## Configuration

### docker-compose.yml
- **db**: MariaDB 10.6, bind-mounted to `${NEXTCLOUD_DB_DIR}`
- **app**: Nextcloud apache, system files bind-mounted to `${NEXTCLOUD_SYSTEM_DIR}`, user data to `${NEXTCLOUD_USER_DATA_DIR}`
- **redis**: Redis alpine (ephemeral, no persistence needed)

### Key Features
- `make setup` — creates directories, generates `.env`, random passwords
- `make up` — starts containers (trusted domains set via `.env`)
- Demo content disabled via `NC_skeletondirectory=`
- Data preserved on `docker compose down -v` (bind-mounts not deleted)

### Access Methods
- Local: `http://localhost:8080`
- LAN: `http://<your_lan_ip>:8080` (configured in `.env`)

## Working Rules
- **Public project** — never commit/transmit real credentials, IPs, configs, API keys, tokens, certificates, or private keys. Use placeholders only.
- **No host exposure** — never expose host paths, Docker volume names, or internal network details. All examples must be generic and non-functional.
- **No data deletion** — never execute `rm -rf` on user data paths. Provide commands instead and ask for confirmation.
- **Self-update** — immediately update AGENTS.md when repository files change.

## Notes
- Only tested on macOS (setup.sh checks OS)
- Bind mounts work via orbstack/Docker Desktop
- Database ~100MB-2GB, system files ~500MB
- User data on external HDD (preserved across restarts)
- LAN IP auto-detected by `setup.sh` and written to `.env`

## Context
- See `.context` for full history, decisions, and troubleshooting notes
- **Sensitive data** (passwords, IPs, paths) — store only in `.context`, never in AGENTS.md or other committed files
