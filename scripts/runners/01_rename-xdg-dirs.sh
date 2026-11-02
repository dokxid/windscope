#!/usr/bin/env bash
set -euo pipefail

# Renames localized XDG user dirs (e.g. German) to their English equivalents
# for consistency, then regenerates user-dirs.dirs via xdg-user-dirs-update.

declare -A XDG_DIR_MAP=(
  ["Schreibtisch"]="Desktop"
  ["Dokumente"]="Documents"
  ["Musik"]="Music"
  ["Bilder"]="Pictures"
  ["Öffentlich"]="Public"
  ["Vorlagen"]="Templates"
  ["Videos"]="Videos"
  ["Downloads"]="Downloads"
)

processed_count=0

for old_name in "${!XDG_DIR_MAP[@]}"; do
  new_name="${XDG_DIR_MAP[$old_name]}"
  old_path="$HOME/$old_name"
  new_path="$HOME/$new_name"

  if [ "$old_name" = "$new_name" ]; then
    continue
  fi

  echo "Processing: $old_name -> $new_name"

  if [ -d "$old_path" ]; then
    if [ -e "$new_path" ]; then
      echo "Skipping $old_path -> $new_path: target already exists."
      continue
    fi
    echo "Renaming $old_path -> $new_path"
    mv "$old_path" "$new_path"
    processed_count=$((processed_count + 1))
  fi
done

echo "Processed $processed_count director$([ "$processed_count" -eq 1 ] && echo y || echo ies)."

if command -v xdg-user-dirs-update >/dev/null 2>&1; then
  echo "Regenerating user-dirs.dirs..."
  LC_ALL=C xdg-user-dirs-update --force
else
  echo "xdg-user-dirs-update not found; skipping config regeneration."
fi

FMT_BOLD="\033[1m"
FMT_RESET="\033[0m"
echo "${FMT_BOLD}HINT${FMT_RESET}: please reboot for consistency"
