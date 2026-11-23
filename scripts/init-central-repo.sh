#!/usr/bin/env bash
# One-time: replace the YOUR_ORG placeholder with your GitHub user/org name.
# Usage: ./scripts/init-central-repo.sh my-github-name
set -euo pipefail
OWNER="${1:?usage: $0 <github-user-or-org>}"
grep -rl "YOUR_ORG" --exclude-dir=.git --exclude=init-central-repo.sh . | xargs sed -i.bak "s/YOUR_ORG/${OWNER}/g"
find . -name "*.bak" -delete
echo "Done. Now: git add -A && git commit -m 'init' && git push && git tag v1 && git push origin v1"
