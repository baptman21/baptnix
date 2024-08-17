{ config, pkgs, ... }:
# Lazyvim
#
let
  vim-spell-fr-utf8-dictionary = builtins.fetchurl {
    url = "http://ftp.vim.org/vim/runtime/spell/fr.utf-8.spl";
    sha256 = "abfb9702b98d887c175ace58f1ab39733dc08d03b674d914f56344ef86e63b61";
  };

  lib = pkgs.lib;

  nvim = config.programs.neovim.finalPackage;

  lazyvimStaterRepo = pkgs.stdenv.mkDerivation
    {
      pname = "lazyvim";
      version = "master";

      src = pkgs.fetchFromGitHub {
        owner = "LazyVim";
        repo = "starter";
        rev = "master";
        sha256 = "sha256-nB63tBRIU9Ma9Sv/9xNCy4563HJ2DYqQshbExN/PUo0=";
      };

      nativeBuildInputs = [ pkgs.makeWrapper pkgs.coreutils pkgs.gnused ];
      buildInputs = [ nvim ];

      installPhase = ''
        mkdir -p $out
        cp -r * $out
        cp ${../../assets/config/lazyvim/options.lua} $out/lua/config/options.lua
        cp ${../../assets/config/lazyvim/keymaps.lua} $out/lua/config/keymaps.lua
        cp ${../../assets/config/lazyvim/autocmds.lua} $out/lua/config/autocmds.lua
      '';
    };


in
{
  home.packages = [
    pkgs.nodePackages.neovim
    pkgs.lua-language-server
    pkgs.luarocks
  ];

  home.file.".config/nvim-lazyvim" = {
    source = lazyvimStaterRepo;
  };

  home.shellAliases = {
    zvim = "NVIM_APPNAME=nvim-lazyvim nvim";
  };

  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    extraPython3Packages = ps: [
      ps.pynvim
    ];
    extraLuaPackages = ps: [
      ps.luarocks
    ];
    extraPackages = with pkgs; [
      git
      tree-sitter
      luarocks
    ];
  };

  # French dictionary
  home.file.".config/lvim/spell/fr.utf-8.spl".source = vim-spell-fr-utf8-dictionary;
}
