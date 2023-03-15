{ nixpkgs, home-manager }:

{ system
, machine
, user
, hashedPassword
, resolution
, dpi
}:

let
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  stateVersion = "22.11";
in nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = { inherit home-manager; };
  modules = [
    { config._module.args = { inherit user resolution dpi; }; }

    ({ config, ... }: {
      # Using already configured sets of pkgs.
      imports = import ../conf;

      # Overlays to extend lib.
      nixpkgs.overlays = [ (import ./overlays.nix) ];

      # Immutable user and no password for sudo
      users.mutableUsers = false;
      security.sudo.wheelNeedsPassword = false;

      # Single user mode.
      users.users.${user} = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        inherit hashedPassword;
      };

      system.stateVersion = stateVersion;
    })

    home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${user} = {
        home.stateVersion = stateVersion;
        xdg.enable = true;
      };
    }

    ../machines/${machine}
  ];
}
