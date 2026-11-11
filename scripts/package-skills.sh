#!/usr/bin/env bash
# Packt jeden Skill als eigenes ZIP für den Upload in claude.ai
# ("Customize" → "Skills" → "Upload skill"). Ausgabe: dist/<plugin>/<skill>.zip
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
out="$root/dist"
rm -rf "$out"

for skill_dir in "$root"/plugins/*/skills/*/; do
  skill_dir="${skill_dir%/}"
  skill="$(basename "$skill_dir")"
  plugin="$(basename "$(dirname "$(dirname "$skill_dir")")")"
  mkdir -p "$out/$plugin"
  if command -v zip >/dev/null; then
    (cd "$(dirname "$skill_dir")" && zip -qr "$out/$plugin/$skill.zip" "$skill" -x '*.DS_Store')
  else
    python3 -I -c 'import shutil,sys; shutil.make_archive(sys.argv[1], "zip", sys.argv[2], sys.argv[3])' \
      "$out/$plugin/$skill" "$(dirname "$skill_dir")" "$skill"
  fi
  echo "dist/$plugin/$skill.zip"
done
