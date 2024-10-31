{ config, pkgs, ... }:
# Lazyvim
#
let
  lib = pkgs.lib;

  lazyvimStaterRepo = pkgs.stdenv.mkDerivation {
    pname = "lazyvim";
    version = "master";

    src = pkgs.fetchFromGitHub {
      owner = "LazyVim";
      repo = "starter";
      rev = "master";
      sha256 = "sha256-nB63tBRIU9Ma9Sv/9xNCy4563HJ2DYqQshbExN/PUo0=";
    };

    nativeBuildInputs = [ pkgs.makeWrapper pkgs.coreutils pkgs.gnused ];

    installPhase = ''
      mkdir -p $out
      cp -r * $out
      cp ${../../assets/config/lazyvim}/options.lua $out/lua/config/options.lua
      cp ${../../assets/config/lazyvim}/keymaps.lua $out/lua/config/keymaps.lua
      cp ${
        ../../assets/config/lazyvim
      }/autocmds.lua $out/lua/config/autocmds.lua
      cp ${../../assets/config/lazyvim}/lazy.lua $out/lua/config/lazy.lua

      rm -rf $out/lua/plugins
      cp -r ${../../assets/config/lazyvim}/plugins $out/lua/plugins

      cp -r ${../../assets/config/lazyvim}/after $out/after
    '';
  };

in {
  home.packages = [
    pkgs.nodePackages.neovim
    # lua
    pkgs.lua-language-server
    pkgs.luarocks
    pkgs.stylua

    pkgs.markdownlint-cli2

    pkgs.nil
    pkgs.nixfmt-classic

    pkgs.shfmt

    pkgs.terraform-ls

    pkgs.ruff-lsp
    pkgs.pyright

    pkgs.vscode-langservers-extracted

    pkgs.yaml-language-server
  ];

  home.file.".config/nvim-lazyvim" = { source = lazyvimStaterRepo; };

  home.shellAliases = { zvim = "NVIM_APPNAME=nvim-lazyvim nvim"; };
}
