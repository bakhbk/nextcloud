#!/bin/bash
# Add LAN IP to Nextcloud trusted_domains

set -e

# Detect OS and get LAN IP
OS=$(uname -s)
if [ "$OS" = "Darwin" ]; then
    # macOS
    LAN_IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null)
elif [ "$OS" = "Linux" ]; then
    # Linux
    LAN_IP=$(hostname -I 2>/dev/null | awk '{print $1}')
fi

if [ -n "$LAN_IP" ]; then
    echo "Adding trusted domain: $LAN_IP:8080"
    docker compose exec app php occ config:system:set trusted_domains 1 --value="$LAN_IP:8080" || true
else
    echo "Warning: Could not detect LAN IP"
fi
