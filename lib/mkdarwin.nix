{ stateVersion
, nixpkgs
, darwin
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
    specialArgs = {
      inherit stateVersion hostname;
      inherit (settings) user;
    };
    modules = [
      home-manager.darwinModules.default

      ({ config, lib, pkgs, home-manager, ... }: {
        nixpkgs.overlays = [ (import ./overlays.nix) ];
        nix.registry.nixpkgs.flake = nixpkgs;
        nix.nixPath = [ "nixpkgs=flake:nixpkgs" ];
      })

      ../machines/${settings.machine}
    ];
  })
  darwinConfigurations
