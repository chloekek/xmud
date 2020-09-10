module xmud.main;

import std.stdio : writeln;
import xmud.player : Player;
import xmud.world : SPAWN, Area, path;
import xmud.direction : Direction;

@safe
void main()
{
    auto chloekek = Player(SPAWN);
    writeln(chloekek.residence);
    chloekek.travel(Direction.North).writeln;
    writeln(chloekek.residence);
    chloekek.travel(Direction.North).writeln;
    writeln(chloekek.residence);
}
