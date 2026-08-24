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

curl --fail --silent --show-error --location \
  'https://archive.org/metadata/%40isomorphisms' \
  > "$OUT/account-isomorphisms.metadata.json"

python - "$OUT/account-isomorphisms.metadata.json" "$OUT" <<'PY'
import json, pathlib, sys, urllib.request, urllib.parse
metadata_path = pathlib.Path(sys.argv[1])
out = pathlib.Path(sys.argv[2])
data = json.loads(metadata_path.read_text())
for entry in data.get('files', []):
    name = str(entry.get('name', ''))
    format_name = str(entry.get('format', ''))
    marker = (name + ' ' + format_name).lower()
    if 'simplelist' not in marker and 'bookmark' not in marker and 'favorite' not in marker and 'relationship' not in marker:
        continue
    url = 'https://archive.org/download/%40isomorphisms/' + urllib.parse.quote(name)
    target = out / ('account-file-' + name.replace('/', '_'))
    try:
        with urllib.request.urlopen(url, timeout=30) as response:
            target.write_bytes(response.read())
    except Exception as exc:
        (out / ('account-file-' + name.replace('/', '_') + '.error')).write_text(str(exc))
PY
