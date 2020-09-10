module xmud.main;

import std.stdio : writeln;
import xmud.player : Player;
import xmud.world : SPAWN, Area, path;
import xmud.direction : Direction;

@safe
void main()
{
    auto chloekek = Player(SPAWN);
    writeln(chloekek.look);
    chloekek.travel(Direction.North).writeln;
    writeln(chloekek.look);
    chloekek.travel(Direction.North).writeln;
    writeln(chloekek.look);
    chloekek.travel(Direction.South).writeln;
    writeln(chloekek.look);
    chloekek.travel(Direction.West).writeln;
    writeln(chloekek.look);
}
