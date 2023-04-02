{ config, pkgs, ... }:
# LunarVim configuration
#
# WARNING: Post install step
# For now the sumneko_lua language server does not work if installed by Packer.
# It is installed by nix directly but it is not possible to change the path of
# the command only for the default config. As a result to make the lua lsp
# server work you need to create a symlink instead of the binary built by
# Mason.
#
# Open the logs of the lsp with :LspLog
# Locate the `lua-language-server` binary that is not working in the logs
# Delete it
# Create a symlink instead: `ln -s $(which lua-language-server) <path>`
let
  lib = pkgs.lib;

  env = {
    LUNARVIM_RUNTIME_DIR = "${config.home.homeDirectory}/.local/share/lvim";
    LUNARVIM_CONFIG_DIR = "${config.home.homeDirectory}/.config/lvim";
    LUNARVIM_CACHE_DIR = "${config.home.homeDirectory}/.cache/lvim";
    LUNARVIM_BASE_DIR = "${lunarvimDrv}/lvim";
  };

  # TODO: add rust with dependencies ?
  extraPackages = with pkgs; [
    git
    rnix-lsp
    tree-sitter
    sumneko-lua-language-server
  ];

  nvim = config.programs.neovim.finalPackage;

  lunarvimDrv = pkgs.stdenv.mkDerivation
    {
      pname = "lunarvim";
      version = "1.2.0";

      src = pkgs.fetchFromGitHub {
        owner = "LunarVim";
        repo = "LunarVim";
        rev = "fc6873809934917b470bff1b072171879899a36b";
        sha256 = "sha256-3yNxl9ofAQjoFuSHPU/BDQEv5yhR3IvBXe5hjK8wptY=";
      };

      nativeBuildInputs = [ pkgs.makeWrapper pkgs.coreutils pkgs.gnused ];
      buildInputs = [ nvim ];

      buildPhase = ''
        echo hello
      '';

      installPhase = ''
        runHook preInstall
        mkdir -p $out/bin
        cp -r $(pwd) $out/lvim

        export shim="$out/lvim/utils/bin/lvim.template"

        substituteInPlace "$shim" \
          --replace "exec -a lvim nvim" "exec -a lvim ${nvim}/bin/nvim" \
          --replace "RUNTIME_DIR_VAR" "\"${env.LUNARVIM_RUNTIME_DIR}\"" \
          --replace "CONFIG_DIR_VAR" "\"${env.LUNARVIM_CONFIG_DIR}\"" \
          --replace "CACHE_DIR_VAR" "\"${env.LUNARVIM_CACHE_DIR}\"" \
          --replace "BASE_DIR_VAR" "\"$out/lvim\""

        chmod +x "$shim"

        makeWrapper "$shim" "$out/bin/lvim" \
          --set LUNARVIM_RUNTIME_DIR "${env.LUNARVIM_RUNTIME_DIR}" \
          --set LUNARVIM_CONFIG_DIR "${env.LUNARVIM_CONFIG_DIR}" \
          --set LUNARVIM_CACHE_DIR "${env.LUNARVIM_CACHE_DIR}" \
          --set LUNARVIM_BASE_DIR "$out/lvim" \
          --prefix PATH : ${lib.makeBinPath (extraPackages ++ [ nvim ])}

        runHook postInstall
      '';
    };

in
{
  home.packages = [
    pkgs.nodePackages.neovim
    pkgs.lua-language-server
    lunarvimDrv
  ];

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
    inherit extraPackages;
  };

  home.sessionVariables = env;

  home.file.".config/lvim/config.lua" = {
    source = ../../assets/config/lunarvim.lua;
  };

  # FT Plugins for some filetype specific configuration

  home.file.".config/lvim/after/ftplugin/mail.lua" = {
    text = ''
      vim.cmd("setlocal cc=68 textwidth=68 nocindent noautoindent")
      vim.cmd("setlocal spell spelllang=en fileencodings=iso8859-1,utf-8")
    '';
  };

  home.file.".config/lvim/after/ftplugin/go.lua" = {
    text = ''
      vim.cmd("setlocal cc=120 textwidth=119 noexpandtab tabstop=4")
    '';
  };

  home.file.".config/lvim/after/ftplugin/python.lua" = {
    text = ''
      vim.cmd("setlocal cc=120 textwidth=119")
    '';
  };
}
