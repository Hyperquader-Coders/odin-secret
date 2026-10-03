#+test
package secret

import "core:strings"
import "core:testing"

import glib "glib:glib"
import gobj "glib:gobject"

// Version recorded in README.md: "**Bound version:** X.Y.Z".
README :: #load("../README.md", string)

bound_version :: proc() -> (major, minor, micro: int, ok: bool) {
	marker :: "**Bound version:** "
	readme := README
	i := strings.index(readme, marker)
	if i < 0 do return
	rest := readme[i + len(marker):]
	end := strings.index_any(rest, " \n")
	if end < 0 do return
	parts := strings.split(rest[:end], ".", context.temp_allocator)
	if len(parts) != 3 do return
	nums: [3]int
	for p, n in parts {
		v := 0
		if len(p) == 0 do return
		for c in p {
			if c < '0' || c > '9' do return
			v = v * 10 + int(c - '0')
		}
		nums[n] = v
	}
	return nums[0], nums[1], nums[2], true
}

@(test)
test_readme_version_matches_header_macros :: proc(t: ^testing.T) {
	major, minor, micro, ok := bound_version()
	testing.expect(t, ok, "README.md has no '**Bound version:** X.Y.Z'")
	testing.expect_value(t, major, MAJOR_VERSION)
	testing.expect_value(t, minor, MINOR_VERSION)
	testing.expect_value(t, micro, MICRO_VERSION)
}

@(test)
test_library_loads_and_registers_types :: proc(t: ^testing.T) {
	testing.expect(t, TYPE_VALUE() != 0)
	testing.expect(t, TYPE_SERVICE() != 0)
	testing.expect(t, TYPE_COLLECTION() != 0)
	testing.expect(t, TYPE_ITEM() != 0)
	testing.expect(t, TYPE_SEARCH_FLAGS() != 0)
	testing.expect(t, ERROR() != 0)
	testing.expect_value(t, string(gobj.type_name(TYPE_VALUE())), "SecretValue")
}

@(test)
test_builtin_schemas :: proc(t: ^testing.T) {
	note := get_schema(.NOTE)
	testing.expect(t, note != nil)
	testing.expect_value(t, string(note.name), "org.gnome.keyring.Note")
	net := get_schema(.COMPAT_NETWORK)
	testing.expect(t, net != nil)
	testing.expect_value(t, string(net.name), "org.gnome.keyring.NetworkPassword")
}

@(test)
test_schema_new_and_unref :: proc(t: ^testing.T) {
	schema := schema_new("org.amber.Test", SCHEMA_NONE, cstring("account"), SchemaAttributeType.SCHEMA_ATTRIBUTE_STRING, cstring(nil))
	testing.expect(t, schema != nil)
	testing.expect_value(t, string(schema.name), "org.amber.Test")
	testing.expect_value(t, string(schema.attributes[0].name), "account")
	testing.expect_value(t, schema.attributes[0].type, SchemaAttributeType.SCHEMA_ATTRIBUTE_STRING)
	schema_unref(schema)
}

@(test)
test_value_roundtrip :: proc(t: ^testing.T) {
	text := "hunter2"
	value := value_new(raw_data(text), glib.ssize(len(text)), "text/plain")
	testing.expect(t, value != nil)
	defer value_unref(value)

	length: glib.size
	data := value_get(value, &length)
	testing.expect_value(t, int(length), len(text))
	testing.expect_value(t, string((cast([^]byte)data)[:length]), text)
	testing.expect_value(t, string(value_get_content_type(value)), "text/plain")
}

// Flag enums are bit_sets of the C bits (docs/DECISIONS.md §2): the size is that of the C enum
// (4 bytes) and a member's index is the position of its bit in the header (secret-types.h, secret-schema.h, secret-service.h, secret-collection.h, secret-item.h).

bits :: proc(s: $S) -> u32 {
    return transmute(u32)s
}

@(test)
test_flag_sets_are_the_size_of_the_c_enum :: proc(t: ^testing.T) {
    testing.expect_value(t, size_of(SchemaFlags), 4)
    testing.expect_value(t, size_of(SearchFlags), 4)
    testing.expect_value(t, size_of(ServiceFlags), 4)
    testing.expect_value(t, size_of(CollectionFlags), 4)
    testing.expect_value(t, size_of(ItemFlags), 4)
    testing.expect_value(t, size_of(ItemCreateFlags), 4)
}

@(test)
test_flag_bits_match_the_header :: proc(t: ^testing.T) {
    testing.expect_value(t, bits(SchemaFlags{.SCHEMA_DONT_MATCH_NAME}), 1 << 1)
    testing.expect_value(t, bits(SearchFlags{.SEARCH_ALL}), 1 << 1)
    testing.expect_value(t, bits(SearchFlags{.SEARCH_UNLOCK}), 1 << 2)
    testing.expect_value(t, bits(SearchFlags{.SEARCH_LOAD_SECRETS}), 1 << 3)
    testing.expect_value(t, bits(ServiceFlags{.SERVICE_OPEN_SESSION}), 1 << 1)
    testing.expect_value(t, bits(ServiceFlags{.SERVICE_LOAD_COLLECTIONS}), 1 << 2)
    testing.expect_value(t, bits(CollectionFlags{.COLLECTION_LOAD_ITEMS}), 1 << 1)
    testing.expect_value(t, bits(ItemFlags{.ITEM_LOAD_SECRET}), 1 << 1)
    testing.expect_value(t, bits(ItemCreateFlags{.ITEM_CREATE_REPLACE}), 1 << 1)
}

@(test)
test_zero_members_are_the_empty_set :: proc(t: ^testing.T) {
    testing.expect_value(t, SCHEMA_NONE, SchemaFlags{})
    testing.expect_value(t, SEARCH_NONE, SearchFlags{})
    testing.expect_value(t, SERVICE_NONE, ServiceFlags{})
    testing.expect_value(t, COLLECTION_NONE, CollectionFlags{})
    testing.expect_value(t, ITEM_NONE, ItemFlags{})
    testing.expect_value(t, ITEM_CREATE_NONE, ItemCreateFlags{})
}
