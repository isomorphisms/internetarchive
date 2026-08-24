#!/bin/sh
set -eu

OUT=${1:-favorites-sources}
mkdir -p "$OUT"

SCREENNAME='isomorphismes'

# Archive's public favorites API.
curl --fail --silent --show-error --location \
  "https://archive.org/bookmarks.php?output=json&screenname=$SCREENNAME" \
  > "$OUT/$SCREENNAME.bookmarks.json"

# Also capture the corresponding collection/account surfaces for comparison.
curl --fail --silent --show-error --location \
  "https://archive.org/services/collection-rss.php?collection=fav-$SCREENNAME" \
  > "$OUT/fav-$SCREENNAME.rss"

curl --fail --silent --show-error --location \
  "https://archive.org/details/fav-$SCREENNAME" \
  > "$OUT/fav-$SCREENNAME.html"

curl --silent --show-error --location \
  --write-out '%{http_code}\n' \
  --output "$OUT/fav-$SCREENNAME.metadata.json" \
  "https://archive.org/metadata/fav-$SCREENNAME" \
  > "$OUT/fav-$SCREENNAME.metadata.status"

curl --fail --silent --show-error --location \
  "https://archive.org/metadata/%40$SCREENNAME" \
  > "$OUT/account-$SCREENNAME.metadata.json"
