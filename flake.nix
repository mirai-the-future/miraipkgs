{
  description = "MiraiOS packages repository";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
   in {
      packages.${system} = {
        calamares-miraios-extensions = pkgs.callPackage ./packages/calamares-miraios-extensions {};
      };
  };
}