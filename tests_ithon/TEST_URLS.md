# Internet Archive test URLs

These are concrete Internet Archive URLs the user has actually supplied or used, plus one upstream control. They are not a claim about which items are in the user's Archive favorites list.

## User-supplied / user-used Archive items

### Hegel: Myths and Legends

- Details: `https://archive.org/details/hegelmythslegend0000unse`
- Metadata: `https://archive.org/metadata/hegelmythslegend0000unse`
- Identifier: `hegelmythslegend0000unse`

### JSTOR 108997

The user previously used the direct file URL `https://archive.org/download/jstor-108997/108997.pdf`.

- Details: `https://archive.org/details/jstor-108997`
- Metadata: `https://archive.org/metadata/jstor-108997`
- Identifier: `jstor-108997`

### Cayley collected mathematical papers, volume 6

- Details: `https://archive.org/details/collectedmathema06cayluoft`
- Metadata: `https://archive.org/metadata/collectedmathema06cayluoft`
- Identifier: `collectedmathema06cayluoft`

### Noveltoons collection

- Details: `https://archive.org/details/noveltoons-collection`
- Metadata: `https://archive.org/metadata/noveltoons-collection`
- Identifier: `noveltoons-collection`

These items are used for read-only tests: metadata, exact search, file inventories, generated URLs, HEAD/range requests, format/glob filtering, and curl/Ithon differential checks. Full-file downloads are not required.

## Archive favorites source

The canonical favorites API is:

`https://archive.org/bookmarks.php?output=json&screenname=<archive-screenname>`

`screenname=isomorphisms` is **not** the user's Archive account: Archive returns `The user account does not seem to exist.` Likewise, `fav-isomorphisms` is an empty generated collection shell. Therefore this repository must not pretend that `fav-isomorphisms` is the user's favorites list.

Once the actual Archive screenname/profile identifier is known, the favorites list should be committed separately as `tests_ithon/ISOMORPHISMS_FAVORITES.md` plus a machine-readable fixture and should become the preferred source for new test URLs.

## Username probe

`uploader:isomorphisms` remains only a harmless API probe. Zero rows are allowed; it is not evidence about the user's Archive account.

## Upstream control

The old jjjake documentation repeatedly uses `nasa`, so retain one upstream control fixture.

- Details: `https://archive.org/details/nasa`
- Metadata: `https://archive.org/metadata/nasa`
- Identifier: `nasa`
