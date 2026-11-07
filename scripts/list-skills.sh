#!/usr/bin/env bash
set -euo pipefail

# Lists every SKILL.md in the repo.
#   list-skills.sh          print the paths
#   list-skills.sh --check  compare against the root README's Reference
#                           section and report skills missing from it or
#                           listed there but absent on disk (exit 1 on drift)

REPO="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO"

on_disk() {
  find skills -name SKILL.md -not -path '*/node_modules/*' | sort
}

case "${1:-}" in
  "")
    on_disk
    ;;
  --check)
    listed="$(grep -oE '\(\./skills/[^)]+/SKILL\.md\)' README.md | tr -d '()' | sed 's|^\./||' | sort -u)"
    missing="$(comm -23 <(on_disk) <(printf '%s\n' "$listed"))"
    extra="$(comm -13 <(on_disk) <(printf '%s\n' "$listed"))"
    [ -n "$missing" ] && { echo "On disk but not in README.md:"; echo "$missing" | sed 's/^/  /'; }
    [ -n "$extra" ] && { echo "In README.md but not on disk:"; echo "$extra" | sed 's/^/  /'; }
    if [ -n "$missing$extra" ]; then exit 1; fi
    echo "README.md matches skills on disk ($(on_disk | wc -l) skills)."
    ;;
  *)
    echo "usage: $0 [--check]" >&2
    exit 2
    ;;
esac
