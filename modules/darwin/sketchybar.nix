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

      find . -type f -exec sed -i 's|@SKETCHYBAR_BIN_PATH@|'${pkgs.sketchybar}'/bin/sketchybar|g' {} \;

      find . -type f -exec sed -i 's|@AEROSPACE_BIN_PATH@|'${pkgs.aerospace}'/bin/aerospace|g' {} \;

      find . -type f -exec sed -i 's|@CONFIG_DIR@|'$out'|g' {} \;

      cp -r ./out $out
    '';
  };

in {
  config = {
    services.sketchybar = {
      enable = true;
      config = builtins.readFile (configDir + "/sketchybarrc");
    };
  };
}
