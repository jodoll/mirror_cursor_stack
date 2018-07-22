require("lunit")
module("sample_test", lunit.testcase, package.seeall)

function test_addition()
    local number = 1 + 1
    assert_equal(2, number)
end