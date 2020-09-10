module xmud.player;

import xmud.direction : Direction;
import xmud.world : Area, path;

struct Player
{
private:
    Area _residence;

public:
    @disable this();
    @disable this(this);

    nothrow pure @nogc @safe
    this(Area residence)
    {
        this._residence = residence;
    }

    nothrow pure @nogc @safe
    Area residence() const scope
    {
        return _residence;
    }

    nothrow pure @nogc @safe
    bool travel(Direction direction) scope
    {
        const newResidence = _residence.path(direction);
        if (newResidence.isNull)
            return false;

        _residence = newResidence.get;
        return true;
    }
}
