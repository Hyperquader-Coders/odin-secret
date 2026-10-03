package secret

// Typed pins for the rules in docs/PATCHED.md. A regeneration that drops one fails to compile
// here instead of misbehaving at run time.

import gio "glib:gio"
import glib "glib:glib"

// `gchar *` is `cstring`, not runic's `^char`.
@(private)
patched_password_lookup_sync: proc "c" (
	schema: ^Schema,
	cancellable: ^gio.Cancellable,
	error: ^^glib.Error,
	#c_vararg var_args: ..any,
) -> cstring = password_lookup_sync

@(private)
patched_value_get_text: proc "c" (value: ^Value) -> cstring = value_get_text

// A secret is a byte buffer, not text: `^byte`.
@(private)
patched_value_new: proc "c" (secret: ^byte, length: glib.ssize, content_type: cstring) -> ^Value = value_new

@(private)
patched_value_get: proc "c" (value: ^Value, length: ^glib.size) -> ^byte = value_get

// `GHashTable *` parameters, which runic emits as `[^]`.
@(private)
patched_password_storev_sync: proc "c" (
	schema: ^Schema,
	attributes: ^glib.HashTable,
	collection: cstring,
	label: cstring,
	password: cstring,
	cancellable: ^gio.Cancellable,
	error: ^^glib.Error,
) -> glib.boolean = password_storev_sync

// `TYPE_*` and `ERROR` name the procedure, as in `gio`.
@(private)
patched_type_value := TYPE_VALUE

@(private)
patched_error := ERROR

// A `GList *` parameter is one list head: `^glib.List`, not runic's `[^]glib.List`.
@(private)
patched_service_lock: proc "c" (
	_: ^Service,
	_: ^glib.List,
	_: ^gio.Cancellable,
	_: gio.AsyncReadyCallback,
	_: glib.pointer,
) = service_lock

@(private)
patched_item_load_secrets_sync: proc "c" (_: ^glib.List, _: ^gio.Cancellable, _: ^^glib.Error) -> glib.boolean = item_load_secrets_sync
