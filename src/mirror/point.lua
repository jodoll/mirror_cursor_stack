Point = {}

function Point:new(position)
    self.object = {}
    setmetatable(self.object, self)
    self.__index = self

    self.position = position

    return self.object
end

function Point:x()
    return self.position[1] or self.position["x"]
end

function Point:y()
    return self.position[2] or self.position["y"]
end

function Point:to_string()
    return "(" .. position:x() .. "|" .. position:y() .. ")"
end