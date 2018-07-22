MirrorFunction = {}

function MirrorFunction:new(object)
    self.object = object or {}
    setmetatable(self.object, self)
    self.__index = self
    return self.object
end

function MirrorFunction:mirror()
    print("super")
end