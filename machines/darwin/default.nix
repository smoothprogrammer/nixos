{ pkgs, ... }:

{
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
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
