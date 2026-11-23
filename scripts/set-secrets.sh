#!/usr/bin/env bash
# Push the CI secrets to many repos at once (personal accounts have no org-level secrets).
# Usage: SONAR_TOKEN=... SONAR_HOST_URL=... SNYK_TOKEN=... NVD_API_KEY=... ./scripts/set-secrets.sh owner/repo1 owner/repo2
set -euo pipefail
for repo in "$@"; do
  for name in SONAR_TOKEN SONAR_HOST_URL SNYK_TOKEN NVD_API_KEY; do
    if [ -n "${!name:-}" ]; then
      printf '%s' "${!name}" | gh secret set "$name" --repo "$repo"
      echo "set $name on $repo"
    fi
  done
done
