{ config, pkgs, inputs, ... }:

{
  config = {
    home.packages = [ pkgs.choose-gui ];

  };
}
