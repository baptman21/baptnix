{ config, pkgs, ... }: {
  config = {
    programs.neovim = {
      enable = true;
      package = pkgs.unstable.neovim-unwrapped;
      withNodeJs = true;
      withPython3 = true;
      extraPython3Packages = ps: [ ps.pynvim ];
      extraLuaPackages = ps: [ ps.luarocks ps.magick ];
      extraPackages = with pkgs; [
        git
        tree-sitter
        sumneko-lua-language-server
        imagemagick
      ];
    };
  };
}
