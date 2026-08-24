#!/bin/sh
set -eu

OUT=${1:-browser-responses}
mkdir -p "$OUT"
BROWSER_UA='Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 Chrome/140 Safari/537.36'

capture_get() {
    name=$1
    url=$2
    shift 2
    curl --silent --show-error --location \
        --user-agent "$BROWSER_UA" \
        --output "$OUT/$name.body" \
        --write-out '%{http_code}\n' \
        "$@" \
        "$url" \
        > "$OUT/$name.status"
}

capture_item() {
    id=$1

    capture_get "$id.metadata" \
        "https://archive.org/metadata/$id"
    mv "$OUT/$id.metadata.body" "$OUT/$id.metadata.json"

    curl --silent --show-error --location \
        --user-agent "$BROWSER_UA" \
        --get 'https://archive.org/advancedsearch.php' \
        --data-urlencode "q=identifier:$id" \
        --data-urlencode 'fl[]=identifier' \
        --data-urlencode 'fl[]=title' \
        --data-urlencode 'fl[]=creator' \
        --data-urlencode 'rows=10' \
        --data-urlencode 'page=1' \
        --data-urlencode 'output=json' \
        --output "$OUT/$id.search.json" \
        --write-out '%{http_code}\n' \
        > "$OUT/$id.search.status"

    curl --silent --show-error --location \
        --user-agent "$BROWSER_UA" \
        --range 0-255 \
        --dump-header "$OUT/$id.range.headers" \
        --output "$OUT/$id.range.body" \
        --write-out '%{http_code}\n' \
        "https://archive.org/download/$id/${id}_meta.xml" \
        > "$OUT/$id.range.status"
}

capture_search_page() {
    page=$1
    curl --silent --show-error --location \
        --user-agent "$BROWSER_UA" \
        --get 'https://archive.org/advancedsearch.php' \
        --data-urlencode 'q=Hegel' \
        --data-urlencode 'fl[]=identifier' \
        --data-urlencode 'fl[]=title' \
        --data-urlencode 'sort[]=identifier asc' \
        --data-urlencode 'rows=2' \
        --data-urlencode "page=$page" \
        --data-urlencode 'output=json' \
        --output "$OUT/hegel.page${page}.search.json" \
        --write-out '%{http_code}\n' \
        > "$OUT/hegel.page${page}.search.status"
}

# Concrete Archive items the user has actually supplied/used.
capture_item hegelmythslegend0000unse
capture_item jstor-108997
capture_item collectedmathema06cayluoft
capture_item noveltoons-collection

# Upstream control from jjjake's documentation.
capture_item nasa

capture_search_page 1
capture_search_page 2

curl --silent --show-error --location \
    --user-agent "$BROWSER_UA" \
    --get 'https://archive.org/advancedsearch.php' \
    --data-urlencode 'q=uploader:isomorphisms' \
    --data-urlencode 'fl[]=identifier' \
    --data-urlencode 'fl[]=title' \
    --data-urlencode 'rows=10' \
    --data-urlencode 'page=1' \
    --data-urlencode 'output=json' \
    --output "$OUT/isomorphisms.search.json" \
    --write-out '%{http_code}\n' \
    > "$OUT/isomorphisms.search.status"
