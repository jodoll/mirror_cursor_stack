local defines = {
    input = {
        mirror_horizontal_a = "input-event-mirror-item-horizontal-a",
        mirror_horizontal_d = "input-event-mirror-item-horizontal-d",
        mirror_vertical_w = "input-event-mirror-item-vertical-w",
        mirror_vertical_s = "input-event-mirror-item-vertical-s"
    }
}

-- only add this in data phase not during runtime
if (data ~= nil) then
    data:extend({
        {
            type = "custom-input",
            name = defines.input.mirror_horizontal_a,
            key_sequence = "SHIFT + A",
            consuming = "all"

        },
        {
            type = "custom-input",
            name = defines.input.mirror_horizontal_d,
            key_sequence = "SHIFT + D",
            consuming = "all"

        },
        {
            type = "custom-input",
            name = defines.input.mirror_vertical_w,
            key_sequence = "SHIFT + W",
            consuming = "all"

        },
        {
            type = "custom-input",
            name = defines.input.mirror_vertical_s,
            key_sequence = "SHIFT + S",
            consuming = "all"

        }
    })
end

return defines