module xmud.world;

import std.typecons : Nullable;
import xmud.artifact : Artifacts;
import xmud.direction : Direction, opposite;

enum Area
{
    Area1,
    Area2,
}

nothrow pure @nogc @safe
immutable(char)[] name(Area area)
{
    final switch (area) {
        case Area.Area1: return "Area 1";
        case Area.Area2: return "Area 2";
    }
}

nothrow pure @nogc @safe
immutable(char)[] description(Area area)
{
    final switch (area) {
        case Area.Area1:
            return (
                "It is foggy and noisy here. " ~
                "The area is lit up by billboards. " ~
                "The billboards read: " ~
                "“サイクリクス”; " ~
                "“CAFETRON ⚡ ENERGY”; " ~
                "“#TextItWith Bepis”; and " ~
                "“Misa’s lipstick, just for you!” " ~
                "There is an alley to the north. "
            );
        case Area.Area2:
            return (
                "The street is long and quite narrow. " ~
                "A thin volume of smoke fills the air. " ~
                "Along the street are shops selling various items. " ~
                "The following shops are open: " ~
                "“EXCLAVE” to the west; and " ~
                "“サイクリクス” to the east. " ~
                "There is a lit up square to the south. "
            );
    }
}

nothrow pure @nogc @safe
Artifacts artifacts(Area area)
{
    final switch (area) {
        case Area.Area1: return Artifacts(true, true);
        case Area.Area2: return Artifacts(false);
    }
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
                default: return R.init;
            }

        case Area.Area2:
            switch (direction) {
                case Direction.South: return R(Area.Area1);
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
