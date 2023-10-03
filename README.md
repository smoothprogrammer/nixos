# nixos-config
My NixOS Configuration

## VM

Inside the VM.

```sh
sudo -i
passwd
```

Inside the host.

```sh
make vm/nixos-install vm_addr=VM_ADDR hostname=HOSTNAME
```

## Darwin

```sh
make darwin/brew-install
make darwin/nix-install
```
