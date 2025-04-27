{ pkgs, ... }@args:

{
  # Let nix-darwin manage nix itself.
  nix.enable = true;

  # Hostname.
  networking.hostName = args.hostname;

  # Timezone.
  time.timeZone = "Asia/Jakarta";

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  # Auto garbage collector and storage optimizer.
  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
    optimise = {
      automatic = true;
    };
  };

  # Enable new nix cli and flakes.
  nix.extraOptions = ''
    experimental-features = nix-command flakes
    warn-dirty = false
    keep-outputs = true
    keep-derivations = true
  '';

  # Single user.
  users.users.${args.user} = {
    createHome = true;
    home = "/Users/${args.user}";
  };

  # A must have home-manager config.
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  # Single user home-manager.
  home-manager.users.${args.user} = {
    home.stateVersion = args.stateVersion;
  };

  # Default programs.
  programs.zsh.enable = true;

  # Default system packages.
  environment.systemPackages = with pkgs; [
    git
    vim
    go
  ];

  # We still needs homebrew since nixpkgs support for darwin is lacking.
  homebrew.enable = true;
  homebrew.casks = [
    "another-redis-desktop-manager"
    "asana"
    "chatgpt"
    "dbeaver-community"
    "discord"
    "docker"
    "figma"
    "firefox"
    "font-noto-sans-mono"
    "google-chrome"
    "google-drive"
    "inkscape"
    "mongodb-compass"
    "openvpn-connect"
    "postman"
    "slack"
    "steam"
    "telegram"
    "tomatobar"
    "visual-studio-code"
    "vmware-fusion"
    "whatsapp"
    "zoom"
  ];

  system.stateVersion = 6;
}
