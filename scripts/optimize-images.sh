#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BANNER_DIR="$ROOT/assets/projects/banners"
PUBLIC_BANNER_DIR="$ROOT/public/assets/projects/banners"

if ! command -v cwebp >/dev/null 2>&1; then
  echo "cwebp bulunamadi. Kurulum: brew install webp" >&2
  exit 1
fi

mkdir -p "$PUBLIC_BANNER_DIR"

for png in "$BANNER_DIR"/*.png; do
  [[ -f "$png" ]] || continue
  base="$(basename "$png" .png)"
  cwebp -quiet -q 82 -resize 800 0 "$png" -o "$BANNER_DIR/${base}-thumb.webp"
  cwebp -quiet -q 85 "$png" -o "$PUBLIC_BANNER_DIR/${base}.webp"
  echo "Optimized $base"
done
