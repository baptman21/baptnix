{ config, lib, ... }:
let inherit (lib) mkOption types;
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
      expanse-light = { name = "expanse-light"; };
      expanse-dark = { name = "expanse-dark"; };
    };
  };
}
