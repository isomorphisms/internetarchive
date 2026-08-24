# Internet Archive favorites

This is the canonical place for the user's Archive.org favorites used by this repository's tests.

**Status: not populated yet because the Archive screenname is unresolved. Do not substitute unrelated project references.**

Archive's public favorites API is:

`https://archive.org/bookmarks.php?output=json&screenname=<archive-screenname>`

The guessed screenname `isomorphisms` is wrong: Archive returns `The user account does not seem to exist.` The generated `fav-isomorphisms` collection shell also contains zero items.

Known Archive URLs the user has explicitly supplied are recorded separately in `TEST_URLS.md`; those are useful test cases but are not automatically classified as favorites.

When the actual Archive profile/favorites URL is known, put the resulting favorites here and in `fixtures/isomorphisms_favorites.json`. Tests should prefer those favorites for new fixtures.
