self: super:
let
  callPackage = super.callPackage;
in {
  lib = (super.lib or { }) // { };
}
