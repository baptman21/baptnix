{ theme }:
# Polybar configuration
#
# Args:
# - theme: name of the them to use, must be one of
#   * tempest
#   * whirlind
{ config, pkgs, ... }:
# Polybar
let
  theme_dir = ../../assets/polybar/theme;
in
{
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      alsaSupport = true;
      githubSupport = true;
      mpdSupport = true;
      pulseSupport = true;
      i3Support = true;
    };
    extraConfig = builtins.replaceStrings
      [ "__HOME__" ]
      [ "${theme_dir}" ]
      (builtins.readFile (theme_dir + "/${theme}.ini"));
    script = ''
      set -ex
      export PATH="$PATH:${pkgs.xorg.xrandr}/bin:${pkgs.i3-gaps}/bin:${pkgs.coreutils}/bin:${pkgs.gnugrep}/bin"

      main=$(xrandr | grep ' connected primary ' | cut -d' ' -f1)
      side=$(xrandr | grep ' connected ' | grep -v ' connected primary ' | cut -d' ' -f1)

      for s in $side; do
        MONITOR="$s" polybar main &
      done
      MONITOR="$main" polybar main &
    '';
  };
}
