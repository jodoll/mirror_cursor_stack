local defines = {
    input = {
        mirror = "input-event-mirror-item"
    }
}

-- only add this in data phase not during runtime
if (data ~= nil) then
    data:extend({
        {
            type = "custom-input",
            name = defines.input.mirror,
            key_sequence = "SHIFT + R",
            consuming = "all"

        }
    })
end

return defines