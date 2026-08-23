# Internet Archive test URLs

These are intentionally concrete fixtures instead of random public items.

## Hegel: Myths and Legends

Internet Archive edition of the Hegel book the user supplied and is actively using.

- Details: `https://archive.org/details/hegelmythslegend0000unse`
- Metadata: `https://archive.org/metadata/hegelmythslegend0000unse`
- Identifier: `hegelmythslegend0000unse`

Live assertions:

- details URL answers successfully
- metadata URL answers successfully
- metadata identifier is exact
- title contains `Hegel`
- item has files
- exact-filename filtering can select a real file from returned metadata

## Mumford: Tata Lectures on Theta

Directly relevant to the theta project.

- Details: `https://archive.org/details/tatalecturesonth00mumf_330`
- Metadata: `https://archive.org/metadata/tatalecturesonth00mumf_330`
- Identifier: `tatalecturesonth00mumf_330`

Live assertions:

- details URL answers successfully
- metadata URL answers successfully
- metadata identifier is exact
- title contains `Tata`
- item has files
- exact-filename filtering can select a real file from returned metadata

## Username probe

The public repository/account handle gives us a useful Archive advanced-search fixture without pretending that an Archive account has been verified.

- Query: `uploader:isomorphisms`
- URL: `https://archive.org/advancedsearch.php?q=uploader%3Aisomorphisms&fl%5B%5D=identifier&fl%5B%5D=title&rows=10&page=1&output=json`

Live assertions:

- advanced-search endpoint returns JSON
- JSON contains `response.docs`
- any returned row has an identifier
- zero rows is allowed

## Upstream control

The old jjjake documentation repeatedly uses `nasa`, so retain one boring control fixture to distinguish our code failures from peculiarities in the personally relevant items.

- Details: `https://archive.org/details/nasa`
- Metadata: `https://archive.org/metadata/nasa`
- Identifier: `nasa`
