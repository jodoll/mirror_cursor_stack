Direction = {}

function Direction.mirror_horizontal(direction)
    if direction == defines.direction.north then
        return defines.direction.north
    elseif direction == defines.direction.northeast then
        return defines.direction.northwest
    elseif direction == defines.direction.east then
        return defines.direction.west
    elseif direction == defines.direction.southeast then
        return defines.direction.southwest
    elseif direction == defines.direction.south then
        return defines.direction.south
    elseif direction == defines.direction.southwest then
        return defines.direction.southeast
    elseif direction == defines.direction.west then
        return defines.direction.east
    elseif direction == defines.direction.northwest then
        return defines.direction.northeast
    end
end

function Direction.mirror_vertical(direction)
    if Direction:is_horizontal_direction(direction) then
        return direction
    elseif Direction:is_vertical_Direction(direction) then
        return (direction + 4) % 8
    else
        return (direction + 2) % 8
    end
end

function Direction.is_vertical_direction(direction)
    return defines.direction.north == direction or defines.direction.south == direction
end

function Direction.is_horizontal_direction(direction)
    return defines.direction.west == direction or defines.direction.east == direction
end