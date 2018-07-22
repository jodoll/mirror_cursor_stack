package.path = "../../src/?.lua;" .. package.path

require("lunit")
module("defines_test", lunit.testcase, package.seeall)

require("helper.mock_data"):init_mock()
local defines = require("data")

function test_defines_object()
    assert_equal("input-event-mirror-item", defines.input.mirror)
end