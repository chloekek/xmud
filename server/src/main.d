module xmud.main;

import std.stdio : readln, write, writeln;
import std.string : strip;
import xmud.direction : Direction;
import xmud.player : Player;
import xmud.world : SPAWN, Area, path;

@safe
void main()
{
    auto chloekek = Player(SPAWN);

    for (;;) {
        write("> ");
        const input = (() @trusted => readln)().strip;
        switch (input) {
            default:
                "That is not a valid command.".writeln;
                break;

            case "look":
                chloekek.look.writeln;
                break;

            case "north":
                chloekek.travel(Direction.North);
                chloekek.look.writeln;
                break;

            case "south":
                chloekek.travel(Direction.South);
                chloekek.look.writeln;
                break;

            case "west":
                chloekek.travel(Direction.West);
                chloekek.look.writeln;
                break;

            case "east":
                chloekek.travel(Direction.East);
                chloekek.look.writeln;
                break;
        }
    }
}
