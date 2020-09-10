{ nixpkgs ? import ./nix/nixpkgs.nix {} }:

let
    inherit (nixpkgs)
        callPackage;
in
    rec {
        server = callPackage ./server {};
    }
