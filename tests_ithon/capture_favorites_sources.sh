#!/bin/sh
set -eu

OUT=${1:-favorites-sources}
mkdir -p "$OUT"

# Archive's public favorites API. `screenname` is the public Archive screen name,
# which is not necessarily the same thing as an @account item identifier.
curl --fail --silent --show-error --location \
  'https://archive.org/bookmarks.php?output=json&screenname=isomorphisms' \
  > "$OUT/isomorphisms.bookmarks.json"

# Keep the collection surfaces too. They are useful differential evidence even
# when Archive's search/RSS representation lags the bookmarks API.
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

curl --fail --silent --show-error --location \
  'https://archive.org/metadata/%40isomorphisms' \
  > "$OUT/account-isomorphisms.metadata.json"
