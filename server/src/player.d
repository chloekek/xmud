module xmud.player;

import xmud.direction : Direction;
import xmud.world : Area, description, name, path;

struct Player
{
private:
    Area residence;

public:
    @disable this();
    @disable this(this);

    nothrow pure @nogc @safe
    this(Area residence)
    {
        this.residence = residence;
    }

    nothrow pure @nogc @safe
    auto look() const scope
    {
        import std.range : chain;
        return chain(
            "You are in ", residence.name, ". ",
            residence.description,
        );
    }

    nothrow pure @nogc @safe
    bool travel(Direction direction) scope
    {
        const newResidence = residence.path(direction);
        if (newResidence.isNull)
            return false;

        residence = newResidence.get;
        return true;
    }
}
