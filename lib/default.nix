{ ... }@args:

{
  mkNixOS = import ./mknixos.nix args;
  mkDarwin = import ./mkdarwin.nix args;
}
