#!/usr/bin/env bash
# Publish the site: local Caddy (https://eunick.duckdns.org/) + GitHub Pages mirror.
set -euo pipefail
cd "$(dirname "$0")"
sudo rsync -a --delete --exclude .nojekyll docs/ /var/www/shorts-factory/
git add -A
git diff --cached --quiet || git commit -m "${1:-Update site}"
git push
echo "Deployed. Check: https://eunick.duckdns.org/"
