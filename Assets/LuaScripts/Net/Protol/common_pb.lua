--Generated By protoc-gen-lua Do not Edit
local protobuf = require "Common.Tools.protobuf.protobuf"
module('Net.Protol.common_pb')

TEST4 = protobuf.Descriptor();
TEST4_F_FIELD = protobuf.FieldDescriptor();
TEST4_CCC_FIELD = protobuf.FieldDescriptor();
TEST4_CMD_DATA_FIELD = protobuf.FieldDescriptor();
TEST3 = protobuf.Descriptor();
TEST3_D_FIELD = protobuf.FieldDescriptor();
TEST3_CC_FIELD = protobuf.FieldDescriptor();
USER_ONE_LEVEL_EXP = protobuf.Descriptor();
USER_ONE_LEVEL_EXP_RACE_FIELD = protobuf.FieldDescriptor();
USER_ONE_LEVEL_EXP_LEVEL_FIELD = protobuf.FieldDescriptor();
USER_ONE_LEVEL_EXP_EXP_FIELD = protobuf.FieldDescriptor();
USER_LEVEL_RECORD = protobuf.Descriptor();
USER_LEVEL_RECORD_LEVEL_LIST_FIELD = protobuf.FieldDescriptor();
PLAYER_ONE_CARD_INFO = protobuf.Descriptor();
PLAYER_ONE_CARD_INFO_CARD_ID_FIELD = protobuf.FieldDescriptor();
PLAYER_CARD_GROUP = protobuf.Descriptor();
PLAYER_CARD_GROUP_GROUP_ID_FIELD = protobuf.FieldDescriptor();
PLAYER_CARD_GROUP_RACE_FIELD = protobuf.FieldDescriptor();
PLAYER_CARD_GROUP_CARD_LIST_FIELD = protobuf.FieldDescriptor();
PLAYER_CARD_GROUP_GROUP_NAME_FIELD = protobuf.FieldDescriptor();
PLAYER_CARD_GROUP_INIT_TECHNOLOGY_TYPE_FIELD = protobuf.FieldDescriptor();
PLAYER_TECHNOLOGY_INFO = protobuf.Descriptor();
PLAYER_TECHNOLOGY_INFO_ID_FIELD = protobuf.FieldDescriptor();
PLAYER_TECHNOLOGY_INFO_COUNT_FIELD = protobuf.FieldDescriptor();
CLIENT_INFO = protobuf.Descriptor();
CLIENT_INFO_USER_NAME_FIELD = protobuf.FieldDescriptor();
CLIENT_INFO_USE_ICON_FIELD = protobuf.FieldDescriptor();
CLIENT_INFO_YUANBAO_FIELD = protobuf.FieldDescriptor();
CLIENT_INFO_GUILD_ID_FIELD = protobuf.FieldDescriptor();
CLIENT_INFO_GUIDE_NEW_STEP_FIELD = protobuf.FieldDescriptor();
CLIENT_INFO_LEVEL_INFO_FIELD = protobuf.FieldDescriptor();
CLIENT_INFO_CARD_LIST_FIELD = protobuf.FieldDescriptor();
CLIENT_INFO_CARD_GROUP_LIST_FIELD = protobuf.FieldDescriptor();
CLIENT_INFO_LAST_GAME_CARD_GROUP_ID_FIELD = protobuf.FieldDescriptor();
CLIENT_INFO_TECHNOLOGY_LIST_FIELD = protobuf.FieldDescriptor();

TEST4_F_FIELD.name = "f"
TEST4_F_FIELD.full_name = ".common.test4.f"
TEST4_F_FIELD.number = 1
TEST4_F_FIELD.index = 0
TEST4_F_FIELD.label = 1
TEST4_F_FIELD.has_default_value = true
TEST4_F_FIELD.default_value = 0
TEST4_F_FIELD.type = 5
TEST4_F_FIELD.cpp_type = 1

TEST4_CCC_FIELD.name = "ccc"
TEST4_CCC_FIELD.full_name = ".common.test4.ccc"
TEST4_CCC_FIELD.number = 2
TEST4_CCC_FIELD.index = 1
TEST4_CCC_FIELD.label = 1
TEST4_CCC_FIELD.has_default_value = true
TEST4_CCC_FIELD.default_value = "asdasdasd"
TEST4_CCC_FIELD.type = 9
TEST4_CCC_FIELD.cpp_type = 9

TEST4_CMD_DATA_FIELD.name = "cmd_data"
TEST4_CMD_DATA_FIELD.full_name = ".common.test4.cmd_data"
TEST4_CMD_DATA_FIELD.number = 3
TEST4_CMD_DATA_FIELD.index = 2
TEST4_CMD_DATA_FIELD.label = 1
TEST4_CMD_DATA_FIELD.has_default_value = true
TEST4_CMD_DATA_FIELD.default_value = ""
TEST4_CMD_DATA_FIELD.type = 9
TEST4_CMD_DATA_FIELD.cpp_type = 9

TEST4.name = "test4"
TEST4.full_name = ".common.test4"
TEST4.nested_types = {}
TEST4.enum_types = {}
TEST4.fields = {TEST4_F_FIELD, TEST4_CCC_FIELD, TEST4_CMD_DATA_FIELD}
TEST4.is_extendable = false
TEST4.extensions = {}
TEST3_D_FIELD.name = "d"
TEST3_D_FIELD.full_name = ".common.test3.d"
TEST3_D_FIELD.number = 1
TEST3_D_FIELD.index = 0
TEST3_D_FIELD.label = 1
TEST3_D_FIELD.has_default_value = true
TEST3_D_FIELD.default_value = 0
TEST3_D_FIELD.type = 5
TEST3_D_FIELD.cpp_type = 1

TEST3_CC_FIELD.name = "cc"
TEST3_CC_FIELD.full_name = ".common.test3.cc"
TEST3_CC_FIELD.number = 2
TEST3_CC_FIELD.index = 1
TEST3_CC_FIELD.label = 1
TEST3_CC_FIELD.has_default_value = false
TEST3_CC_FIELD.default_value = nil
TEST3_CC_FIELD.message_type = TEST4
TEST3_CC_FIELD.type = 11
TEST3_CC_FIELD.cpp_type = 10

TEST3.name = "test3"
TEST3.full_name = ".common.test3"
TEST3.nested_types = {}
TEST3.enum_types = {}
TEST3.fields = {TEST3_D_FIELD, TEST3_CC_FIELD}
TEST3.is_extendable = false
TEST3.extensions = {}
USER_ONE_LEVEL_EXP_RACE_FIELD.name = "race"
USER_ONE_LEVEL_EXP_RACE_FIELD.full_name = ".common.user_one_level_exp.race"
USER_ONE_LEVEL_EXP_RACE_FIELD.number = 1
USER_ONE_LEVEL_EXP_RACE_FIELD.index = 0
USER_ONE_LEVEL_EXP_RACE_FIELD.label = 1
USER_ONE_LEVEL_EXP_RACE_FIELD.has_default_value = true
USER_ONE_LEVEL_EXP_RACE_FIELD.default_value = 0
USER_ONE_LEVEL_EXP_RACE_FIELD.type = 5
USER_ONE_LEVEL_EXP_RACE_FIELD.cpp_type = 1

USER_ONE_LEVEL_EXP_LEVEL_FIELD.name = "level"
USER_ONE_LEVEL_EXP_LEVEL_FIELD.full_name = ".common.user_one_level_exp.level"
USER_ONE_LEVEL_EXP_LEVEL_FIELD.number = 2
USER_ONE_LEVEL_EXP_LEVEL_FIELD.index = 1
USER_ONE_LEVEL_EXP_LEVEL_FIELD.label = 1
USER_ONE_LEVEL_EXP_LEVEL_FIELD.has_default_value = true
USER_ONE_LEVEL_EXP_LEVEL_FIELD.default_value = 1
USER_ONE_LEVEL_EXP_LEVEL_FIELD.type = 5
USER_ONE_LEVEL_EXP_LEVEL_FIELD.cpp_type = 1

USER_ONE_LEVEL_EXP_EXP_FIELD.name = "exp"
USER_ONE_LEVEL_EXP_EXP_FIELD.full_name = ".common.user_one_level_exp.exp"
USER_ONE_LEVEL_EXP_EXP_FIELD.number = 3
USER_ONE_LEVEL_EXP_EXP_FIELD.index = 2
USER_ONE_LEVEL_EXP_EXP_FIELD.label = 1
USER_ONE_LEVEL_EXP_EXP_FIELD.has_default_value = true
USER_ONE_LEVEL_EXP_EXP_FIELD.default_value = 0
USER_ONE_LEVEL_EXP_EXP_FIELD.type = 5
USER_ONE_LEVEL_EXP_EXP_FIELD.cpp_type = 1

USER_ONE_LEVEL_EXP.name = "user_one_level_exp"
USER_ONE_LEVEL_EXP.full_name = ".common.user_one_level_exp"
USER_ONE_LEVEL_EXP.nested_types = {}
USER_ONE_LEVEL_EXP.enum_types = {}
USER_ONE_LEVEL_EXP.fields = {USER_ONE_LEVEL_EXP_RACE_FIELD, USER_ONE_LEVEL_EXP_LEVEL_FIELD, USER_ONE_LEVEL_EXP_EXP_FIELD}
USER_ONE_LEVEL_EXP.is_extendable = false
USER_ONE_LEVEL_EXP.extensions = {}
USER_LEVEL_RECORD_LEVEL_LIST_FIELD.name = "level_list"
USER_LEVEL_RECORD_LEVEL_LIST_FIELD.full_name = ".common.user_level_record.level_list"
USER_LEVEL_RECORD_LEVEL_LIST_FIELD.number = 1
USER_LEVEL_RECORD_LEVEL_LIST_FIELD.index = 0
USER_LEVEL_RECORD_LEVEL_LIST_FIELD.label = 3
USER_LEVEL_RECORD_LEVEL_LIST_FIELD.has_default_value = false
USER_LEVEL_RECORD_LEVEL_LIST_FIELD.default_value = {}
USER_LEVEL_RECORD_LEVEL_LIST_FIELD.message_type = USER_ONE_LEVEL_EXP
USER_LEVEL_RECORD_LEVEL_LIST_FIELD.type = 11
USER_LEVEL_RECORD_LEVEL_LIST_FIELD.cpp_type = 10

USER_LEVEL_RECORD.name = "user_level_record"
USER_LEVEL_RECORD.full_name = ".common.user_level_record"
USER_LEVEL_RECORD.nested_types = {}
USER_LEVEL_RECORD.enum_types = {}
USER_LEVEL_RECORD.fields = {USER_LEVEL_RECORD_LEVEL_LIST_FIELD}
USER_LEVEL_RECORD.is_extendable = false
USER_LEVEL_RECORD.extensions = {}
PLAYER_ONE_CARD_INFO_CARD_ID_FIELD.name = "card_id"
PLAYER_ONE_CARD_INFO_CARD_ID_FIELD.full_name = ".common.player_one_card_info.card_id"
PLAYER_ONE_CARD_INFO_CARD_ID_FIELD.number = 1
PLAYER_ONE_CARD_INFO_CARD_ID_FIELD.index = 0
PLAYER_ONE_CARD_INFO_CARD_ID_FIELD.label = 1
PLAYER_ONE_CARD_INFO_CARD_ID_FIELD.has_default_value = true
PLAYER_ONE_CARD_INFO_CARD_ID_FIELD.default_value = 0
PLAYER_ONE_CARD_INFO_CARD_ID_FIELD.type = 5
PLAYER_ONE_CARD_INFO_CARD_ID_FIELD.cpp_type = 1

PLAYER_ONE_CARD_INFO.name = "player_one_card_info"
PLAYER_ONE_CARD_INFO.full_name = ".common.player_one_card_info"
PLAYER_ONE_CARD_INFO.nested_types = {}
PLAYER_ONE_CARD_INFO.enum_types = {}
PLAYER_ONE_CARD_INFO.fields = {PLAYER_ONE_CARD_INFO_CARD_ID_FIELD}
PLAYER_ONE_CARD_INFO.is_extendable = false
PLAYER_ONE_CARD_INFO.extensions = {}
PLAYER_CARD_GROUP_GROUP_ID_FIELD.name = "group_id"
PLAYER_CARD_GROUP_GROUP_ID_FIELD.full_name = ".common.player_card_group.group_id"
PLAYER_CARD_GROUP_GROUP_ID_FIELD.number = 1
PLAYER_CARD_GROUP_GROUP_ID_FIELD.index = 0
PLAYER_CARD_GROUP_GROUP_ID_FIELD.label = 1
PLAYER_CARD_GROUP_GROUP_ID_FIELD.has_default_value = true
PLAYER_CARD_GROUP_GROUP_ID_FIELD.default_value = 0
PLAYER_CARD_GROUP_GROUP_ID_FIELD.type = 5
PLAYER_CARD_GROUP_GROUP_ID_FIELD.cpp_type = 1

PLAYER_CARD_GROUP_RACE_FIELD.name = "race"
PLAYER_CARD_GROUP_RACE_FIELD.full_name = ".common.player_card_group.race"
PLAYER_CARD_GROUP_RACE_FIELD.number = 2
PLAYER_CARD_GROUP_RACE_FIELD.index = 1
PLAYER_CARD_GROUP_RACE_FIELD.label = 1
PLAYER_CARD_GROUP_RACE_FIELD.has_default_value = true
PLAYER_CARD_GROUP_RACE_FIELD.default_value = 1
PLAYER_CARD_GROUP_RACE_FIELD.type = 5
PLAYER_CARD_GROUP_RACE_FIELD.cpp_type = 1

PLAYER_CARD_GROUP_CARD_LIST_FIELD.name = "card_list"
PLAYER_CARD_GROUP_CARD_LIST_FIELD.full_name = ".common.player_card_group.card_list"
PLAYER_CARD_GROUP_CARD_LIST_FIELD.number = 3
PLAYER_CARD_GROUP_CARD_LIST_FIELD.index = 2
PLAYER_CARD_GROUP_CARD_LIST_FIELD.label = 3
PLAYER_CARD_GROUP_CARD_LIST_FIELD.has_default_value = false
PLAYER_CARD_GROUP_CARD_LIST_FIELD.default_value = {}
PLAYER_CARD_GROUP_CARD_LIST_FIELD.type = 5
PLAYER_CARD_GROUP_CARD_LIST_FIELD.cpp_type = 1

PLAYER_CARD_GROUP_GROUP_NAME_FIELD.name = "group_name"
PLAYER_CARD_GROUP_GROUP_NAME_FIELD.full_name = ".common.player_card_group.group_name"
PLAYER_CARD_GROUP_GROUP_NAME_FIELD.number = 4
PLAYER_CARD_GROUP_GROUP_NAME_FIELD.index = 3
PLAYER_CARD_GROUP_GROUP_NAME_FIELD.label = 1
PLAYER_CARD_GROUP_GROUP_NAME_FIELD.has_default_value = true
PLAYER_CARD_GROUP_GROUP_NAME_FIELD.default_value = ""
PLAYER_CARD_GROUP_GROUP_NAME_FIELD.type = 9
PLAYER_CARD_GROUP_GROUP_NAME_FIELD.cpp_type = 9

PLAYER_CARD_GROUP_INIT_TECHNOLOGY_TYPE_FIELD.name = "init_technology_type"
PLAYER_CARD_GROUP_INIT_TECHNOLOGY_TYPE_FIELD.full_name = ".common.player_card_group.init_technology_type"
PLAYER_CARD_GROUP_INIT_TECHNOLOGY_TYPE_FIELD.number = 5
PLAYER_CARD_GROUP_INIT_TECHNOLOGY_TYPE_FIELD.index = 4
PLAYER_CARD_GROUP_INIT_TECHNOLOGY_TYPE_FIELD.label = 1
PLAYER_CARD_GROUP_INIT_TECHNOLOGY_TYPE_FIELD.has_default_value = true
PLAYER_CARD_GROUP_INIT_TECHNOLOGY_TYPE_FIELD.default_value = 0
PLAYER_CARD_GROUP_INIT_TECHNOLOGY_TYPE_FIELD.type = 5
PLAYER_CARD_GROUP_INIT_TECHNOLOGY_TYPE_FIELD.cpp_type = 1

PLAYER_CARD_GROUP.name = "player_card_group"
PLAYER_CARD_GROUP.full_name = ".common.player_card_group"
PLAYER_CARD_GROUP.nested_types = {}
PLAYER_CARD_GROUP.enum_types = {}
PLAYER_CARD_GROUP.fields = {PLAYER_CARD_GROUP_GROUP_ID_FIELD, PLAYER_CARD_GROUP_RACE_FIELD, PLAYER_CARD_GROUP_CARD_LIST_FIELD, PLAYER_CARD_GROUP_GROUP_NAME_FIELD, PLAYER_CARD_GROUP_INIT_TECHNOLOGY_TYPE_FIELD}
PLAYER_CARD_GROUP.is_extendable = false
PLAYER_CARD_GROUP.extensions = {}
PLAYER_TECHNOLOGY_INFO_ID_FIELD.name = "id"
PLAYER_TECHNOLOGY_INFO_ID_FIELD.full_name = ".common.player_technology_info.id"
PLAYER_TECHNOLOGY_INFO_ID_FIELD.number = 1
PLAYER_TECHNOLOGY_INFO_ID_FIELD.index = 0
PLAYER_TECHNOLOGY_INFO_ID_FIELD.label = 1
PLAYER_TECHNOLOGY_INFO_ID_FIELD.has_default_value = true
PLAYER_TECHNOLOGY_INFO_ID_FIELD.default_value = 0
PLAYER_TECHNOLOGY_INFO_ID_FIELD.type = 5
PLAYER_TECHNOLOGY_INFO_ID_FIELD.cpp_type = 1

PLAYER_TECHNOLOGY_INFO_COUNT_FIELD.name = "count"
PLAYER_TECHNOLOGY_INFO_COUNT_FIELD.full_name = ".common.player_technology_info.count"
PLAYER_TECHNOLOGY_INFO_COUNT_FIELD.number = 2
PLAYER_TECHNOLOGY_INFO_COUNT_FIELD.index = 1
PLAYER_TECHNOLOGY_INFO_COUNT_FIELD.label = 1
PLAYER_TECHNOLOGY_INFO_COUNT_FIELD.has_default_value = true
PLAYER_TECHNOLOGY_INFO_COUNT_FIELD.default_value = 0
PLAYER_TECHNOLOGY_INFO_COUNT_FIELD.type = 5
PLAYER_TECHNOLOGY_INFO_COUNT_FIELD.cpp_type = 1

PLAYER_TECHNOLOGY_INFO.name = "player_technology_info"
PLAYER_TECHNOLOGY_INFO.full_name = ".common.player_technology_info"
PLAYER_TECHNOLOGY_INFO.nested_types = {}
PLAYER_TECHNOLOGY_INFO.enum_types = {}
PLAYER_TECHNOLOGY_INFO.fields = {PLAYER_TECHNOLOGY_INFO_ID_FIELD, PLAYER_TECHNOLOGY_INFO_COUNT_FIELD}
PLAYER_TECHNOLOGY_INFO.is_extendable = false
PLAYER_TECHNOLOGY_INFO.extensions = {}
CLIENT_INFO_USER_NAME_FIELD.name = "user_name"
CLIENT_INFO_USER_NAME_FIELD.full_name = ".common.client_info.user_name"
CLIENT_INFO_USER_NAME_FIELD.number = 7
CLIENT_INFO_USER_NAME_FIELD.index = 0
CLIENT_INFO_USER_NAME_FIELD.label = 1
CLIENT_INFO_USER_NAME_FIELD.has_default_value = true
CLIENT_INFO_USER_NAME_FIELD.default_value = ""
CLIENT_INFO_USER_NAME_FIELD.type = 9
CLIENT_INFO_USER_NAME_FIELD.cpp_type = 9

CLIENT_INFO_USE_ICON_FIELD.name = "use_icon"
CLIENT_INFO_USE_ICON_FIELD.full_name = ".common.client_info.use_icon"
CLIENT_INFO_USE_ICON_FIELD.number = 8
CLIENT_INFO_USE_ICON_FIELD.index = 1
CLIENT_INFO_USE_ICON_FIELD.label = 1
CLIENT_INFO_USE_ICON_FIELD.has_default_value = true
CLIENT_INFO_USE_ICON_FIELD.default_value = 0
CLIENT_INFO_USE_ICON_FIELD.type = 5
CLIENT_INFO_USE_ICON_FIELD.cpp_type = 1

CLIENT_INFO_YUANBAO_FIELD.name = "yuanbao"
CLIENT_INFO_YUANBAO_FIELD.full_name = ".common.client_info.yuanbao"
CLIENT_INFO_YUANBAO_FIELD.number = 21
CLIENT_INFO_YUANBAO_FIELD.index = 2
CLIENT_INFO_YUANBAO_FIELD.label = 1
CLIENT_INFO_YUANBAO_FIELD.has_default_value = true
CLIENT_INFO_YUANBAO_FIELD.default_value = 0
CLIENT_INFO_YUANBAO_FIELD.type = 5
CLIENT_INFO_YUANBAO_FIELD.cpp_type = 1

CLIENT_INFO_GUILD_ID_FIELD.name = "guild_id"
CLIENT_INFO_GUILD_ID_FIELD.full_name = ".common.client_info.guild_id"
CLIENT_INFO_GUILD_ID_FIELD.number = 30
CLIENT_INFO_GUILD_ID_FIELD.index = 3
CLIENT_INFO_GUILD_ID_FIELD.label = 1
CLIENT_INFO_GUILD_ID_FIELD.has_default_value = true
CLIENT_INFO_GUILD_ID_FIELD.default_value = 0
CLIENT_INFO_GUILD_ID_FIELD.type = 5
CLIENT_INFO_GUILD_ID_FIELD.cpp_type = 1

CLIENT_INFO_GUIDE_NEW_STEP_FIELD.name = "guide_new_step"
CLIENT_INFO_GUIDE_NEW_STEP_FIELD.full_name = ".common.client_info.guide_new_step"
CLIENT_INFO_GUIDE_NEW_STEP_FIELD.number = 39
CLIENT_INFO_GUIDE_NEW_STEP_FIELD.index = 4
CLIENT_INFO_GUIDE_NEW_STEP_FIELD.label = 1
CLIENT_INFO_GUIDE_NEW_STEP_FIELD.has_default_value = true
CLIENT_INFO_GUIDE_NEW_STEP_FIELD.default_value = 0
CLIENT_INFO_GUIDE_NEW_STEP_FIELD.type = 5
CLIENT_INFO_GUIDE_NEW_STEP_FIELD.cpp_type = 1

CLIENT_INFO_LEVEL_INFO_FIELD.name = "level_info"
CLIENT_INFO_LEVEL_INFO_FIELD.full_name = ".common.client_info.level_info"
CLIENT_INFO_LEVEL_INFO_FIELD.number = 46
CLIENT_INFO_LEVEL_INFO_FIELD.index = 5
CLIENT_INFO_LEVEL_INFO_FIELD.label = 1
CLIENT_INFO_LEVEL_INFO_FIELD.has_default_value = false
CLIENT_INFO_LEVEL_INFO_FIELD.default_value = nil
CLIENT_INFO_LEVEL_INFO_FIELD.message_type = USER_LEVEL_RECORD
CLIENT_INFO_LEVEL_INFO_FIELD.type = 11
CLIENT_INFO_LEVEL_INFO_FIELD.cpp_type = 10

CLIENT_INFO_CARD_LIST_FIELD.name = "card_list"
CLIENT_INFO_CARD_LIST_FIELD.full_name = ".common.client_info.card_list"
CLIENT_INFO_CARD_LIST_FIELD.number = 201
CLIENT_INFO_CARD_LIST_FIELD.index = 6
CLIENT_INFO_CARD_LIST_FIELD.label = 3
CLIENT_INFO_CARD_LIST_FIELD.has_default_value = false
CLIENT_INFO_CARD_LIST_FIELD.default_value = {}
CLIENT_INFO_CARD_LIST_FIELD.message_type = PLAYER_ONE_CARD_INFO
CLIENT_INFO_CARD_LIST_FIELD.type = 11
CLIENT_INFO_CARD_LIST_FIELD.cpp_type = 10

CLIENT_INFO_CARD_GROUP_LIST_FIELD.name = "card_group_list"
CLIENT_INFO_CARD_GROUP_LIST_FIELD.full_name = ".common.client_info.card_group_list"
CLIENT_INFO_CARD_GROUP_LIST_FIELD.number = 202
CLIENT_INFO_CARD_GROUP_LIST_FIELD.index = 7
CLIENT_INFO_CARD_GROUP_LIST_FIELD.label = 3
CLIENT_INFO_CARD_GROUP_LIST_FIELD.has_default_value = false
CLIENT_INFO_CARD_GROUP_LIST_FIELD.default_value = {}
CLIENT_INFO_CARD_GROUP_LIST_FIELD.message_type = PLAYER_CARD_GROUP
CLIENT_INFO_CARD_GROUP_LIST_FIELD.type = 11
CLIENT_INFO_CARD_GROUP_LIST_FIELD.cpp_type = 10

CLIENT_INFO_LAST_GAME_CARD_GROUP_ID_FIELD.name = "last_game_card_group_id"
CLIENT_INFO_LAST_GAME_CARD_GROUP_ID_FIELD.full_name = ".common.client_info.last_game_card_group_id"
CLIENT_INFO_LAST_GAME_CARD_GROUP_ID_FIELD.number = 203
CLIENT_INFO_LAST_GAME_CARD_GROUP_ID_FIELD.index = 8
CLIENT_INFO_LAST_GAME_CARD_GROUP_ID_FIELD.label = 1
CLIENT_INFO_LAST_GAME_CARD_GROUP_ID_FIELD.has_default_value = true
CLIENT_INFO_LAST_GAME_CARD_GROUP_ID_FIELD.default_value = 0
CLIENT_INFO_LAST_GAME_CARD_GROUP_ID_FIELD.type = 5
CLIENT_INFO_LAST_GAME_CARD_GROUP_ID_FIELD.cpp_type = 1

CLIENT_INFO_TECHNOLOGY_LIST_FIELD.name = "technology_list"
CLIENT_INFO_TECHNOLOGY_LIST_FIELD.full_name = ".common.client_info.technology_list"
CLIENT_INFO_TECHNOLOGY_LIST_FIELD.number = 301
CLIENT_INFO_TECHNOLOGY_LIST_FIELD.index = 9
CLIENT_INFO_TECHNOLOGY_LIST_FIELD.label = 3
CLIENT_INFO_TECHNOLOGY_LIST_FIELD.has_default_value = false
CLIENT_INFO_TECHNOLOGY_LIST_FIELD.default_value = {}
CLIENT_INFO_TECHNOLOGY_LIST_FIELD.message_type = PLAYER_TECHNOLOGY_INFO
CLIENT_INFO_TECHNOLOGY_LIST_FIELD.type = 11
CLIENT_INFO_TECHNOLOGY_LIST_FIELD.cpp_type = 10

CLIENT_INFO.name = "client_info"
CLIENT_INFO.full_name = ".common.client_info"
CLIENT_INFO.nested_types = {}
CLIENT_INFO.enum_types = {}
CLIENT_INFO.fields = {CLIENT_INFO_USER_NAME_FIELD, CLIENT_INFO_USE_ICON_FIELD, CLIENT_INFO_YUANBAO_FIELD, CLIENT_INFO_GUILD_ID_FIELD, CLIENT_INFO_GUIDE_NEW_STEP_FIELD, CLIENT_INFO_LEVEL_INFO_FIELD, CLIENT_INFO_CARD_LIST_FIELD, CLIENT_INFO_CARD_GROUP_LIST_FIELD, CLIENT_INFO_LAST_GAME_CARD_GROUP_ID_FIELD, CLIENT_INFO_TECHNOLOGY_LIST_FIELD}
CLIENT_INFO.is_extendable = false
CLIENT_INFO.extensions = {}

client_info = protobuf.Message(CLIENT_INFO)
player_card_group = protobuf.Message(PLAYER_CARD_GROUP)
player_one_card_info = protobuf.Message(PLAYER_ONE_CARD_INFO)
player_technology_info = protobuf.Message(PLAYER_TECHNOLOGY_INFO)
test3 = protobuf.Message(TEST3)
test4 = protobuf.Message(TEST4)
user_level_record = protobuf.Message(USER_LEVEL_RECORD)
user_one_level_exp = protobuf.Message(USER_ONE_LEVEL_EXP)

