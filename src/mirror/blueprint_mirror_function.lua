require("mirror.mirror_function")
require("mirror.point")

BluePrintMirrorFunction = MirrorFunction:new()

function BluePrintMirrorFunction:new(entities)
    self.entities = entities
    return self.object
end

function BluePrintMirrorFunction:mirror_horizontal()
    for key, entity in pairs(self.entities) do
        self:mirror_position_horizontal(entity.position)
    end
end

function BluePrintMirrorFunction:mirror_position_horizontal(position)
    local point = Point:new(position)
    point:mirror_horizontal()
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

    local result = "Entity: " .. name
    return result .. " Position: " .. position:to_string()
end