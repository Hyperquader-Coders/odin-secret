# Decisions — odin-secret

Settled choices. An entry that stops being true is rewritten, not appended to.

## 1. Generated, not hand-written

The bindings are generated with runic from the headers Amber ships, so a library bump is a
regeneration. Hand fixes are the exception and are tracked in [PATCHED.md](PATCHED.md).

## 2. Flag enums are bit_sets, chosen by a list

C flag types are `bit_set[FooBit; u32]`, so callers write `{.SEARCH_ALL, .SEARCH_UNLOCK}`.
`postprocess.sh` rewrites the enums runic emits; the members of `FooBit` are bit indices, and the
type keeps the C size (4 bytes) and bits, so procedures take and return it by value unchanged. A
zero member is the constant `Foo{}` under its C name (`SEARCH_NONE`, `SCHEMA_NONE`,
`ITEM_CREATE_NONE`). The list is the `<bitfield>` entries of Secret-1.gir except
`CollectionCreateFlags`, whose only member is zero (`COLLECTION_CREATE_NONE`): it has no bit to
name, so it stays a plain enum. libsecret's bits start at `1 << 1`; bit 0 is unused. A new GFlags
type in a header bump is added to the list by hand; generation fails if a listed enum is missing,
negative or has no single-bit member. A value rule cannot tell them from plain enums:
`SchemaAttributeType` and `SchemaType` are enums.

## 3. Parameters are single objects unless declared

runic 0.8 writes `[^]T` for a pointer parameter whose C name ends in `s` (`settings`, `lines`),
however many elements it holds, which lets a caller index past one element, and drops a trailing
`va_list`, binding the procedure as `#c_vararg ..any`. Amber's runic fork (branch `amber-patched`)
has `parameters: declared`: with it every procedure parameter is `^T` (`T **` is `^^T`) unless
`arrays:` in the package's `rune.yml` lists it, chosen against the C headers, and a va_list
procedure is skipped. Struct members, variables and typedefs keep runic's name guess, and the
parameters of function-pointer types are plain `^T`: a limit of the fork, true in every binding.
Where a binding needs it, the `param_rules` table in `postprocess.sh` restores the `[^]` for
those parameters' real arrays, rewrites single-object struct members and corrects `T ***` outs;
a row that matches nothing fails the build. Rejected: rewriting the output in `postprocess.sh`,
which had to be told each parameter, matched `va_list` procedures by name pattern (it deleted
`list_store_insert_with_values` for containing `_va`) and was a second place to keep in step
with the headers. `scripts/check-generated.sh` stays as the guard that any regeneration, with
any runic, keeps the listed parameters right.
