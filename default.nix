{ lib, ... }:

let
  nixpkgs = import <nixpkgs> { };
  miraiPkgs = import ./packages { inherit nixpkgs; };
  #myModules = import ./nixos-modules { inherit nixpkgs; };
in
{
  packages = miraiPkgs;
  #modules = myModules;
}