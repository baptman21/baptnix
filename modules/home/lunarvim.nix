{ config, pkgs, ... }:
# LunarVim configuration
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
    rec {
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
    lunarvimDrv
  ];

  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    extraPython3Packages = ps: [
      ps.pynvim
    ];
    inherit extraPackages;
  };

  home.sessionVariables = env;

  home.file.".config/lvim/config.lua" = {
    source = ../../assets/config/lunarvim.lua;
  };
}
