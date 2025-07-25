{ config, pkgs, ... }:
# Enable I3 and KDE together
let
  i3_script = pkgs.writeShellScriptBin "i3_script" ''
    ${pkgs.i3-gaps}/bin/i3 -d all -V &>> /tmp/i3.log
  '';
in {
  config = {
    services = {

      displayManager = {
        sddm = {
          enable = true;
          wayland.enable = false;
        };
        defaultSession = "plasma6+i3+bapt";
      };
      xserver = {
        enable = true;
        xkb = {
          layout = "us";
          variant = "";
        };
        displayManager = {
          session = [{
            manage = "desktop";
            name = "plasma6+i3+bapt";
            start = ''
              env KDEWM=${i3_script}/bin/i3_script ${pkgs.kdePackages.plasma-workspace}/bin/startplasma-x11
            '';
          }];
        };
      };
      desktopManager.plasma6.enable = true;
    };
  };
}
