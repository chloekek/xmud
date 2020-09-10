module xmud.artifact;

struct Artifacts
{
    bool coffeeVendingMachine;
    bool workbench;

    nothrow pure @nogc @safe
    auto description() const
    {
        import std.range : chain;
        return chain(
            coffeeVendingMachine ? "You see a coffee vending machine. " : "",
            workbench ? "You see a workbench. " : "",
        );
    }
}
