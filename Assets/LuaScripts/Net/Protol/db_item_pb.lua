--Generated By protoc-gen-lua Do not Edit
local protobuf = require "Common.Tools.protobuf.protobuf"
module('Net.Protol.db_item_pb')

ONE_ITEM = protobuf.Descriptor();
ONE_ITEM_ITEM_ID_FIELD = protobuf.FieldDescriptor();
ONE_ITEM_COUNT_FIELD = protobuf.FieldDescriptor();
ITEM = protobuf.Descriptor();
ITEM_ITEM_LIST_FIELD = protobuf.FieldDescriptor();

ONE_ITEM_ITEM_ID_FIELD.name = "item_id"
ONE_ITEM_ITEM_ID_FIELD.full_name = ".db.one_item.item_id"
ONE_ITEM_ITEM_ID_FIELD.number = 1
ONE_ITEM_ITEM_ID_FIELD.index = 0
ONE_ITEM_ITEM_ID_FIELD.label = 1
ONE_ITEM_ITEM_ID_FIELD.has_default_value = true
ONE_ITEM_ITEM_ID_FIELD.default_value = 0
ONE_ITEM_ITEM_ID_FIELD.type = 5
ONE_ITEM_ITEM_ID_FIELD.cpp_type = 1

ONE_ITEM_COUNT_FIELD.name = "count"
ONE_ITEM_COUNT_FIELD.full_name = ".db.one_item.count"
ONE_ITEM_COUNT_FIELD.number = 2
ONE_ITEM_COUNT_FIELD.index = 1
ONE_ITEM_COUNT_FIELD.label = 1
ONE_ITEM_COUNT_FIELD.has_default_value = true
ONE_ITEM_COUNT_FIELD.default_value = 0
ONE_ITEM_COUNT_FIELD.type = 5
ONE_ITEM_COUNT_FIELD.cpp_type = 1

ONE_ITEM.name = "one_item"
ONE_ITEM.full_name = ".db.one_item"
ONE_ITEM.nested_types = {}
ONE_ITEM.enum_types = {}
ONE_ITEM.fields = {ONE_ITEM_ITEM_ID_FIELD, ONE_ITEM_COUNT_FIELD}
ONE_ITEM.is_extendable = false
ONE_ITEM.extensions = {}
ITEM_ITEM_LIST_FIELD.name = "item_list"
ITEM_ITEM_LIST_FIELD.full_name = ".db.Item.item_list"
ITEM_ITEM_LIST_FIELD.number = 1
ITEM_ITEM_LIST_FIELD.index = 0
ITEM_ITEM_LIST_FIELD.label = 3
ITEM_ITEM_LIST_FIELD.has_default_value = false
ITEM_ITEM_LIST_FIELD.default_value = {}
ITEM_ITEM_LIST_FIELD.message_type = ONE_ITEM
ITEM_ITEM_LIST_FIELD.type = 11
ITEM_ITEM_LIST_FIELD.cpp_type = 10

ITEM.name = "Item"
ITEM.full_name = ".db.Item"
ITEM.nested_types = {}
ITEM.enum_types = {}
ITEM.fields = {ITEM_ITEM_LIST_FIELD}
ITEM.is_extendable = false
ITEM.extensions = {}

Item = protobuf.Message(ITEM)
one_item = protobuf.Message(ONE_ITEM)

