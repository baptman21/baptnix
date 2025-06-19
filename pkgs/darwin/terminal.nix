{ pkgs, ... }:
# Terminal script to run a new window
pkgs.writeShellScriptBin "terminal.sh" ''
  ${pkgs.alacritty}/bin/alacritty &
  disown
''
