local function get_accessors(position)
    if (position["x"] ~= nil) then
        return { "x", "y" }
    else
        return { 1, 2 }
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
    return self.position[self.accessors[1]]
end

function Point:y()
    return self.position[self.accessors[2]]
end

function Point:to_string()
    return "(" .. self:x() .. "|" .. self:y() .. ")"
end