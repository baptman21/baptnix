{ config, pkgs, ... }:
# Sketchybar config for darwin
let

  configDir = pkgs.stdenv.mkDerivation {
    name = "sketchybar-config";

    src = ../../assets/sketchybar;

    nativeBuildInputs = [ pkgs.findutils pkgs.sketchybar pkgs.gnused ];

    buildPhase = ''
      cp -r $src ./out

      chmod u+w -R ./out

      find . -type f -exec sed -i "s_@SKETCHYBAR_BIN_PATH@_"${pkgs.sketchybar}"/bin/sketchybar_g" {} \;

      find . -type f -exec sed -i "s_@PLUGIN_DIR@_$out_g" {} \;

      cp -r ./out $out
    '';
  };

in {
  config = {
    services.sketchybar = {
      enable = true;
      config = configDir + "/sketchybarrc";
    };
  };
}
