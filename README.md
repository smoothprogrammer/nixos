# nixos-config
My NixOS Configuration

## NixOS vm-mba-m1

```sh
sudo nixos-rebuild switch --flake ~/.config/nixos#vm-mba-m1
```

## Darwin mba-m1

```sh
sudo mv /etc/zshrc.backup-before-nix /etc/zshrc
```

```zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix
```

```sh
nix build ~/.config/nixos#darwinConfigurations.mba-m1.system --extra-experimental-features "nix-command flakes"
./result/sw/bin/darwin-rebuild switch --flake ~/.config/nixos#mba-m1
```
