module xmud.world;

import std.typecons : Nullable;
import xmud.direction : Direction, opposite;

enum Area
{
    Area1,
    Area2,
    Area3,
}

immutable SPAWN =
    Area.Area1;

/++
 + Return the area that is adjacent to from in direction.
 + If there is no such area, return null.
 +/
nothrow pure @nogc @safe
Nullable!Area path(Area from, Direction direction)
{
    alias R = typeof(return);
    final switch (from) {
        case Area.Area1:
            switch (direction) {
                case Direction.North: return R(Area.Area2);
                case Direction.West:  return R(Area.Area3);
                default: return R.init;
            }

        case Area.Area2:
            switch (direction) {
                case Direction.South: return R(Area.Area1);
                default: return R.init;
            }

        case Area.Area3:
            switch (direction) {
                case Direction.East:  return R(Area.Area1);
                default: return R.init;
            }
    }
}

///
nothrow pure @nogc @safe
unittest
{
    import std.traits : EnumMembers;
    foreach (from; EnumMembers!Area) {
        foreach (direction; EnumMembers!Direction) {
            const to = from.path(direction);
            assert(to.isNull || to.get.path(direction.opposite) == from);
        }
    }
}
