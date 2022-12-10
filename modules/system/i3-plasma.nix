{ config, pkgs, ... }:
# Enable I3 and KDE together
{
  services = {
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
      displayManager = {
        sddm.enable = true;
        defaultSession = "plasma5+i3+bapt";
        session = [
          {
            manage = "desktop";
            name = "plasma5+i3+bapt";
            start = ''
              env KDEWM=${pkgs.i3-gaps}/bin/i3 ${pkgs.plasma-workspace}/bin/startplasma-x11
            '';
          }
        ];
      };
      desktopManager.plasma5.enable = true;
    };
  };
}
