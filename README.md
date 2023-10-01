# nixos-config
My NixOS Configuration

## NixOS vm-mba-m1

```sh
sudo nixos-rebuild switch --flake ~/.config/nixos#vm-mba-m1
```

## Darwin mba-m1

```sh
nix build ~/.config/nixos#darwinConfigurations.mba-m1.system --extra-experimental-features "nix-command flakes"
./result/sw/bin/darwin-rebuild switch --flake ~/.config/nixos#mba-m1
```
