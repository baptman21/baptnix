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
    pkgs.neovim-node-client

    pkgs.bash-language-server
    pkgs.shellcheck
    # lua
    pkgs.lua-language-server
    pkgs.luarocks
    pkgs.stylua

    pkgs.marksman
    pkgs.markdownlint-cli2

    pkgs.nil
    pkgs.nixfmt-classic

    pkgs.shfmt

    pkgs.terraform-ls

    pkgs.ruff
    pkgs.pyright

    pkgs.sqlfluff

    pkgs.vscode-langservers-extracted

    pkgs.nodePackages.prettier

    pkgs.svelte-language-server
    pkgs.unstable.typescript-language-server

    pkgs.gofumpt
    pkgs.gotools
    pkgs.delve
    pkgs.fd

    pkgs.yaml-language-server

    pkgs.unstable.jsonnet-language-server
  ];

  home.file.".config/nvim-lazyvim" = { source = lazyvimStaterRepo; };

  home.shellAliases = { zvim = "NVIM_APPNAME=nvim-lazyvim nvim"; };
}
