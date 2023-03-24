{ config, lib, pkgs, ... }:

let
  cfg = config.conf.systemd-boot;
in
{
  options.conf.systemd-boot = {
    enable = lib.mkEnableOption "systemd-boot EFI boot manager";
    silent = lib.mkEnableOption "silent boot";
  };
  config = lib.mkIf cfg.enable {
    console.earlySetup = false;
    boot = lib.mkMerge [
      {
        loader.systemd-boot.enable = true;
        loader.systemd-boot.editor = false;
        loader.systemd-boot.configurationLimit = 5;
        loader.systemd-boot.consoleMode = "0";
        loader.efi.canTouchEfiVariables = true;
      }
      (lib.mkIf cfg.silent {
        plymouth.enable = true;
        initrd.verbose = false;
        consoleLogLevel = 0;
        kernelParams = [
          "quiet"
          "splash"
          "rd.systemd.show_status=false"
          "rd.udev.log_level=3"
          "boot.shell_on_fail"
        ];
      })
    ];
  };
}
