# Ithon port

Branch: `ithon-rewrite`

Compatibility target: `isomorphisms/internetarchive` master at `87499c472123bb66cdd5787dba66885e055bf4e5` (`internetarchive` 1.8.2.dev1), the snapshot already present in this fork.

## Shape

The first port is intentionally one executable Ithon source file, `ithon/ia.pi`. That makes the `.pi` source directly runnable without depending on Python's package importer knowing about `.pi` suffixes yet. `bin/ia-ithon` is a thin launcher; set `ITHON=/path/to/ithon` if the interpreter is not installed as `ithon`.

The rewrite does not carry forward the old dependency stack. It uses the standard library instead of `requests`, `six`, `docopt`, `schema`, `jsonpatch`, and `clint`.

## Ported surface

- `ArchiveSession`
- `Item`
- `ArchiveFile` (the old `File` role)
- `Search`
- `Catalog` / `CatalogTask`
- `get_session`
- `get_item`
- `get_files`
- `search_items`
- `download`
- `upload`
- `modify_metadata`
- `delete`
- `configure`
- `get_user_info`
- `get_username`
- remote copy and move
- catalog tasks

CLI commands currently exposed by `ia-ithon`:

- `configure`
- `search`
- `metadata`
- `list`
- `download`
- `upload`
- `delete`
- `copy`
- `move`
- `tasks`

## Design points

- Assignment statements use Ithon's `←` syntax; the checksum reader also exercises `λ`.
- IA-S3 uploads use `http.client` and a known `Content-Length`, avoiding chunked transfer encoding. The old client explicitly notes that IA-S3 does not support chunked transfer uploads.
- S3 authentication remains the Archive convention `Authorization: LOW <access>:<secret>`.
- Downloads preserve Archive `mtime` by default and support filename, format, glob, checksum, existing-file, and on-the-fly filters.
- Metadata updates build the JSON patch locally and post it to `/metadata/<identifier>` with the same access/secret form-auth convention as the old client.
- Configuration keeps the old `~/.config/ia.ini` / `~/.ia` convention and stores the file mode as `0600`.

## Smoke test

Run with Ithon:

```sh
ithon tests_ithon/test_ia.pi
```

The smoke test is deliberately network-free: it checks metadata parsing, indexed metadata updates, patch generation, and IA-S3 metadata headers.

## Next compatibility work

This is a functional vertical rewrite, not bit-for-bit parity with every 2018 edge case. The next pass should use the existing Python test fixtures as a behavioral oracle for retry details, CLI text/exit-code parity, directory upload expansion, file-object uploads, and less-common metadata targets.
