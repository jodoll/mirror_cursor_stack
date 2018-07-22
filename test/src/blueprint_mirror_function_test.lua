package.path = "../../src/?.lua;" .. package.path

require("lunit")
module("blueprint_mirror_function_test", lunit.testcase, package.seeall)

require("mirror.blueprint_mirror_function")

function test_is_working()
    BluePrintMirrorFunction.mirror({})
end

function test_is_working()
    BluePrintMirrorFunction.mirror({})
end