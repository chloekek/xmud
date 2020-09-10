module xmud.direction;

enum Direction
{
    North,
    South,
    West,
    East,
}

/++
 + Return the opposite direction of direction.
 +/
nothrow pure @nogc @safe
Direction opposite(Direction direction)
{
    final switch (direction) {
        case Direction.North: return Direction.South;
        case Direction.South: return Direction.North;
        case Direction.West:  return Direction.East;
        case Direction.East:  return Direction.West;
    }
}

///
nothrow pure @nogc @safe
unittest
{
    import std.traits : EnumMembers;
    foreach (direction; EnumMembers!Direction)
        assert(direction.opposite.opposite == direction);
}
