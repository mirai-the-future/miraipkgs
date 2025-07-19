{nixpkgs ? import <nixpkgs> {}}:
{
  inherit (nixpkgs) callPackage;
  calamares-miraios-extensions ./packages/calamares-miraios-extensions {};
}