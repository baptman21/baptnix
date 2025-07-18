{ additionalPlugins ? [ ] }:
# additionalPlugins: list of additional plugins to install
{ config, pkgs, ... }:
# Lazyvim
#
let
  flatAdditionalPlugins =
    builtins.concatStringsSep " " (additionalPlugins ++ [ "empty.lua" ]);

  lazyvimStaterRepo = pkgs.stdenv.mkDerivation {
    pname = "lazyvim";
    version = "master";

    src = pkgs.fetchFromGitHub {
      owner = "LazyVim";
      repo = "starter";
      rev = "master";
      sha256 = "sha256-QrpnlDD4r1X4C8PqBhQ+S3ar5C+qDrU1Jm/lPqyMIFM=";
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

      mkdir $out/lua/additionalPlugins

      for plugin in ${flatAdditionalPlugins}; do
        cp "${
          ../../assets/config/lazyvim
        }/additionalPlugins/$plugin" "$out/lua/additionalPlugins/$plugin"
      done

      cp -r ${../../assets/config/lazyvim}/after $out/after
    '';
  };

in {
  config = {
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

      pkgs.gofumpt
      pkgs.gotools
      pkgs.unstable.gopls
      pkgs.delve
      pkgs.fd

      pkgs.yaml-language-server

      pkgs.unstable.jsonnet-language-server

      pkgs.bacon
      pkgs.vscode-extensions.vadimcn.vscode-lldb
      pkgs.rust-analyzer

      pkgs.metals

      (pkgs.writeShellScriptBin "lvim" ''
        NVIM_APPNAME=nvim-lazyvim nvim "$@"
      '')

    ] ++ pkgs.lib.lists.optionals
      # disabled because not working on macos
      (pkgs.stdenv.isLinux) [ pkgs.mermaid-cli ];

    home.file.".config/nvim-lazyvim" = { source = lazyvimStaterRepo; };

    # home.shellAliases = { lvim = "NVIM_APPNAME=nvim-lazyvim nvim"; };

    home.sessionPath = [
      "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter"

      # Add mind repo bin
      "${config.home.homeDirectory}/Baptcave/mind/bin"
    ];
  };
}
