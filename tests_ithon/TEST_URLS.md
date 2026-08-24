# Internet Archive test URLs

The preferred live fixtures come from the user's actual Archive favorites account: screenname `isomorphismes`, list `fav-isomorphismes`.

The complete favorites snapshot is stored in:

- `tests_ithon/ISOMORPHISMS_FAVORITES.md`
- `tests_ithon/fixtures/isomorphismes_favorites.json`

The live suite uses a small deterministic sample so CI does not issue hundreds of requests.

## Favorite fixtures used by CI

### An invitation to algebraic geometry

- Identifier: `isbn_9780387989808`
- Details: `https://archive.org/details/isbn_9780387989808`
- Metadata: `https://archive.org/metadata/isbn_9780387989808`

### Farm drainage

- Identifier: `farmdrainage00fren`
- Details: `https://archive.org/details/farmdrainage00fren`
- Metadata: `https://archive.org/metadata/farmdrainage00fren`

### Albrecht Dürer's Unterweisung der Messung

- Identifier: `albrechtdrersun01peltgoog`
- Details: `https://archive.org/details/albrechtdrersun01peltgoog`
- Metadata: `https://archive.org/metadata/albrechtdrersun01peltgoog`

### Philosophical Magazine, volume 47 (1924)

- Identifier: `philosophical-magazine-vol-47-1924`
- Details: `https://archive.org/details/philosophical-magazine-vol-47-1924`
- Metadata: `https://archive.org/metadata/philosophical-magazine-vol-47-1924`

### The Absolute Differential Calculus

- Identifier: `TheAbsoluteDifferentialCalculus`
- Details: `https://archive.org/details/TheAbsoluteDifferentialCalculus`
- Metadata: `https://archive.org/metadata/TheAbsoluteDifferentialCalculus`

### On a New Geometry of Space

- Identifier: `philtrans04968378`
- Details: `https://archive.org/details/philtrans04968378`
- Metadata: `https://archive.org/metadata/philtrans04968378`

These exercise metadata parsing, exact-identifier search, file inventories, generated download URLs, HEAD requests, tiny byte-range requests, format/glob filtering, and curl/Ithon differential checks. They do not require full content downloads.

## Favorites API

Archive exposes this list through:

`https://archive.org/bookmarks.php?output=json&screenname=isomorphismes`

The snapshot workflow verifies every returned row is a `favorite` belonging to `@isomorphismes` / `fav-isomorphismes` before committing it.

## Upstream control

The old jjjake documentation repeatedly uses `nasa`, so retain one non-personal control fixture:

- Details: `https://archive.org/details/nasa`
- Metadata: `https://archive.org/metadata/nasa`
- Identifier: `nasa`
