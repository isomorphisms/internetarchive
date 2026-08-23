#!/bin/sh
set -eu

OUT=${1:-browser-responses}
mkdir -p "$OUT"

capture_item() {
    id=$1

    curl --fail --silent --show-error --location \
        "https://archive.org/metadata/$id" \
        > "$OUT/$id.metadata.json"

    curl --fail --silent --show-error --location \
        --get 'https://archive.org/advancedsearch.php' \
        --data-urlencode "q=identifier:$id" \
        --data-urlencode 'fl[]=identifier' \
        --data-urlencode 'fl[]=title' \
        --data-urlencode 'fl[]=creator' \
        --data-urlencode 'rows=10' \
        --data-urlencode 'page=1' \
        --data-urlencode 'output=json' \
        > "$OUT/$id.search.json"

    curl --fail --silent --show-error --location \
        --range 0-255 \
        --dump-header "$OUT/$id.range.headers" \
        "https://archive.org/download/$id/${id}_meta.xml" \
        > "$OUT/$id.range.body"
}

capture_item hegelmythslegend0000unse
capture_item tatalecturesonth00mumf_330
capture_item nasa

curl --fail --silent --show-error --location \
    --get 'https://archive.org/advancedsearch.php' \
    --data-urlencode 'q=uploader:isomorphisms' \
    --data-urlencode 'fl[]=identifier' \
    --data-urlencode 'fl[]=title' \
    --data-urlencode 'rows=10' \
    --data-urlencode 'page=1' \
    --data-urlencode 'output=json' \
    > "$OUT/isomorphisms.search.json"
