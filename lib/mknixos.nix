{
  nixpkgs,
  dt,
  home-manager,
  homini,
  ghostty,
  ...
}:
nixosConfigurations:

# nixosConfigurations = mkNixOS {
#   ${hostname} = {
#     system = ${system};
#     machine = ${machine};
#     stateVersion = ${stateVersion};
#     user = ${user};
#     hashedPassword = ${hashedPassword};
#     resolution = { x = ${x}; y = ${y}; };
#     dpi = ${dpi};
#   };
# };

builtins.mapAttrs (
  hostname: settings:
  nixpkgs.lib.nixosSystem {
    inherit (settings) system;
    specialArgs = {
      inherit hostname;
      inherit (settings)
        stateVersion
        user
        hashedPassword
        resolution
        dpi
        ;
    };
    modules = [
      home-manager.nixosModules.default
      homini.nixosModules.default
      (
        { ... }:
        {
          imports = import ../modules;
          nixpkgs.overlays = [ (import ./overlays.nix) ];
          nix.registry = {
            nixpkgs.flake = nixpkgs;
            dt.flake = dt;
          };
          nix.nixPath = [ "nixpkgs=flake:nixpkgs" ];
          environment.systemPackages = [ ghostty.packages.${settings.system}.default ];
        }
      )
      ../machines/${settings.machine}
    ];
  }
) nixosConfigurations
