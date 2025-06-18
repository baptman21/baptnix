{ config, pkgs, inputs, ... }:

{
  config = {
    environment.systemPath = [ config.homebrew.brewPrefix ];
    homebrew = {
      enable = true;
      brewPrefix = "/opt/homebrew/bin";

      onActivation = {
        autoUpdate = false;
        cleanup = "zap";
      };

      taps = [ ];

      # `brew install`
      brews = [
        # "aria2"  # download tool
        # "borders"
      ];

      # `brew install --cask`
      casks = [
        # "google-chrome"
        "macfuse"
      ];
    };
  };
}
