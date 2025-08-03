{ config, lib, ... }:
let
  inherit (lib) mkOption types;
  expanse = import ./themes/expanse.nix { };
in {
  options.bapt = {
    theme = mkOption {
      type = types.attrs;
      description =
        "Theme for the config, must be one of the possible values defined in config.bapt.themes.";
    };

    themes = mkOption {
      type = types.attrsOf types.attrs;
      description = "All themes available.";
    };
  };

  config.bapt = {
    themes = {
      expanse-light = expanse.light;
      expanse-dark = expanse.dark;
    };
  };
}
