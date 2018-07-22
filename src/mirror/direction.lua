Direction = {}

function Direction.mirror_horizontal(direction)
    if defines.direction.north == direction or defines.direction.south == direction then
        return direction
    elseif defines.direction.west == direction or defines.direction.east == direction then
        return (direction + 4) % 8
    else
        return (direction + 2) % 8
    end
end

function Direction.mirror_vertical(direction)
    if defines.direction.west == direction or defines.direction.east == direction then
        return direction
    elseif defines.direction.north == direction or defines.direction.south == direction then
        return (direction + 4) % 8
    else
        return (direction + 2) % 8
    end
end