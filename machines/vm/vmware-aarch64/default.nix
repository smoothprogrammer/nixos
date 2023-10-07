{ config, lib, pkgs, ... }@args:

{
  imports = [
    ./hardware-configuration.nix
    ../shared.nix
  ];

  networking.useDHCP = false;
  networking.interfaces.ens160.useDHCP = true;
  services.xserver.dpi = args.dpi;
  services.xserver.resolutions = [ args.resolution ];
  conf.vmware.guest.enable = true;

  fileSystems."/host" = {
    device = ".host:/";
    fsType = "fuse./run/current-system/sw/bin/vmhgfs-fuse";
    options = [
      "umask=22"
      "uid=1000"
      "gid=1000"
      "allow_other"
      "auto_unmount"
      "defaults"
    ];
  };
}
