{ config, pkgs, inputs, ... }:

{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };

    taps = [ ];

    # `brew install`
    brews = [
      # "aria2"  # download tool
      "choose-gui" # rofi like
      "dmenu-mac"
    ];

    # `brew install --cask`
    casks = [
      # "google-chrome"
      "macfuse"
      "hiddenbar" # top bar hide complexity
    ];
  };
}
