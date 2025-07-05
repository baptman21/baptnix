{ pkgs, ... }:
# Terminal script to run a new window
pkgs.writeShellScriptBin "terminal.sh" ''
  ${pkgs.kitty}/bin/kitty ~ &
  disown
''
