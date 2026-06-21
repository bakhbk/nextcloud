#!/bin/bash
# Nextcloud setup script - creates required directories and starts containers
# Only tested on macOS. May not work on other systems.

set -e

if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "Error: This script is only tested on macOS."
    echo "It may not work on other systems (Linux, Windows, etc.)."
    exit 1
fi

echo "Creating directories..."
mkdir -p "$HOME/.nextcloud/db" "$HOME/.nextcloud/system" /Volumes/hss/nextcloud/userdata

echo "Checking .env file..."
if [ ! -s .env ]; then
    echo ".env not found or empty, copying from .env.example..."
    cp .env.example .env
    # Replace ~ with $HOME
    sed -i '' "s|~/.nextcloud|$HOME/.nextcloud|g" .env
    # Replace <your_lan_ip> with actual LAN IP
    LAN_IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null)
    if [ -n "$LAN_IP" ]; then
        sed -i '' "s|<your_lan_ip>|$LAN_IP|g" .env
        echo "LAN IP detected: $LAN_IP"
    fi
fi

# Replace placeholder passwords with random ones
if grep -q '<your_admin_password>' .env; then
    ADMIN_PASS=$(openssl rand -hex 16)
    sed -i '' "s|<your_admin_password>|$ADMIN_PASS|" .env
    echo "Admin password generated: $ADMIN_PASS"
fi
if grep -q '<your_root_password>' .env; then
    ROOT_PASS=$(openssl rand -hex 16)
    sed -i '' "s|<your_root_password>|$ROOT_PASS|" .env
    echo "Root password generated: $ROOT_PASS"
fi
if grep -q '<your_nc_password>' .env; then
    NC_PASS=$(openssl rand -hex 16)
    sed -i '' "s|<your_nc_password>|$NC_PASS|" .env
    echo "Nextcloud password generated: $NC_PASS"
fi
