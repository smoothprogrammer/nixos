{ nixpkgs
, darwin
, ...
}:

{ system
, machine
, user
}:

darwin.lib.darwinSystem {
  inherit system;
  modules = [
    ../machines/${machine}
  ];
}
