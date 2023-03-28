{
  description = "Minizilla's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, ... }@inputs:
    let
      lib = import ./lib inputs;
    in
    {
      nixosConfigurations.vm-mba-m1 = lib.mkNixOS {
        system = "aarch64-linux";
        machine = "vm/vmware-aarch64";
        user = "minizilla";
        hashedPassword = "$y$j9T$oqZGOLzKyffIYTKw1YIzO0$mCNHVpPBvqgI.mwR57uq6YNNykWoAHV6QJKrjvaEG8A";
        resolution = { x = 2880; y = 1752; };
        dpi = 192;
      };

      darwinConfigurations.mba-m1 = lib.mkDarwin {
        system = "aarch64-darwin";
        machine = "darwin";
        user = "minizilla";
      };
    };
}
