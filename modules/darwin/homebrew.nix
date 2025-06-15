{ config, pkgs, inputs, ... }:

{
  homebrew = {
    enable = true;

    onActivation = { autoUpdate = false; };

    taps = [ "homebrew/services" ];

    # `brew install`
    brews = [
      # "aria2"  # download tool
    ];

    # `brew install --cask`
    casks = [
      # "google-chrome"
    ];
  };
}
