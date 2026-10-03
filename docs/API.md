# odin-secret API

Every public declaration of every package, generated from the source by `make api`; do not
edit. The reference is the [README](../README.md); the short form is the
[cheat sheet](CHEATSHEET.md).

## secret:secret

```text
package secret
	constants
		COLLECTION_DEFAULT :: "default"
		COLLECTION_NONE :: CollectionFlags{}
		COLLECTION_SESSION :: "session"
		ITEM_CREATE_NONE :: ItemCreateFlags{}
		ITEM_NONE :: ItemFlags{}
		MAJOR_VERSION :: 0
		MICRO_VERSION :: 4
		MINOR_VERSION :: 21
		SCHEMA_NONE :: SchemaFlags{}
		SEARCH_NONE :: SearchFlags{}
		SERVICE_NONE :: ServiceFlags{}

	variables
		SECRET_SCHEMA_COMPAT_NETWORK: ^Schema
		SECRET_SCHEMA_NOTE: ^Schema

	procedures
		attributes_build :: proc(schema: ^Schema, #c_vararg var_args: ..any) -> ^glib.HashTable ---
		attributes_validate :: proc(schema: ^Schema, attributes: ^glib.HashTable, error: ^^glib.Error) -> glib.boolean ---
		backend_flags_get_type :: proc() -> gobj.Type ---
		backend_flags_get_type :: proc() -> gobj.Type ---
		collection_create :: proc(service: ^Service, label: cstring, alias: cstring, flags: CollectionCreateFlags, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		collection_create_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> ^Collection ---
		collection_create_flags_get_type :: proc() -> gobj.Type ---
		collection_create_flags_get_type :: proc() -> gobj.Type ---
		collection_create_sync :: proc(service: ^Service, label: cstring, alias: cstring, flags: CollectionCreateFlags, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^Collection ---
		collection_delete :: proc(self: ^Collection, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		collection_delete_finish :: proc(self: ^Collection, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---
		collection_delete_sync :: proc(self: ^Collection, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---
		collection_flags_get_type :: proc() -> gobj.Type ---
		collection_flags_get_type :: proc() -> gobj.Type ---
		collection_for_alias :: proc(service: ^Service, alias: cstring, flags: CollectionFlags, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		collection_for_alias_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> ^Collection ---
		collection_for_alias_sync :: proc(service: ^Service, alias: cstring, flags: CollectionFlags, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^Collection ---
		collection_get_created :: proc(self: ^Collection) -> glib.uint64 ---
		collection_get_flags :: proc(self: ^Collection) -> CollectionFlags ---
		collection_get_items :: proc(self: ^Collection) -> ^glib.List ---
		collection_get_label :: proc(self: ^Collection) -> cstring ---
		collection_get_locked :: proc(self: ^Collection) -> glib.boolean ---
		collection_get_modified :: proc(self: ^Collection) -> glib.uint64 ---
		collection_get_service :: proc(self: ^Collection) -> ^Service ---
		collection_get_type :: proc() -> gobj.Type ---
		collection_get_type :: proc() -> gobj.Type ---
		collection_load_items :: proc(self: ^Collection, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		collection_load_items_finish :: proc(self: ^Collection, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---
		collection_load_items_sync :: proc(self: ^Collection, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---
		collection_refresh :: proc(self: ^Collection) ---
		collection_search :: proc(self: ^Collection, schema: ^Schema, attributes: ^glib.HashTable, flags: SearchFlags, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		collection_search_finish :: proc(self: ^Collection, result: ^gio.AsyncResult, error: ^^glib.Error) -> ^glib.List ---
		collection_search_sync :: proc(self: ^Collection, schema: ^Schema, attributes: ^glib.HashTable, flags: SearchFlags, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^glib.List ---
		collection_set_label :: proc(self: ^Collection, label: cstring, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		collection_set_label_finish :: proc(self: ^Collection, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---
		collection_set_label_sync :: proc(self: ^Collection, label: cstring, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---
		error_get_quark :: proc() -> glib.Quark ---
		error_get_quark :: proc() -> glib.Quark ---
		error_get_type :: proc() -> gobj.Type ---
		error_get_type :: proc() -> gobj.Type ---
		get_schema :: proc(type: SchemaType) -> ^Schema ---
		item_create :: proc(collection: ^Collection, schema: ^Schema, attributes: ^glib.HashTable, label: cstring, value: ^Value, flags: ItemCreateFlags, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		item_create_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> ^Item ---
		item_create_flags_get_type :: proc() -> gobj.Type ---
		item_create_flags_get_type :: proc() -> gobj.Type ---
		item_create_sync :: proc(collection: ^Collection, schema: ^Schema, attributes: ^glib.HashTable, label: cstring, value: ^Value, flags: ItemCreateFlags, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^Item ---
		item_delete :: proc(self: ^Item, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		item_delete_finish :: proc(self: ^Item, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---
		item_delete_sync :: proc(self: ^Item, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---
		item_flags_get_type :: proc() -> gobj.Type ---
		item_flags_get_type :: proc() -> gobj.Type ---
		item_get_attributes :: proc(self: ^Item) -> ^glib.HashTable ---
		item_get_created :: proc(self: ^Item) -> glib.uint64 ---
		item_get_flags :: proc(self: ^Item) -> ItemFlags ---
		item_get_label :: proc(self: ^Item) -> cstring ---
		item_get_locked :: proc(self: ^Item) -> glib.boolean ---
		item_get_modified :: proc(self: ^Item) -> glib.uint64 ---
		item_get_schema_name :: proc(self: ^Item) -> cstring ---
		item_get_secret :: proc(self: ^Item) -> ^Value ---
		item_get_service :: proc(self: ^Item) -> ^Service ---
		item_get_type :: proc() -> gobj.Type ---
		item_get_type :: proc() -> gobj.Type ---
		item_load_secret :: proc(self: ^Item, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		item_load_secret_finish :: proc(self: ^Item, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---
		item_load_secret_sync :: proc(self: ^Item, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---
		item_load_secrets :: proc(items: ^glib.List, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		item_load_secrets_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---
		item_load_secrets_sync :: proc(items: ^glib.List, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---
		item_refresh :: proc(self: ^Item) ---
		item_set_attributes :: proc(self: ^Item, schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		item_set_attributes_finish :: proc(self: ^Item, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---
		item_set_attributes_sync :: proc(self: ^Item, schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---
		item_set_label :: proc(self: ^Item, label: cstring, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		item_set_label_finish :: proc(self: ^Item, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---
		item_set_label_sync :: proc(self: ^Item, label: cstring, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---
		item_set_secret :: proc(self: ^Item, value: ^Value, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		item_set_secret_finish :: proc(self: ^Item, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---
		item_set_secret_sync :: proc(self: ^Item, value: ^Value, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---
		password_clear :: proc(schema: ^Schema, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer, #c_vararg var_args: ..any) ---
		password_clear_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---
		password_clear_sync :: proc(schema: ^Schema, cancellable: ^gio.Cancellable, error: ^^glib.Error, #c_vararg var_args: ..any) -> glib.boolean ---
		password_clearv :: proc(schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		password_clearv_sync :: proc(schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---
		password_free :: proc(password: cstring) ---
		password_lookup :: proc(schema: ^Schema, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer, #c_vararg var_args: ..any) ---
		password_lookup_binary_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> ^Value ---
		password_lookup_binary_sync :: proc(schema: ^Schema, cancellable: ^gio.Cancellable, error: ^^glib.Error, #c_vararg var_args: ..any) -> ^Value ---
		password_lookup_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> cstring ---
		password_lookup_nonpageable_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> cstring ---
		password_lookup_nonpageable_sync :: proc(schema: ^Schema, cancellable: ^gio.Cancellable, error: ^^glib.Error, #c_vararg var_args: ..any) -> cstring ---
		password_lookup_sync :: proc(schema: ^Schema, cancellable: ^gio.Cancellable, error: ^^glib.Error, #c_vararg var_args: ..any) -> cstring ---
		password_lookupv :: proc(schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		password_lookupv_binary_sync :: proc(schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^Value ---
		password_lookupv_nonpageable_sync :: proc(schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> cstring ---
		password_lookupv_sync :: proc(schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> cstring ---
		password_search :: proc(schema: ^Schema, flags: SearchFlags, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer, #c_vararg var_args: ..any) ---
		password_search_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> ^glib.List ---
		password_search_sync :: proc(schema: ^Schema, flags: SearchFlags, cancellable: ^gio.Cancellable, error: ^^glib.Error, #c_vararg var_args: ..any) -> ^glib.List ---
		password_searchv :: proc(schema: ^Schema, attributes: ^glib.HashTable, flags: SearchFlags, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		password_searchv_sync :: proc(schema: ^Schema, attributes: ^glib.HashTable, flags: SearchFlags, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^glib.List ---
		password_store :: proc(schema: ^Schema, collection: cstring, label: cstring, password: cstring, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer, #c_vararg var_args: ..any) ---
		password_store_binary :: proc(schema: ^Schema, collection: cstring, label: cstring, value: ^Value, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer, #c_vararg var_args: ..any) ---
		password_store_binary_sync :: proc(schema: ^Schema, collection: cstring, label: cstring, value: ^Value, cancellable: ^gio.Cancellable, error: ^^glib.Error, #c_vararg var_args: ..any) -> glib.boolean ---
		password_store_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---
		password_store_sync :: proc(schema: ^Schema, collection: cstring, label: cstring, password: cstring, cancellable: ^gio.Cancellable, error: ^^glib.Error, #c_vararg var_args: ..any) -> glib.boolean ---
		password_storev :: proc(schema: ^Schema, attributes: ^glib.HashTable, collection: cstring, label: cstring, password: cstring, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		password_storev_binary :: proc(schema: ^Schema, attributes: ^glib.HashTable, collection: cstring, label: cstring, value: ^Value, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		password_storev_binary_sync :: proc(schema: ^Schema, attributes: ^glib.HashTable, collection: cstring, label: cstring, value: ^Value, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---
		password_storev_sync :: proc(schema: ^Schema, attributes: ^glib.HashTable, collection: cstring, label: cstring, password: cstring, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---
		password_wipe :: proc(password: cstring) ---
		prompt_get_type :: proc() -> gobj.Type ---
		prompt_get_type :: proc() -> gobj.Type ---
		prompt_perform :: proc(self: ^Prompt, window_id: cstring, return_type: ^glib.VariantType, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		prompt_perform_finish :: proc(self: ^Prompt, result: ^gio.AsyncResult, error: ^^glib.Error) -> ^glib.Variant ---
		prompt_perform_sync :: proc(self: ^Prompt, window_id: cstring, cancellable: ^gio.Cancellable, return_type: ^glib.VariantType, error: ^^glib.Error) -> ^glib.Variant ---
		prompt_run :: proc(self: ^Prompt, window_id: cstring, cancellable: ^gio.Cancellable, return_type: ^glib.VariantType, error: ^^glib.Error) -> ^glib.Variant ---
		retrievable_get_attributes :: proc(self: ^Retrievable) -> ^glib.HashTable ---
		retrievable_get_created :: proc(self: ^Retrievable) -> glib.uint64 ---
		retrievable_get_label :: proc(self: ^Retrievable) -> cstring ---
		retrievable_get_modified :: proc(self: ^Retrievable) -> glib.uint64 ---
		retrievable_get_type :: proc() -> gobj.Type ---
		retrievable_get_type :: proc() -> gobj.Type ---
		retrievable_retrieve_secret :: proc(self: ^Retrievable, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		retrievable_retrieve_secret_finish :: proc(self: ^Retrievable, result: ^gio.AsyncResult, error: ^^glib.Error) -> ^Value ---
		retrievable_retrieve_secret_sync :: proc(self: ^Retrievable, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^Value ---
		schema_attribute_get_type :: proc() -> gobj.Type ---
		schema_attribute_type_get_type :: proc() -> gobj.Type ---
		schema_attribute_type_get_type :: proc() -> gobj.Type ---
		schema_flags_get_type :: proc() -> gobj.Type ---
		schema_flags_get_type :: proc() -> gobj.Type ---
		schema_get_type :: proc() -> gobj.Type ---
		schema_new :: proc(name: cstring, flags: SchemaFlags, #c_vararg var_args: ..any) -> ^Schema ---
		schema_newv :: proc(name: cstring, flags: SchemaFlags, attribute_names_and_types: ^glib.HashTable) -> ^Schema ---
		schema_ref :: proc(schema: ^Schema) -> ^Schema ---
		schema_type_get_type :: proc() -> gobj.Type ---
		schema_type_get_type :: proc() -> gobj.Type ---
		schema_unref :: proc(schema: ^Schema) ---
		search_flags_get_type :: proc() -> gobj.Type ---
		search_flags_get_type :: proc() -> gobj.Type ---
		service_clear :: proc(service: ^Service, schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		service_clear_finish :: proc(service: ^Service, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---
		service_clear_sync :: proc(service: ^Service, schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---
		service_disconnect :: proc() ---
		service_ensure_session :: proc(self: ^Service, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		service_ensure_session_finish :: proc(self: ^Service, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---
		service_ensure_session_sync :: proc(self: ^Service, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---
		service_flags_get_type :: proc() -> gobj.Type ---
		service_flags_get_type :: proc() -> gobj.Type ---
		service_get :: proc(flags: ServiceFlags, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		service_get_collection_gtype :: proc(self: ^Service) -> gobj.Type ---
		service_get_collections :: proc(self: ^Service) -> ^glib.List ---
		service_get_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> ^Service ---
		service_get_flags :: proc(self: ^Service) -> ServiceFlags ---
		service_get_item_gtype :: proc(self: ^Service) -> gobj.Type ---
		service_get_session_algorithms :: proc(self: ^Service) -> cstring ---
		service_get_sync :: proc(flags: ServiceFlags, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^Service ---
		service_get_type :: proc() -> gobj.Type ---
		service_get_type :: proc() -> gobj.Type ---
		service_load_collections :: proc(self: ^Service, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		service_load_collections_finish :: proc(self: ^Service, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---
		service_load_collections_sync :: proc(self: ^Service, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---
		service_lock :: proc(service: ^Service, objects: ^glib.List, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		service_lock_finish :: proc(service: ^Service, result: ^gio.AsyncResult, locked: ^^glib.List, error: ^^glib.Error) -> glib.int_ ---
		service_lock_sync :: proc(service: ^Service, objects: ^glib.List, cancellable: ^gio.Cancellable, locked: ^^glib.List, error: ^^glib.Error) -> glib.int_ ---
		service_lookup :: proc(service: ^Service, schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		service_lookup_finish :: proc(service: ^Service, result: ^gio.AsyncResult, error: ^^glib.Error) -> ^Value ---
		service_lookup_sync :: proc(service: ^Service, schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^Value ---
		service_open :: proc(service_gtype: gobj.Type, service_bus_name: cstring, flags: ServiceFlags, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		service_open_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> ^Service ---
		service_open_sync :: proc(service_gtype: gobj.Type, service_bus_name: cstring, flags: ServiceFlags, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^Service ---
		service_prompt :: proc(self: ^Service, prompt: ^Prompt, return_type: ^glib.VariantType, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		service_prompt_finish :: proc(self: ^Service, result: ^gio.AsyncResult, error: ^^glib.Error) -> ^glib.Variant ---
		service_prompt_sync :: proc(self: ^Service, prompt: ^Prompt, cancellable: ^gio.Cancellable, return_type: ^glib.VariantType, error: ^^glib.Error) -> ^glib.Variant ---
		service_search :: proc(service: ^Service, schema: ^Schema, attributes: ^glib.HashTable, flags: SearchFlags, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		service_search_finish :: proc(service: ^Service, result: ^gio.AsyncResult, error: ^^glib.Error) -> ^glib.List ---
		service_search_sync :: proc(service: ^Service, schema: ^Schema, attributes: ^glib.HashTable, flags: SearchFlags, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^glib.List ---
		service_set_alias :: proc(service: ^Service, alias: cstring, collection: ^Collection, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		service_set_alias_finish :: proc(service: ^Service, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---
		service_set_alias_sync :: proc(service: ^Service, alias: cstring, collection: ^Collection, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---
		service_store :: proc(service: ^Service, schema: ^Schema, attributes: ^glib.HashTable, collection: cstring, label: cstring, value: ^Value, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		service_store_finish :: proc(service: ^Service, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---
		service_store_sync :: proc(service: ^Service, schema: ^Schema, attributes: ^glib.HashTable, collection: cstring, label: cstring, value: ^Value, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---
		service_unlock :: proc(service: ^Service, objects: ^glib.List, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---
		service_unlock_finish :: proc(service: ^Service, result: ^gio.AsyncResult, unlocked: ^^glib.List, error: ^^glib.Error) -> glib.int_ ---
		service_unlock_sync :: proc(service: ^Service, objects: ^glib.List, cancellable: ^gio.Cancellable, unlocked: ^^glib.List, error: ^^glib.Error) -> glib.int_ ---
		value_get :: proc(value: ^Value, length: ^glib.size) -> ^byte ---
		value_get_content_type :: proc(value: ^Value) -> cstring ---
		value_get_text :: proc(value: ^Value) -> cstring ---
		value_get_type :: proc() -> gobj.Type ---
		value_get_type :: proc() -> gobj.Type ---
		value_new :: proc(secret: ^byte, length: glib.ssize, content_type: cstring) -> ^Value ---
		value_new_full :: proc(secret: ^byte, length: glib.ssize, content_type: cstring, destroy: glib.DestroyNotify) -> ^Value ---
		value_ref :: proc(value: ^Value) -> ^Value ---
		value_unref :: proc(value: glib.pointer) ---
		value_unref_to_password :: proc(value: ^Value, length: ^glib.size) -> cstring ---

	types
		Collection :: struct {parent: gio.DBusProxy, pv: ^CollectionPrivate}
		CollectionClass :: struct {parent_class: gio.DBusProxyClass, padding: [8]glib.pointer}
		CollectionCreateFlags :: enum u32 {COLLECTION_CREATE_NONE = 0}
		CollectionFlags :: bit_set[CollectionFlagsBit]
		CollectionFlagsBit :: enum u32 {COLLECTION_LOAD_ITEMS = 1}
		CollectionPrivate :: struct #packed {}
		Error :: enum u32 {PROTOCOL = 1, IS_LOCKED = 2, NO_SUCH_OBJECT = 3, ALREADY_EXISTS = 4, INVALID_FILE_FORMAT = 5, MISMATCHED_SCHEMA = 6, NO_MATCHING_ATTRIBUTE = 7, WRONG_TYPE = 8, EMPTY_TABLE = 9}
		Item :: struct {parent_instance: gio.DBusProxy, pv: ^ItemPrivate}
		ItemClass :: struct {parent_class: gio.DBusProxyClass, padding: [4]glib.pointer}
		ItemCreateFlags :: bit_set[ItemCreateFlagsBit]
		ItemCreateFlagsBit :: enum u32 {ITEM_CREATE_REPLACE = 1}
		ItemFlags :: bit_set[ItemFlagsBit]
		ItemFlagsBit :: enum u32 {ITEM_LOAD_SECRET = 1}
		ItemPrivate :: struct #packed {}
		Prompt :: struct {parent_instance: gio.DBusProxy, pv: ^PromptPrivate}
		PromptClass :: struct {parent_class: gio.DBusProxyClass, padding: [8]glib.pointer}
		PromptPrivate :: struct #packed {}
		Retrievable :: struct #packed {}
		RetrievableInterface :: struct {parent_iface: gobj.TypeInterface, retrieve_secret: retrieve_secret_func_ptr_anon_5, retrieve_secret_finish: retrieve_secret_finish_func_ptr_anon_6}
		Schema :: struct {name: cstring, flags: SchemaFlags, attributes: [32]SchemaAttribute, reserved: glib.int_, reserved1: glib.pointer, reserved2: glib.pointer, reserved3: glib.pointer, reserved4: glib.pointer, reserved5: glib.pointer, reserved6: glib.pointer, reserved7: glib.pointer}
		SchemaAttribute :: struct {name: cstring, type: SchemaAttributeType}
		SchemaAttributeType :: enum u32 {SCHEMA_ATTRIBUTE_STRING = 0, SCHEMA_ATTRIBUTE_INTEGER = 1, SCHEMA_ATTRIBUTE_BOOLEAN = 2}
		SchemaFlags :: bit_set[SchemaFlagsBit]
		SchemaFlagsBit :: enum u32 {SCHEMA_DONT_MATCH_NAME = 1}
		SchemaType :: enum u32 {NOTE = 0, COMPAT_NETWORK = 1}
		SearchFlags :: bit_set[SearchFlagsBit]
		SearchFlagsBit :: enum u32 {SEARCH_ALL = 1, SEARCH_UNLOCK = 2, SEARCH_LOAD_SECRETS = 3}
		Service :: struct {parent: gio.DBusProxy, pv: ^ServicePrivate}
		ServiceClass :: struct {parent_class: gio.DBusProxyClass, collection_gtype: gobj.Type, item_gtype: gobj.Type, prompt_sync: prompt_sync_func_ptr_anon_0, prompt_async: prompt_async_func_ptr_anon_1, prompt_finish: prompt_finish_func_ptr_anon_2, get_collection_gtype: get_collection_gtype_func_ptr_anon_3, get_item_gtype: get_item_gtype_func_ptr_anon_4, padding: [14]glib.pointer}
		ServiceFlags :: bit_set[ServiceFlagsBit]
		ServiceFlagsBit :: enum u32 {SERVICE_OPEN_SESSION = 1, SERVICE_LOAD_COLLECTIONS = 2}
		ServicePrivate :: struct #packed {}
		Value :: struct #packed {}
		get_collection_gtype_func_ptr_anon_3 :: #type proc(self: ^Service) -> gobj.Type
		get_item_gtype_func_ptr_anon_4 :: #type proc(self: ^Service) -> gobj.Type
		prompt_async_func_ptr_anon_1 :: #type proc(self: ^Service, prompt: ^Prompt, return_type: ^glib.VariantType, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer)
		prompt_finish_func_ptr_anon_2 :: #type proc(self: ^Service, result: ^gio.AsyncResult, error: ^^glib.Error) -> ^glib.Variant
		prompt_sync_func_ptr_anon_0 :: #type proc(self: ^Service, prompt: ^Prompt, cancellable: ^gio.Cancellable, return_type: ^glib.VariantType, error: ^^glib.Error) -> ^glib.Variant
		retrieve_secret_finish_func_ptr_anon_6 :: #type proc(self: ^Retrievable, result: ^gio.AsyncResult, error: ^^glib.Error) -> ^Value
		retrieve_secret_func_ptr_anon_5 :: #type proc(self: ^Retrievable, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer)

	files:
		patched.odin
		secret.odin
```
