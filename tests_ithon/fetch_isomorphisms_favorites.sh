#!/bin/sh
set -eu

OUT=${1:-isomorphisms-favorites.json}
URL='https://archive.org/advancedsearch.php?q=collection%3Afav-isomorphisms&fl%5B%5D=identifier&fl%5B%5D=title&fl%5B%5D=creator&fl%5B%5D=mediatype&fl%5B%5D=date&rows=1000&page=1&sort%5B%5D=addeddate+desc&output=json'

curl --fail --silent --show-error --location "$URL" > "$OUT"
