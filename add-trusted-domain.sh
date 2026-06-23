#!/bin/bash
# Add LAN IP to Nextcloud trusted_domains

set -e

LAN_IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null)

if [ -n "$LAN_IP" ]; then
    echo "Adding trusted domain: $LAN_IP:8080"
    docker compose exec app php occ config:system:set trusted_domains 1 --value="$LAN_IP:8080" || true
else
    echo "Warning: Could not detect LAN IP"
fi
