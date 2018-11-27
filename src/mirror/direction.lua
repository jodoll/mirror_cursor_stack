Direction = {}

function Direction.mirror_horizontal(direction)
    if Direction:is_vertical_direction(direction) then
        return direction
    elseif Direction:is_horizontal_direction(direction) then
        return (direction + 4) % 8
    else
        return (direction + 2) % 8
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