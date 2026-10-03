# odin-secret cheat sheet

One screen per package: the calls a program makes, in the order it makes them, and the few
rules worth remembering. Every name here is a public declaration in [API.md](API.md), and
`make lint` fails when one is not. For the reasons behind a rule, follow the link to the README.

Conventions that hold everywhere: the library is the `secret` collection
(`-collection:secret=../odin-secret`); the names are libsecret's without the `secret_` prefix;
GLib, GObject and GIO come from `glib:` and are never redeclared ([Use](../README.md#use));
a call that can fail takes a `^^glib.Error` last and sets it only on failure.

## secret:secret — a password in the desktop keyring

```odin
import "core:strings"
import "secret:secret"
import glib "glib:glib"
import gobj "glib:gobject"

// The schema: a name, and one attribute per key an item is found by. The array ends at the first
// zeroed entry. libsecret reads it during the call and keeps nothing, so it lives on the stack.
schema := secret.Schema{name = "org.example.App", attributes = {0 = {"account", .SCHEMA_ATTRIBUTE_STRING}}}

// The attributes to match, as a GHashTable of C strings. Keys and values must outlive the table.
attrs := glib.hash_table_new_full(glib.str_hash, glib.str_equal, nil, nil)
defer glib.hash_table_unref(attrs)
key, val: cstring = "account", "alice"
glib.hash_table_insert(attrs, rawptr(key), rawptr(val))

err: ^glib.Error                                  // nil on success; every sync call below sets it
stored := secret.password_storev_sync(&schema, attrs, secret.COLLECTION_DEFAULT, "App: alice", "hunter2", nil, &err)
if err != nil { glib.error_free(err); err = nil } // err.message says why; it never holds the secret

pw := secret.password_lookupv_sync(&schema, attrs, nil, &err)   // blocks while a locked keyring prompts
if pw != nil {
	mine := strings.clone(string(pw))                           // copy first: the buffer is wiped below
	secret.password_free(pw)                                    // zeroes, then frees; never glib.free
}                                                               // nil with err == nil: nothing stored

secret.password_clearv_sync(&schema, attrs, nil, &err)          // false with err == nil: nothing matched

// Every item with these attributes, whatever schema stored it: DONT_MATCH_NAME, and SEARCH_ALL.
any_name := secret.Schema{name = "org.example.Search", flags = {.SCHEMA_DONT_MATCH_NAME}, attributes = {0 = {"account", .SCHEMA_ATTRIBUTE_STRING}}}
found := secret.password_searchv_sync(&any_name, attrs, {.SEARCH_ALL}, nil, &err)   // ^glib.List of ^secret.Retrievable
defer glib.list_free_full(found, gobj.object_unref)
for l := found; l != nil; l = l.next {
	item := (^secret.Retrievable)(l.data)
	label := secret.retrievable_get_label(item)                 // a copy: glib.free
	glib.free(rawptr(label))
	held := secret.retrievable_get_attributes(item)             // a new table: unref
	glib.hash_table_unref(held)
	_ = secret.retrievable_get_created(item)                    // unix seconds; no secret without SEARCH_LOAD_SECRETS
}
```

| remember | |
|---|---|
| Use the `v` calls with a `GHashTable` | the variadic ones take name, value pairs ending in `cstring(nil)`, and are undefined when one is missing |
| Nothing stored is not an error | `lookupv_sync` returns nil and leaves `err` nil; `err` set means the store could not be read, which the program treats as the same "no secret" |
| `password_free`, not `password_wipe`, ends a password | `wipe` zeroes the buffer and leaves it allocated |
| Free `err` on failure, never on success | `glib.error_free(err)`; the secret is never in a message, so the message may be logged |
| Flag types are bit sets | `{.SEARCH_ALL, .SEARCH_UNLOCK}`, and `secret.SEARCH_NONE` is the empty set ([DECISIONS §2](DECISIONS.md#2-flag-enums-are-bit_sets-chosen-by-a-list)) |
| Sync calls block | a locked keyring answers when its prompt does, so a startup path looks up on a worker thread |
