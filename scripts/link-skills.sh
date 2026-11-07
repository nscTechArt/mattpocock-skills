#!/usr/bin/env bash
set -euo pipefail

# Links every skill in this repo into the local skill directories used by each
# agent harness:
#   - ~/.claude/skills: Claude Code
#   - ~/.agents/skills: Codex and other Agent Skills-compatible harnesses
# Each entry is a symlink into this repo, so editing a skill here takes effect
# immediately. Symlinks left behind by skills that were since removed or
# renamed are cleaned up on each run.

REPO="$(cd "$(dirname "$0")/.." && pwd)"
DESTS=("$HOME/.claude/skills" "$HOME/.agents/skills")

names=()
srcs=()
while IFS= read -r -d '' skill_md; do
  src="$(dirname "$skill_md")"
  names+=("$(basename "$src")")
  srcs+=("$src")
done < <(find "$REPO/skills" -name SKILL.md -not -path '*/node_modules/*' -print0)

# Links are named by folder, so two skills with the same folder name in
# different buckets would silently overwrite each other. Refuse instead.
dupes="$(printf '%s\n' "${names[@]}" | sort | uniq -d)"
if [ -n "$dupes" ]; then
  echo "error: duplicate skill folder names, links would overwrite each other:" >&2
  while IFS= read -r d; do
    for i in "${!names[@]}"; do
      [ "${names[$i]}" = "$d" ] && echo "  $d -> ${srcs[$i]}" >&2
    done
  done <<< "$dupes"
  exit 1
fi

for DEST in "${DESTS[@]}"; do
  # If $DEST is a symlink that resolves into this repo, we'd end up writing the
  # per-skill symlinks back into the repo's own skills/ tree. Detect and bail
  # out instead of polluting the working copy.
  if [ -L "$DEST" ]; then
    resolved="$(readlink -f "$DEST")"
    case "$resolved" in
      "$REPO"|"$REPO"/*)
        echo "error: $DEST is a symlink into this repo ($resolved)." >&2
        echo "Remove it (rm \"$DEST\") and re-run; the script will recreate it as a real dir." >&2
        exit 1
        ;;
    esac
  fi

  mkdir -p "$DEST"

  # Remove dangling symlinks that point into this repo. Links pointing
  # elsewhere are not ours and are left alone.
  for link in "$DEST"/*; do
    [ -L "$link" ] && [ ! -e "$link" ] || continue
    case "$(readlink "$link")" in
      "$REPO"/*)
        rm "$link"
        echo "removed stale $(basename "$link") ($DEST)"
        ;;
    esac
  done

  for i in "${!names[@]}"; do
    name="${names[$i]}"
    src="${srcs[$i]}"
    target="$DEST/$name"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
      rm -rf "$target"
    fi

    ln -sfn "$src" "$target"
    echo "linked $name -> $src ($DEST)"
  done
done
