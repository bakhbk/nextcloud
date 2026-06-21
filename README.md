# Nextcloud Docker

Nextcloud via Docker Compose: MariaDB + Redis + Nextcloud. Port: 8080 (HTTP).

## Quick Start

```bash
make setup    # prepare: directories, .env, passwords
make up       # start containers
```

Open http://localhost:8080 — create admin account.

## Data Structure

- **Database** → `$HOME/.nextcloud/db` (SSD)
- **System files** → `$HOME/.nextcloud/system` (SSD)
- **User data** → `/Volumes/<your_storage>/nextcloud/userdata` (HDD) — change this path to your own storage location

## Rules

- Passwords in `.env` — change before first run
- `docker compose down -v` removes only Docker volumes, not host data
