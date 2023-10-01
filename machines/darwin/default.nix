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
    options = "--delete-older-than 7d";
  };

  environment.systemPackages = with pkgs; [
    vim
  ];

  homebrew.enable = true;
  homebrew.casks = [
    "dbeaver-community"
    "figma"
    "firefox"
    "google-chrome"
    "inkscape"
    "postman"
    "slack"
    "telegram"
    "vmware-fusion"
    "zoom"
  ];
}
