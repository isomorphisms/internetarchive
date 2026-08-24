#!/bin/sh
set -eu

OUT=${1:-favorites-sources}
mkdir -p "$OUT"

curl --fail --silent --show-error --location \
  'https://archive.org/services/collection-rss.php?collection=fav-isomorphisms' \
  > "$OUT/fav-isomorphisms.rss"

curl --fail --silent --show-error --location \
  'https://archive.org/details/fav-isomorphisms' \
  > "$OUT/fav-isomorphisms.html"

curl --silent --show-error --location \
  --write-out '%{http_code}\n' \
  --output "$OUT/fav-isomorphisms.metadata.json" \
  'https://archive.org/metadata/fav-isomorphisms' \
  > "$OUT/fav-isomorphisms.metadata.status"
