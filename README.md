# nixos-config
My NixOS Configuration

## Darwin

```sh
make darwin/brew-install
make darwin/nix-install
make darwin/nix-darwin-install
```

## VM

Download the [image](https://nixos.org/download).

Setup VMWare.

```sh
# vm
sudo -i
passwd
ip addr

# host
make vm/nixos-install vm_addr=VM_ADDR hostname=HOSTNAME
```
