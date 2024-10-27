{ config, pkgs, ... }:
# Enable I3 and KDE together
let
  i3_script = pkgs.writeShellScriptBin "i3_script" ''
    ${pkgs.i3-gaps}/bin/i3 -d all -V &>> /tmp/i3.log
  '';
in
{
  services = {

    displayManager = {
      sddm.enable = true;
      defaultSession = "plasma5+i3+bapt";
    };
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      displayManager = {
        session = [
          {
            manage = "desktop";
            name = "plasma5+i3+bapt";
            start = ''
              env KDEWM=${i3_script}/bin/i3_script ${pkgs.plasma-workspace}/bin/startplasma-x11
            '';
          }
        ];
      };
      desktopManager.plasma5.enable = true;
    };
  };
}
