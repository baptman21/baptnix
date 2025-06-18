{ config, pkgs, inputs, ... }:

{
  config = {
    home.packages = [ pkgs.choose-gui ];

    home.file.".choose-launcher-sh" =
      pkgs.writeShellScriptBin "choose-launcher.sh" ''
        application_dirs="/Applications/ /System/Applications/ /System/Library/CoreServices/ /System/Applications/Utilities/"
        PATH="''${HOME}/.nix-profile/bin:''${PATH}"

        if [ -e ''${HOME}/.nix-profile/Applications ]
        then
          application_dirs="''${application_dirs} ''${HOME}/.nix-profile/Applications"
        fi
        if [ -e ''${HOME}/Applications ]
        then
          application_dirs="''${application_dirs} ''${HOME}/Applications"
        fi
        if [ -e "''${HOME}/Applications/Home Manager Apps" ]
        then
          application_dirs="''${application_dirs} ''${HOME}/Applications/Home\ Manager\ Apps"
        fi

        currentPath="$(echo ''${PATH} | /usr/bin/sed 's/:/ /g')"

        selection=$(/bin/ls ''${application_dirs} ''${currentPath} | /usr/bin/grep -vE 'Applications/:|Applications:|\:' | /usr/bin/sort -u | ${pkgs.choose-gui}/bin/choose)

        if echo "''${selection}" | grep -q ".app"
        then
          app_name=$(basename "''${selection}" .app)
          osascript -e "tell application \"''${app_name}\" to activate"
        else
          binary="$(which ''${selection})" && exec ''${binary}
        fi
      '';
  };
}
