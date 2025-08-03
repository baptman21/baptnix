{ config, pkgs, lib, ... }:
# Kitty
let

  themeFiles =
    lib.mapAttrs (name: value: pkgs.bapt.lib.themes.toKittyConf value)
    config.bapt.themes;
  hmThemeFiles = lib.mapAttrs' (name: value:
    let
      filename = ".config/kitty/themes/" + value.name + ".conf";
      content = { source = themeFiles."${value.name}"; };
    in lib.nameValuePair filename content) config.bapt.themes;
in {
  config = {
    home.file = hmThemeFiles;

    bapt.outputs =
      lib.attrsets.getAttrs ((builtins.attrNames hmThemeFiles) ++ [ ".zshrc" ])
      config.home.file;

    home.shellAliases = {
      # Override the default clear command to keep the scrollback buffer
      clear = ''printf "\e[H\e[22J"'';
    };

    programs.kitty = {
      enable = true;
      font = {
        name = "Hack Nerd Font Mono";
        size = 16;
      };
      # themeFile = "tokyo_night_storm";
      # themeFile = "1984_dark";
      shellIntegration = {
        enableZshIntegration = true;
        enableBashIntegration = true;
      };
      darwinLaunchOptions = [ ];
      settings = {
        scrollback_pager_history_size = 4000; # 4 go
        scrollback_lines = 4000; # 4k lines in ram

        copy_on_select = true;

        enable_audio_bell = false;

        background_opacity = 0.9;
        background_blur = 10;
        allow_remote_control = true;
        listen_on = "unix:/tmp/kitty";

      };
      extraConfig = ''
        # Custom Iris theme
        include ${themeFiles."${config.bapt.theme.name}"}

        shell zsh

        # Let aerospace or I3 kill windows
        map ctrl+shift+w

        map kitty_mod+f scroll_page_up
        map kitty_mod+b scroll_page_down

        # Override clear to keep it in the scrollback buffer
        map ctrl+l clear_terminal to_cursor_scroll active

        # Kitty scrollback.nvim

        # kitty-scrollback.nvim Kitten alias
        action_alias kitty_scrollback_nvim kitten ${config.home.homeDirectory}/.local/share/nvim-lazyvim/lazy/kitty-scrollback.nvim/python/kitty_scrollback_nvim.py --env NVIM_APPNAME=nvim-lazyvim     # Browse scrollback buffer in nvim

        map kitty_mod+h kitty_scrollback_nvim
        # Browse output of the last shell command in nvim
        map kitty_mod+g kitty_scrollback_nvim --config ksb_builtin_last_cmd_output
        # Show clicked command output in nvim
        mouse_map ctrl+shift+right press ungrabbed combine : mouse_select_command_output : kitty_scrollback_nvim --config ksb_builtin_last_visited_cmd_output
      '';
    };
  };
}
