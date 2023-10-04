{ darwin
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
      ../machines/${machine}
    ];
  })
  darwinConfigurations
