require("mirror.mirror_function")
require("mirror.direction")
require("mirror.point")

BluePrintMirrorFunction = MirrorFunction:new()

function BluePrintMirrorFunction:new(entities, direction, vertical)
    self.entities = entities
    self.direction = direction
    self.requested_vertical_mirroring = vertical
    return self.object
end

function BluePrintMirrorFunction:mirror()
    self.mirror_actually_vertical = self:calculate_actual_mirror_direction()
    self:mirror_all_entities()
end

function BluePrintMirrorFunction:calculate_actual_mirror_direction()
    local invert_axis = direction == defines.direction.north or direction == defines.direction.south or direction == nil
    return self.requested_vertical_mirroring ~= invert_axis
end

function BluePrintMirrorFunction:mirror_all_entities()
    for key, entity in pairs(self.entities) do
        self:mirror_position(entity.position)
        self:mirror_direction(entity)
    end
end

function BluePrintMirrorFunction:mirror_position(position)
    local point = Point:new(position)

    if mirror_actually_vertical then
        point:mirror_vertical()
    else
        point:mirror_horizontal()
    end
end

function BluePrintMirrorFunction:mirror_direction(entity)
    -- direction may be nil when facing north
    -- Also: setting direction on entity without a direction doesn't hurt
    local currentDirection = entity.direction or defines.direction.north

    if mirror_actually_vertical then
        entity.direction = Direction.mirror_vertical(currentDirection)
    else
        entity.direction = Direction.mirror_horizontal(currentDirection)
    end
end

function BluePrintMirrorFunction:print_entities()
    local result = ""
    for key, entity in pairs(self.entities) do
        result = result .. self:entity_to_string(entity)
    end
    return result
end

function BluePrintMirrorFunction:entity_to_string(entity)
    local position = Point:new(entity.position)
    local name = entity.name

    local name = "Entity: " .. name
    local position = "Position: " .. position:to_string()
    local direction = "Direction: " .. self:direction_to_string(entity.direction)
    return name .. " | " .. position .. " | " .. direction
end

function BluePrintMirrorFunction:direction_to_string(direction)
    if direction == nil then
        return "nil"
    else
        return game.direction_to_string(direction)
    end
end