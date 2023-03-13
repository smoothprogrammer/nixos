{ nixpkgs, home-manager }:

let
  args = { inherit nixpkgs home-manager; };
in {
  mkNixOS = import ./mknixos.nix args;
}
