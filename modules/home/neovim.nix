{ config, pkgs, ... }:
let

in {
  programs.neovim = {
    enable = true;
    package = pkgs.unstable.neovim-unwrapped;
    withNodeJs = true;
    withPython3 = true;
    extraPython3Packages = ps: [ ps.pynvim ];
    extraLuaPackages = ps: [ ps.luarocks ];
    extraPackages = with pkgs; [ git tree-sitter sumneko-lua-language-server ];

  };
}
