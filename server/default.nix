{ ldc, stdenvNoCC }:

stdenvNoCC.mkDerivation {
    name = "xmud-server";

    src = ./.;

    buildInputs = [
        ldc
    ];

    buildPhase = ''
        ldcFlags=(-O3 -dip1000)

        find src -name '*.d' -print0 | \
            xargs -0 ldc2 "''${ldcFlags[@]}" -of=xmud-server

        find src -name '*.d' -print0 | \
            xargs -0 ldc2 "''${ldcFlags[@]}" -unittest -of=xmud-server.unittest
    '';

    installPhase = ''
        mkdir --parents "$out"/bin
        mv xmud-server xmud-server.unittest "$out"/bin
    '';
}
