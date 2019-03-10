require("mirror.mirror_function")
require("mirror.direction")
require("mirror.point")

BluePrintMirrorFunction = MirrorFunction:new()

function BluePrintMirrorFunction:new(entities)
    self.entities = entities
    return self.object
end

function BluePrintMirrorFunction:mirror_horizontal()
    for key, entity in pairs(self.entities) do
        self:mirror_position_horizontal(entity.position)
        self:mirror_direction_horizontal(entity)
    end
end

function BluePrintMirrorFunction:mirror_position_horizontal(position)
    local point = Point:new(position)
    point:mirror_horizontal()
end

function BluePrintMirrorFunction:mirror_direction_horizontal(entity)
    print(self:entity_to_string(entity))
    if entity.direction ~= nil then
        entity.direction = Direction.mirror_horizontal(entity.direction)
    end
end

function BluePrintMirrorFunction:mirror_vertical()
    for key, entity in pairs(self.entities) do
        self:mirror_position_vertical(entity.position)
        self:mirror_direction_vertical(entity)
    end
end

function BluePrintMirrorFunction:mirror_position_vertical(position)
    local point = Point:new(position)
    point:mirror_vertical()
end

function BluePrintMirrorFunction:mirror_direction_vertical(entity)
    print(self:entity_to_string(entity))
    -- direction may be nil when facing north
    -- also when rotating a blueprint the directions of its entities do NOT change, the rotation of the blueprint is added instead
    entity.direction = Direction.mirror_vertical(entity.direction or 0)
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