{ nixpkgs
, home-manager
, ...
}: nixosConfigurations:

# nixosConfigurations = {
#   ${hostname} = {
#     system = ${system};
#     machine = ${machine};
#     user = ${user};
#     hashedPassword = ${hashedPassword};
#     resolution = { x = ${x}; y = ${y}; };
#     dpi = ${dpi};
#   }
# }

let
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  stateVersion = "22.11";
in
builtins.mapAttrs
  (hostname: settings: nixpkgs.lib.nixosSystem {
    inherit (settings) system;
    modules = [
      home-manager.nixosModules.default

      {
        config._module.args = {
          inherit (settings) user resolution dpi;
        };
      }

      ({ config, lib, pkgs, home-manager, ... }: {
        # Using already configured sets of pkgs.
        imports = import ../conf;

        # Overlays to extend lib.
        nixpkgs.overlays = [ (import ./overlays.nix) ];

        # Set registry to use nixpkgs specified in this flake.
        nix.registry.nixpkgs.flake = nixpkgs;

        # Set channel to use nixpkgs from registry.
        nix.nixPath = [ "nixpkgs=flake:nixpkgs" ];

        # Set hostname
        networking.hostName = hostname;

        # Halo Dunia!
        time.timeZone = "Asia/Jakarta";

        # Immutable user and no password for sudo.
        users.mutableUsers = false;
        security.sudo.wheelNeedsPassword = false;

        # Home Manager settings.
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;

        # Single user mode.
        users.users.${settings.user} = {
          isNormalUser = true;
          extraGroups = [ "wheel" ];
          inherit (settings) hashedPassword;
        };
        home-manager.users.${settings.user} = {
          xdg.enable = true;
          gtk.enable = true;
          xsession.enable = true;
          home.stateVersion = stateVersion;
        };

        system.stateVersion = stateVersion;
      })

      ../machines/${settings.machine}
    ];

  })
  nixosConfigurations
