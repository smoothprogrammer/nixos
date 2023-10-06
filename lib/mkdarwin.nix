{ stateVersion
, darwin
, nixpkgs
, home-manager
, ...
}: darwinConfigurations:

# darwinConfigurations = {
#   ${hostname} = {
#     system = ${system};
#     machine = ${machine};
#     user = ${user};
#   };
# };

builtins.mapAttrs
  (hostname: settings: darwin.lib.darwinSystem {
    inherit (settings) system;
    modules = [
      home-manager.darwinModules.default

      ({ config, lib, pkgs, home-manager, ... }: {
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

        users.users.${settings.user} = {
          createHome = true;
          home = "/Users/${settings.user}";
        };

        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.${settings.user} = {
          home.stateVersion = stateVersion;
        };
      })

      ../machines/${settings.machine}
    ];
  })
  darwinConfigurations
