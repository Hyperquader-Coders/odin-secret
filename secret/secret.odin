package secret

import gio "glib:gio"
import glib "glib:glib"
import gobj "glib:gobject"

ERROR :: error_get_quark
COLLECTION_DEFAULT :: "default"
COLLECTION_SESSION :: "session"
TYPE_PROMPT :: prompt_get_type
TYPE_VALUE :: value_get_type
TYPE_SERVICE :: service_get_type
TYPE_COLLECTION :: collection_get_type
TYPE_BACKEND_FLAGS :: backend_flags_get_type
TYPE_COLLECTION_FLAGS :: collection_flags_get_type
TYPE_COLLECTION_CREATE_FLAGS :: collection_create_flags_get_type
TYPE_ITEM_FLAGS :: item_flags_get_type
TYPE_ITEM_CREATE_FLAGS :: item_create_flags_get_type
TYPE_SCHEMA_ATTRIBUTE_TYPE :: schema_attribute_type_get_type
TYPE_SCHEMA_FLAGS :: schema_flags_get_type
TYPE_SCHEMA_TYPE :: schema_type_get_type
TYPE_SERVICE_FLAGS :: service_flags_get_type
TYPE_ERROR :: error_get_type
TYPE_SEARCH_FLAGS :: search_flags_get_type
TYPE_ITEM :: item_get_type
TYPE_RETRIEVABLE :: retrievable_get_type
MAJOR_VERSION :: 0
MINOR_VERSION :: 21
MICRO_VERSION :: 4

SchemaAttributeType :: enum u32 {SCHEMA_ATTRIBUTE_STRING = 0, SCHEMA_ATTRIBUTE_INTEGER = 1, SCHEMA_ATTRIBUTE_BOOLEAN = 2 }
SchemaAttribute :: struct {
    name: cstring,
    type: SchemaAttributeType,
}
SchemaFlagsBit :: enum u32 {SCHEMA_DONT_MATCH_NAME = 1}
SchemaFlags :: bit_set[SchemaFlagsBit; u32]
SCHEMA_NONE :: SchemaFlags{}
Schema :: struct {
    name: cstring,
    flags: SchemaFlags,
    attributes: [32]SchemaAttribute,
    reserved: glib.int_,
    reserved1: glib.pointer,
    reserved2: glib.pointer,
    reserved3: glib.pointer,
    reserved4: glib.pointer,
    reserved5: glib.pointer,
    reserved6: glib.pointer,
    reserved7: glib.pointer,
}
Error :: enum u32 {PROTOCOL = 1, IS_LOCKED = 2, NO_SUCH_OBJECT = 3, ALREADY_EXISTS = 4, INVALID_FILE_FORMAT = 5, MISMATCHED_SCHEMA = 6, NO_MATCHING_ATTRIBUTE = 7, WRONG_TYPE = 8, EMPTY_TABLE = 9 }
SearchFlagsBit :: enum u32 {SEARCH_ALL = 1, SEARCH_UNLOCK = 2, SEARCH_LOAD_SECRETS = 3}
SearchFlags :: bit_set[SearchFlagsBit; u32]
SEARCH_NONE :: SearchFlags{}
PromptPrivate :: struct #packed {}

Prompt :: struct {
    parent_instance: gio.DBusProxy,
    pv: ^PromptPrivate,
}

PromptClass :: struct {
    parent_class: gio.DBusProxyClass,
    padding: [8]glib.pointer,
}

Value :: struct #packed {}

ServiceFlagsBit :: enum u32 {SERVICE_OPEN_SESSION = 1, SERVICE_LOAD_COLLECTIONS = 2}
ServiceFlags :: bit_set[ServiceFlagsBit; u32]
SERVICE_NONE :: ServiceFlags{}
CollectionPrivate :: struct #packed {}

Collection :: struct {
    parent: gio.DBusProxy,
    pv: ^CollectionPrivate,
}

ServicePrivate :: struct #packed {}

Service :: struct {
    parent: gio.DBusProxy,
    pv: ^ServicePrivate,
}

prompt_sync_func_ptr_anon_0 :: #type proc "c" (self: ^Service, prompt: ^Prompt, cancellable: ^gio.Cancellable, return_type: ^glib.VariantType, error: ^^glib.Error) -> ^glib.Variant
prompt_async_func_ptr_anon_1 :: #type proc "c" (self: ^Service, prompt: ^Prompt, return_type: ^glib.VariantType, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer)
prompt_finish_func_ptr_anon_2 :: #type proc "c" (self: ^Service, result: ^gio.AsyncResult, error: ^^glib.Error) -> ^glib.Variant
get_collection_gtype_func_ptr_anon_3 :: #type proc "c" (self: ^Service) -> gobj.Type
get_item_gtype_func_ptr_anon_4 :: #type proc "c" (self: ^Service) -> gobj.Type
ServiceClass :: struct {
    parent_class: gio.DBusProxyClass,
    collection_gtype: gobj.Type,
    item_gtype: gobj.Type,
    prompt_sync: prompt_sync_func_ptr_anon_0,
    prompt_async: prompt_async_func_ptr_anon_1,
    prompt_finish: prompt_finish_func_ptr_anon_2,
    get_collection_gtype: get_collection_gtype_func_ptr_anon_3,
    get_item_gtype: get_item_gtype_func_ptr_anon_4,
    padding: [14]glib.pointer,
}

CollectionFlagsBit :: enum u32 {COLLECTION_LOAD_ITEMS = 1}
CollectionFlags :: bit_set[CollectionFlagsBit; u32]
COLLECTION_NONE :: CollectionFlags{}
CollectionCreateFlags :: enum u32 {COLLECTION_CREATE_NONE = 0 }
ItemPrivate :: struct #packed {}

Item :: struct {
    parent_instance: gio.DBusProxy,
    pv: ^ItemPrivate,
}

CollectionClass :: struct {
    parent_class: gio.DBusProxyClass,
    padding: [8]glib.pointer,
}

ItemFlagsBit :: enum u32 {ITEM_LOAD_SECRET = 1}
ItemFlags :: bit_set[ItemFlagsBit; u32]
ITEM_NONE :: ItemFlags{}
ItemCreateFlagsBit :: enum u32 {ITEM_CREATE_REPLACE = 1}
ItemCreateFlags :: bit_set[ItemCreateFlagsBit; u32]
ITEM_CREATE_NONE :: ItemCreateFlags{}
ItemClass :: struct {
    parent_class: gio.DBusProxyClass,
    padding: [4]glib.pointer,
}

Retrievable :: struct #packed {}

retrieve_secret_func_ptr_anon_5 :: #type proc "c" (self: ^Retrievable, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer)
retrieve_secret_finish_func_ptr_anon_6 :: #type proc "c" (self: ^Retrievable, result: ^gio.AsyncResult, error: ^^glib.Error) -> ^Value
RetrievableInterface :: struct {
    parent_iface: gobj.TypeInterface,
    retrieve_secret: retrieve_secret_func_ptr_anon_5,
    retrieve_secret_finish: retrieve_secret_finish_func_ptr_anon_6,
}

SchemaType :: enum u32 {NOTE = 0, COMPAT_NETWORK = 1 }

@(default_calling_convention = "c")
foreign secret_runic {
    @(link_name = "secret_schema_get_type")
    schema_get_type :: proc() -> gobj.Type ---

    @(link_name = "secret_schema_new")
    schema_new :: proc(name: cstring, flags: SchemaFlags, #c_vararg var_args: ..any) -> ^Schema ---

    @(link_name = "secret_schema_newv")
    schema_newv :: proc(name: cstring, flags: SchemaFlags, attribute_names_and_types: ^glib.HashTable) -> ^Schema ---

    @(link_name = "secret_schema_ref")
    schema_ref :: proc(schema: ^Schema) -> ^Schema ---

    @(link_name = "secret_schema_unref")
    schema_unref :: proc(schema: ^Schema) ---

    @(link_name = "secret_schema_attribute_get_type")
    schema_attribute_get_type :: proc() -> gobj.Type ---

    @(link_name = "secret_attributes_build")
    attributes_build :: proc(schema: ^Schema, #c_vararg var_args: ..any) -> ^glib.HashTable ---

    // attributes_buildv skipped: its trailing va_list is dropped by runic, so it would be a wrong #c_vararg ..any call

    @(link_name = "secret_attributes_validate")
    attributes_validate :: proc(schema: ^Schema, attributes: ^glib.HashTable, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_error_get_quark")
    error_get_quark :: proc() -> glib.Quark ---

    @(link_name = "secret_prompt_get_type")
    prompt_get_type :: proc() -> gobj.Type ---

    @(link_name = "secret_prompt_run")
    prompt_run :: proc(self: ^Prompt, window_id: cstring, cancellable: ^gio.Cancellable, return_type: ^glib.VariantType, error: ^^glib.Error) -> ^glib.Variant ---

    @(link_name = "secret_prompt_perform_sync")
    prompt_perform_sync :: proc(self: ^Prompt, window_id: cstring, cancellable: ^gio.Cancellable, return_type: ^glib.VariantType, error: ^^glib.Error) -> ^glib.Variant ---

    @(link_name = "secret_prompt_perform")
    prompt_perform :: proc(self: ^Prompt, window_id: cstring, return_type: ^glib.VariantType, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_prompt_perform_finish")
    prompt_perform_finish :: proc(self: ^Prompt, result: ^gio.AsyncResult, error: ^^glib.Error) -> ^glib.Variant ---

    @(link_name = "secret_value_get_type")
    value_get_type :: proc() -> gobj.Type ---

    @(link_name = "secret_value_new")
    value_new :: proc(secret: ^byte, length: glib.ssize, content_type: cstring) -> ^Value ---

    @(link_name = "secret_value_new_full")
    value_new_full :: proc(secret: ^byte, length: glib.ssize, content_type: cstring, destroy: glib.DestroyNotify) -> ^Value ---

    @(link_name = "secret_value_get")
    value_get :: proc(value: ^Value, length: ^glib.size) -> ^byte ---

    @(link_name = "secret_value_get_text")
    value_get_text :: proc(value: ^Value) -> cstring ---

    @(link_name = "secret_value_get_content_type")
    value_get_content_type :: proc(value: ^Value) -> cstring ---

    @(link_name = "secret_value_ref")
    value_ref :: proc(value: ^Value) -> ^Value ---

    @(link_name = "secret_value_unref")
    value_unref :: proc(value: glib.pointer) ---

    @(link_name = "secret_value_unref_to_password")
    value_unref_to_password :: proc(value: ^Value, length: ^glib.size) -> cstring ---

    @(link_name = "secret_service_get_type")
    service_get_type :: proc() -> gobj.Type ---

    @(link_name = "secret_service_get_collection_gtype")
    service_get_collection_gtype :: proc(self: ^Service) -> gobj.Type ---

    @(link_name = "secret_service_get_item_gtype")
    service_get_item_gtype :: proc(self: ^Service) -> gobj.Type ---

    @(link_name = "secret_service_get")
    service_get :: proc(flags: ServiceFlags, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_service_get_finish")
    service_get_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> ^Service ---

    @(link_name = "secret_service_get_sync")
    service_get_sync :: proc(flags: ServiceFlags, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^Service ---

    @(link_name = "secret_service_disconnect")
    service_disconnect :: proc() ---

    @(link_name = "secret_service_open")
    service_open :: proc(service_gtype: gobj.Type, service_bus_name: cstring, flags: ServiceFlags, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_service_open_finish")
    service_open_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> ^Service ---

    @(link_name = "secret_service_open_sync")
    service_open_sync :: proc(service_gtype: gobj.Type, service_bus_name: cstring, flags: ServiceFlags, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^Service ---

    @(link_name = "secret_service_get_flags")
    service_get_flags :: proc(self: ^Service) -> ServiceFlags ---

    @(link_name = "secret_service_get_session_algorithms")
    service_get_session_algorithms :: proc(self: ^Service) -> cstring ---

    @(link_name = "secret_service_get_collections")
    service_get_collections :: proc(self: ^Service) -> ^glib.List ---

    @(link_name = "secret_service_ensure_session")
    service_ensure_session :: proc(self: ^Service, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_service_ensure_session_finish")
    service_ensure_session_finish :: proc(self: ^Service, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_service_ensure_session_sync")
    service_ensure_session_sync :: proc(self: ^Service, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_service_load_collections")
    service_load_collections :: proc(self: ^Service, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_service_load_collections_finish")
    service_load_collections_finish :: proc(self: ^Service, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_service_load_collections_sync")
    service_load_collections_sync :: proc(self: ^Service, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_service_prompt_sync")
    service_prompt_sync :: proc(self: ^Service, prompt: ^Prompt, cancellable: ^gio.Cancellable, return_type: ^glib.VariantType, error: ^^glib.Error) -> ^glib.Variant ---

    @(link_name = "secret_service_prompt")
    service_prompt :: proc(self: ^Service, prompt: ^Prompt, return_type: ^glib.VariantType, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_service_prompt_finish")
    service_prompt_finish :: proc(self: ^Service, result: ^gio.AsyncResult, error: ^^glib.Error) -> ^glib.Variant ---

    @(link_name = "secret_service_search")
    service_search :: proc(service: ^Service, schema: ^Schema, attributes: ^glib.HashTable, flags: SearchFlags, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_service_search_finish")
    service_search_finish :: proc(service: ^Service, result: ^gio.AsyncResult, error: ^^glib.Error) -> ^glib.List ---

    @(link_name = "secret_service_search_sync")
    service_search_sync :: proc(service: ^Service, schema: ^Schema, attributes: ^glib.HashTable, flags: SearchFlags, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^glib.List ---

    @(link_name = "secret_service_lock")
    service_lock :: proc(service: ^Service, objects: ^glib.List, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_service_lock_finish")
    service_lock_finish :: proc(service: ^Service, result: ^gio.AsyncResult, locked: ^^glib.List, error: ^^glib.Error) -> glib.int_ ---

    @(link_name = "secret_service_lock_sync")
    service_lock_sync :: proc(service: ^Service, objects: ^glib.List, cancellable: ^gio.Cancellable, locked: ^^glib.List, error: ^^glib.Error) -> glib.int_ ---

    @(link_name = "secret_service_unlock")
    service_unlock :: proc(service: ^Service, objects: ^glib.List, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_service_unlock_finish")
    service_unlock_finish :: proc(service: ^Service, result: ^gio.AsyncResult, unlocked: ^^glib.List, error: ^^glib.Error) -> glib.int_ ---

    @(link_name = "secret_service_unlock_sync")
    service_unlock_sync :: proc(service: ^Service, objects: ^glib.List, cancellable: ^gio.Cancellable, unlocked: ^^glib.List, error: ^^glib.Error) -> glib.int_ ---

    @(link_name = "secret_service_store")
    service_store :: proc(service: ^Service, schema: ^Schema, attributes: ^glib.HashTable, collection: cstring, label: cstring, value: ^Value, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_service_store_finish")
    service_store_finish :: proc(service: ^Service, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_service_store_sync")
    service_store_sync :: proc(service: ^Service, schema: ^Schema, attributes: ^glib.HashTable, collection: cstring, label: cstring, value: ^Value, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_service_lookup")
    service_lookup :: proc(service: ^Service, schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_service_lookup_finish")
    service_lookup_finish :: proc(service: ^Service, result: ^gio.AsyncResult, error: ^^glib.Error) -> ^Value ---

    @(link_name = "secret_service_lookup_sync")
    service_lookup_sync :: proc(service: ^Service, schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^Value ---

    @(link_name = "secret_service_clear")
    service_clear :: proc(service: ^Service, schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_service_clear_finish")
    service_clear_finish :: proc(service: ^Service, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_service_clear_sync")
    service_clear_sync :: proc(service: ^Service, schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_service_set_alias")
    service_set_alias :: proc(service: ^Service, alias: cstring, collection: ^Collection, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_service_set_alias_finish")
    service_set_alias_finish :: proc(service: ^Service, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_service_set_alias_sync")
    service_set_alias_sync :: proc(service: ^Service, alias: cstring, collection: ^Collection, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_collection_get_type")
    collection_get_type :: proc() -> gobj.Type ---

    @(link_name = "secret_collection_for_alias")
    collection_for_alias :: proc(service: ^Service, alias: cstring, flags: CollectionFlags, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_collection_for_alias_finish")
    collection_for_alias_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> ^Collection ---

    @(link_name = "secret_collection_for_alias_sync")
    collection_for_alias_sync :: proc(service: ^Service, alias: cstring, flags: CollectionFlags, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^Collection ---

    @(link_name = "secret_collection_load_items")
    collection_load_items :: proc(self: ^Collection, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_collection_load_items_finish")
    collection_load_items_finish :: proc(self: ^Collection, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_collection_load_items_sync")
    collection_load_items_sync :: proc(self: ^Collection, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_collection_refresh")
    collection_refresh :: proc(self: ^Collection) ---

    @(link_name = "secret_collection_create")
    collection_create :: proc(service: ^Service, label: cstring, alias: cstring, flags: CollectionCreateFlags, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_collection_create_finish")
    collection_create_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> ^Collection ---

    @(link_name = "secret_collection_create_sync")
    collection_create_sync :: proc(service: ^Service, label: cstring, alias: cstring, flags: CollectionCreateFlags, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^Collection ---

    @(link_name = "secret_collection_search")
    collection_search :: proc(self: ^Collection, schema: ^Schema, attributes: ^glib.HashTable, flags: SearchFlags, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_collection_search_finish")
    collection_search_finish :: proc(self: ^Collection, result: ^gio.AsyncResult, error: ^^glib.Error) -> ^glib.List ---

    @(link_name = "secret_collection_search_sync")
    collection_search_sync :: proc(self: ^Collection, schema: ^Schema, attributes: ^glib.HashTable, flags: SearchFlags, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^glib.List ---

    @(link_name = "secret_collection_delete")
    collection_delete :: proc(self: ^Collection, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_collection_delete_finish")
    collection_delete_finish :: proc(self: ^Collection, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_collection_delete_sync")
    collection_delete_sync :: proc(self: ^Collection, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_collection_get_service")
    collection_get_service :: proc(self: ^Collection) -> ^Service ---

    @(link_name = "secret_collection_get_flags")
    collection_get_flags :: proc(self: ^Collection) -> CollectionFlags ---

    @(link_name = "secret_collection_get_items")
    collection_get_items :: proc(self: ^Collection) -> ^glib.List ---

    @(link_name = "secret_collection_get_label")
    collection_get_label :: proc(self: ^Collection) -> cstring ---

    @(link_name = "secret_collection_set_label")
    collection_set_label :: proc(self: ^Collection, label: cstring, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_collection_set_label_finish")
    collection_set_label_finish :: proc(self: ^Collection, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_collection_set_label_sync")
    collection_set_label_sync :: proc(self: ^Collection, label: cstring, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_collection_get_locked")
    collection_get_locked :: proc(self: ^Collection) -> glib.boolean ---

    @(link_name = "secret_collection_get_created")
    collection_get_created :: proc(self: ^Collection) -> glib.uint64 ---

    @(link_name = "secret_collection_get_modified")
    collection_get_modified :: proc(self: ^Collection) -> glib.uint64 ---

    @(link_name = "secret_backend_flags_get_type")
    backend_flags_get_type :: proc() -> gobj.Type ---

    @(link_name = "secret_collection_flags_get_type")
    collection_flags_get_type :: proc() -> gobj.Type ---

    @(link_name = "secret_collection_create_flags_get_type")
    collection_create_flags_get_type :: proc() -> gobj.Type ---

    @(link_name = "secret_item_flags_get_type")
    item_flags_get_type :: proc() -> gobj.Type ---

    @(link_name = "secret_item_create_flags_get_type")
    item_create_flags_get_type :: proc() -> gobj.Type ---

    @(link_name = "secret_schema_attribute_type_get_type")
    schema_attribute_type_get_type :: proc() -> gobj.Type ---

    @(link_name = "secret_schema_flags_get_type")
    schema_flags_get_type :: proc() -> gobj.Type ---

    @(link_name = "secret_schema_type_get_type")
    schema_type_get_type :: proc() -> gobj.Type ---

    @(link_name = "secret_service_flags_get_type")
    service_flags_get_type :: proc() -> gobj.Type ---

    @(link_name = "secret_error_get_type")
    error_get_type :: proc() -> gobj.Type ---

    @(link_name = "secret_search_flags_get_type")
    search_flags_get_type :: proc() -> gobj.Type ---

    @(link_name = "secret_item_get_type")
    item_get_type :: proc() -> gobj.Type ---

    @(link_name = "secret_item_refresh")
    item_refresh :: proc(self: ^Item) ---

    @(link_name = "secret_item_create")
    item_create :: proc(collection: ^Collection, schema: ^Schema, attributes: ^glib.HashTable, label: cstring, value: ^Value, flags: ItemCreateFlags, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_item_create_finish")
    item_create_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> ^Item ---

    @(link_name = "secret_item_create_sync")
    item_create_sync :: proc(collection: ^Collection, schema: ^Schema, attributes: ^glib.HashTable, label: cstring, value: ^Value, flags: ItemCreateFlags, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^Item ---

    @(link_name = "secret_item_delete")
    item_delete :: proc(self: ^Item, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_item_delete_finish")
    item_delete_finish :: proc(self: ^Item, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_item_delete_sync")
    item_delete_sync :: proc(self: ^Item, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_item_get_flags")
    item_get_flags :: proc(self: ^Item) -> ItemFlags ---

    @(link_name = "secret_item_get_service")
    item_get_service :: proc(self: ^Item) -> ^Service ---

    @(link_name = "secret_item_get_secret")
    item_get_secret :: proc(self: ^Item) -> ^Value ---

    @(link_name = "secret_item_load_secret")
    item_load_secret :: proc(self: ^Item, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_item_load_secret_finish")
    item_load_secret_finish :: proc(self: ^Item, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_item_load_secret_sync")
    item_load_secret_sync :: proc(self: ^Item, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_item_load_secrets")
    item_load_secrets :: proc(items: ^glib.List, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_item_load_secrets_finish")
    item_load_secrets_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_item_load_secrets_sync")
    item_load_secrets_sync :: proc(items: ^glib.List, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_item_set_secret")
    item_set_secret :: proc(self: ^Item, value: ^Value, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_item_set_secret_finish")
    item_set_secret_finish :: proc(self: ^Item, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_item_set_secret_sync")
    item_set_secret_sync :: proc(self: ^Item, value: ^Value, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_item_get_schema_name")
    item_get_schema_name :: proc(self: ^Item) -> cstring ---

    @(link_name = "secret_item_get_attributes")
    item_get_attributes :: proc(self: ^Item) -> ^glib.HashTable ---

    @(link_name = "secret_item_set_attributes")
    item_set_attributes :: proc(self: ^Item, schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_item_set_attributes_finish")
    item_set_attributes_finish :: proc(self: ^Item, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_item_set_attributes_sync")
    item_set_attributes_sync :: proc(self: ^Item, schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_item_get_label")
    item_get_label :: proc(self: ^Item) -> cstring ---

    @(link_name = "secret_item_set_label")
    item_set_label :: proc(self: ^Item, label: cstring, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_item_set_label_finish")
    item_set_label_finish :: proc(self: ^Item, result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_item_set_label_sync")
    item_set_label_sync :: proc(self: ^Item, label: cstring, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_item_get_locked")
    item_get_locked :: proc(self: ^Item) -> glib.boolean ---

    @(link_name = "secret_item_get_created")
    item_get_created :: proc(self: ^Item) -> glib.uint64 ---

    @(link_name = "secret_item_get_modified")
    item_get_modified :: proc(self: ^Item) -> glib.uint64 ---

    @(link_name = "secret_password_store")
    password_store :: proc(schema: ^Schema, collection: cstring, label: cstring, password: cstring, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer, #c_vararg var_args: ..any) ---

    @(link_name = "secret_password_storev")
    password_storev :: proc(schema: ^Schema, attributes: ^glib.HashTable, collection: cstring, label: cstring, password: cstring, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_password_store_binary")
    password_store_binary :: proc(schema: ^Schema, collection: cstring, label: cstring, value: ^Value, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer, #c_vararg var_args: ..any) ---

    @(link_name = "secret_password_storev_binary")
    password_storev_binary :: proc(schema: ^Schema, attributes: ^glib.HashTable, collection: cstring, label: cstring, value: ^Value, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_password_store_finish")
    password_store_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_password_store_sync")
    password_store_sync :: proc(schema: ^Schema, collection: cstring, label: cstring, password: cstring, cancellable: ^gio.Cancellable, error: ^^glib.Error, #c_vararg var_args: ..any) -> glib.boolean ---

    @(link_name = "secret_password_storev_sync")
    password_storev_sync :: proc(schema: ^Schema, attributes: ^glib.HashTable, collection: cstring, label: cstring, password: cstring, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_password_store_binary_sync")
    password_store_binary_sync :: proc(schema: ^Schema, collection: cstring, label: cstring, value: ^Value, cancellable: ^gio.Cancellable, error: ^^glib.Error, #c_vararg var_args: ..any) -> glib.boolean ---

    @(link_name = "secret_password_storev_binary_sync")
    password_storev_binary_sync :: proc(schema: ^Schema, attributes: ^glib.HashTable, collection: cstring, label: cstring, value: ^Value, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_password_lookup")
    password_lookup :: proc(schema: ^Schema, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer, #c_vararg var_args: ..any) ---

    @(link_name = "secret_password_lookupv")
    password_lookupv :: proc(schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_password_lookup_finish")
    password_lookup_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> cstring ---

    @(link_name = "secret_password_lookup_nonpageable_finish")
    password_lookup_nonpageable_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> cstring ---

    @(link_name = "secret_password_lookup_binary_finish")
    password_lookup_binary_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> ^Value ---

    @(link_name = "secret_password_lookup_sync")
    password_lookup_sync :: proc(schema: ^Schema, cancellable: ^gio.Cancellable, error: ^^glib.Error, #c_vararg var_args: ..any) -> cstring ---

    @(link_name = "secret_password_lookup_nonpageable_sync")
    password_lookup_nonpageable_sync :: proc(schema: ^Schema, cancellable: ^gio.Cancellable, error: ^^glib.Error, #c_vararg var_args: ..any) -> cstring ---

    @(link_name = "secret_password_lookup_binary_sync")
    password_lookup_binary_sync :: proc(schema: ^Schema, cancellable: ^gio.Cancellable, error: ^^glib.Error, #c_vararg var_args: ..any) -> ^Value ---

    @(link_name = "secret_password_lookupv_sync")
    password_lookupv_sync :: proc(schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> cstring ---

    @(link_name = "secret_password_lookupv_nonpageable_sync")
    password_lookupv_nonpageable_sync :: proc(schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> cstring ---

    @(link_name = "secret_password_lookupv_binary_sync")
    password_lookupv_binary_sync :: proc(schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^Value ---

    @(link_name = "secret_password_clear")
    password_clear :: proc(schema: ^Schema, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer, #c_vararg var_args: ..any) ---

    @(link_name = "secret_password_clearv")
    password_clearv :: proc(schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_password_clear_finish")
    password_clear_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_password_clear_sync")
    password_clear_sync :: proc(schema: ^Schema, cancellable: ^gio.Cancellable, error: ^^glib.Error, #c_vararg var_args: ..any) -> glib.boolean ---

    @(link_name = "secret_password_clearv_sync")
    password_clearv_sync :: proc(schema: ^Schema, attributes: ^glib.HashTable, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> glib.boolean ---

    @(link_name = "secret_password_search")
    password_search :: proc(schema: ^Schema, flags: SearchFlags, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer, #c_vararg var_args: ..any) ---

    @(link_name = "secret_password_searchv")
    password_searchv :: proc(schema: ^Schema, attributes: ^glib.HashTable, flags: SearchFlags, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_password_search_sync")
    password_search_sync :: proc(schema: ^Schema, flags: SearchFlags, cancellable: ^gio.Cancellable, error: ^^glib.Error, #c_vararg var_args: ..any) -> ^glib.List ---

    @(link_name = "secret_password_searchv_sync")
    password_searchv_sync :: proc(schema: ^Schema, attributes: ^glib.HashTable, flags: SearchFlags, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^glib.List ---

    @(link_name = "secret_password_search_finish")
    password_search_finish :: proc(result: ^gio.AsyncResult, error: ^^glib.Error) -> ^glib.List ---

    @(link_name = "secret_password_free")
    password_free :: proc(password: cstring) ---

    @(link_name = "secret_password_wipe")
    password_wipe :: proc(password: cstring) ---

    @(link_name = "secret_retrievable_get_type")
    retrievable_get_type :: proc() -> gobj.Type ---

    @(link_name = "secret_retrievable_retrieve_secret")
    retrievable_retrieve_secret :: proc(self: ^Retrievable, cancellable: ^gio.Cancellable, callback: gio.AsyncReadyCallback, user_data: glib.pointer) ---

    @(link_name = "secret_retrievable_retrieve_secret_finish")
    retrievable_retrieve_secret_finish :: proc(self: ^Retrievable, result: ^gio.AsyncResult, error: ^^glib.Error) -> ^Value ---

    @(link_name = "secret_retrievable_retrieve_secret_sync")
    retrievable_retrieve_secret_sync :: proc(self: ^Retrievable, cancellable: ^gio.Cancellable, error: ^^glib.Error) -> ^Value ---

    @(link_name = "secret_retrievable_get_attributes")
    retrievable_get_attributes :: proc(self: ^Retrievable) -> ^glib.HashTable ---

    @(link_name = "secret_retrievable_get_label")
    retrievable_get_label :: proc(self: ^Retrievable) -> cstring ---

    @(link_name = "secret_retrievable_get_created")
    retrievable_get_created :: proc(self: ^Retrievable) -> glib.uint64 ---

    @(link_name = "secret_retrievable_get_modified")
    retrievable_get_modified :: proc(self: ^Retrievable) -> glib.uint64 ---

    @(link_name = "SECRET_SCHEMA_NOTE")
    SECRET_SCHEMA_NOTE: ^Schema

    @(link_name = "SECRET_SCHEMA_COMPAT_NETWORK")
    SECRET_SCHEMA_COMPAT_NETWORK: ^Schema

    @(link_name = "secret_get_schema")
    get_schema :: proc(type: SchemaType) -> ^Schema ---

}

foreign import secret_runic "system:secret-1"

