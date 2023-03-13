{
  description = "Bigzilla's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }: let
    lib = import ./lib { inherit nixpkgs home-manager; };
  in {
	nixosConfigurations.mba-m1 = lib.mkNixOS {
	  system = "aarch64-linux";
	  machine = "vm/vmware-aarch64";
	  user = "bigzilla";
	  hashedPassword = "$y$j9T$oqZGOLzKyffIYTKw1YIzO0$mCNHVpPBvqgI.mwR57uq6YNNykWoAHV6QJKrjvaEG8A";
	  resolution = { x = 2880; y = 1752; };
	  dpi = 192;
	  #resolution = { x = 2560; y = 1440; };
	  #dpi = 168;
    };
  };
}
