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

function on_mirror_item(event)
    local player = get_current_player(event)
    local current_item = player.cursor_stack

    if current_item.is_blueprint then
        local mirror_function = BluePrintMirrorFunction:new(current_item.get_blueprint_entities())
        mirror_function:mirror_horizontal()
        current_item.set_blueprint_entities(mirror_function.entities)
    end
end

script.on_event(custom_defines.input.mirror, on_mirror_item)
script.on_event(defines.events.on_player_mined_item, on_item_mined)
