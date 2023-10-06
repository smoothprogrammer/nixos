{ pkgs, ... }:

{
  services.nix-daemon.enable = true;

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
