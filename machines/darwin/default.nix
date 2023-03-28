{ pkgs, ... }:

{
  # Nix settings.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
    warn-dirty = false
    keep-outputs = true
    keep-derivations = true
  '';

  # GC.
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 30d";
  };

  environment.systemPackages = with pkgs; [
    vim
  ];

  homebrew.enable = true;
  homebrew.casks = [
    "vmware-fusion"
    "dbeaver-community"
    "zoom"
    "telegram"
    "firefox"
    "postman"
    "inkscape"
  ];
}
