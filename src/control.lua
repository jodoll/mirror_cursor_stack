require("mirror.blueprint_mirror_function")
local string_helper = require("helper.string-helper")
local custom_defines = require("data")

local function get_current_player(event)
    return game.players[event.player_index]
end

local function on_item_mined(event)
    local player = get_current_player(event)
    local item = event.item_stack
    local name = player.name

    if string_helper.isEmpty(name) then
        name = "<Unnamed Player>"
    end

    player.print(name .. " mined " .. item.count .. " " .. item.name)
end

function mirror_stack(item_stack, vertical)


    if item_stack.is_blueprint then
        local mirror_function = BluePrintMirrorFunction:new(item_stack.get_blueprint_entities(), defines.direction.north, vertical)
        mirror_function:mirror()
        item_stack.set_blueprint_entities(mirror_function.entities)
    end
end

function get_cursor_stack(event)
    local player = get_current_player(event)
    return player.cursor_stack
end

function on_mirror_item_horizontal(event)
    local stack = get_cursor_stack(event)
    mirror_stack(stack, false)
end

function on_mirror_item_vertical(event)
    local stack = get_cursor_stack(event)
    mirror_stack(stack, true)
end

--script.on_event(custom_defines.input.mirror_horizontal_a, on_mirror_item_horizontal)
script.on_event(custom_defines.input.mirror_horizontal_d, on_mirror_item_horizontal)
--script.on_event(custom_defines.input.mirror_vertical_w, on_mirror_item_vertical)
--script.on_event(custom_defines.input.mirror_vertical_s, on_mirror_item_vertical)
script.on_event(defines.events.on_player_mined_item, on_item_mined)
