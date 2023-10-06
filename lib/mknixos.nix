{ stateVersion
, nixpkgs
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
#   };
# };

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
        imports = import ../conf;

        networking.hostName = hostname;
        time.timeZone = "Asia/Jakarta";

        nixpkgs.overlays = [ (import ./overlays.nix) ];
        nixpkgs.config.allowUnfree = true;

        nix.registry.nixpkgs.flake = nixpkgs;
        nix.nixPath = [ "nixpkgs=flake:nixpkgs" ];
        nix.gc = {
          automatic = true;
          options = "--delete-older-than 14d";
        };
        nix.extraOptions = ''
          experimental-features = nix-command flakes
          warn-dirty = false
          keep-outputs = true
          keep-derivations = true
        '';

        users.mutableUsers = false;
        security.sudo.wheelNeedsPassword = false;
        users.users.${settings.user} = {
          isNormalUser = true;
          extraGroups = [ "wheel" ];
          inherit (settings) hashedPassword;
        };

        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
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
