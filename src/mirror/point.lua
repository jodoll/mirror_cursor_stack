local function get_accessors(position)
    if (position["x"] ~= nil) then
        return { x = "x", y = "y" }
    else
        return { x = 1, y = 2 }
    end
end

Point = {}

function Point:new(position)
    self.object = {}
    setmetatable(self.object, self)
    self.__index = self

    self.position = position
    self.accessors = get_accessors(position)

    return self.object
end

function Point:x()
    return self.position[self.accessors.x]
end

function Point:y()
    return self.position[self.accessors.y]
end

function Point:set_x(value)
    self.position[self.accessors.x] = value
end

function Point:set_y(value)
    self.position[self.accessors.y] = value
end

function Point:mirror_horizontal()
    self:set_x(self:x() * -1)
end

function Point:mirror_vertical()
    self:set_y(self:y() * -1)
end


function Point:to_string()
    return "(" .. self:x() .. "|" .. self:y() .. ")"
end