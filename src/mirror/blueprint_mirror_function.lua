require("mirror.mirror_function")
require("mirror.point")

BluePrintMirrorFunction = MirrorFunction:new()

function BluePrintMirrorFunction:new(entities)
    self.entities = entities
    return self.object
end

function BluePrintMirrorFunction:mirror_horizontal()
    local result = ""
    for key, entity in pairs(self.entities) do
        --self:mirror_position_horizontal(Point:new(entity))
        result = result .. self:entity_to_string(entity)
    end
    return result
end

function BluePrintMirrorFunction:mirror_position_horizontal(point)
end

function BluePrintMirrorFunction:entity_to_string(entity)
    local position = Point:new(entity.position)
    local name = entity.name

    local result = "Entity: " .. name
    return result .. " Position: " .. position:to_string()
end