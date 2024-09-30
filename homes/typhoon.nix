{ config, pkgs, ... }:
# BaptComp Whirlwind configuration
{
  imports = [
    # packages
    ../modules/home/packages.nix
    # apps
    ../modules/home/fzf.nix
    ../modules/home/git.nix
    (import ../modules/home/i3-plasma.nix {
      theme = "typhoon";
      modifier = "Mod4";
      background_image = ../assets/wallpapers/purple-planet.jpg;
    })
    ../modules/home/neovim.nix
    ../modules/home/lunarvim.nix
    ../modules/home/lazyvim.nix
    (import ../modules/home/kde-theme.nix { theme = "typhoon"; })
    ../modules/home/nix-index.nix
    ../modules/home/slrn.nix
    (import ../modules/home/starship.nix {
      theme = "typhoon";
      extraSettings = {
        kubernetes = {
          disabled = false;
          format = ''\[[$symbol$context( \($namespace\))]($style)\] '';
        };
      };
    })
    (import ../modules/home/ssh.nix { sshDir = config.home.homeDirectory + "/.ssh"; })
    ../modules/home/vim.nix
    ../modules/home/zsh.nix
    # services
    (import ../modules/home/picom.nix { theme = "typhoon"; })
    (import ../modules/home/polybar.nix { theme = "typhoon"; })
    ../modules/home/blueman.nix
  ];

  home.username = "baptman";
  home.homeDirectory = "/home/baptman";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
    bash.enable = true;
  };

  home.shellAliases = {
    # TODO: tmp to see if I prefer lazyvim to lunar
    lvim = "zvim";

    k = "kubectl";
    kvs = "kubectl-view-secret";
    kex = "k exec -it";
    ksh = "pod=$(kgp | fzf | awk '{print $1}'); print -rs kex $pod -- /bin/sh; kubectl exec -it $pod -- /bin/sh";
    kbh = "pod=$(kgp | fzf | awk '{print $1}'); print -rs kex $pod -- bash; kubectl exec -it $pod -- bash";
    ky = "k -o yaml";
    kg = "k get";
    kwg = "watch -n 2 -- kubectl get";
    kyg = "ky get";
    kygp = "ky get pods";
    kgp = "k get pods";
    ktx = "kubectx";
    kns = "kubens";
    tf = "terraform";
    by = "bat -l yaml";
    kdbb = "pod=$(kgp | grep -- '-pg-' | fzf | awk '{print $1}'); print -rs kex $pod -- bash; kubectl exec -it $pod -- bash";
    kdbp = "pod=$(kgp | grep -- '-pg-' | fzf | awk '{print $1}'); print -rs kex $pod -- psql; kubectl exec -it $pod -- psql";
    kdbmab = "pod=$(kgp --selector='postgres-operator.crunchydata.com/role=master'| grep -- '-pg-' | fzf | awk '{print $1}'); print -rs kex $pod -- bash; kubectl exec -it $pod -- bash";
    kdbmap = "pod=$(kgp --selector='postgres-operator.crunchydata.com/role=master'| grep -- '-pg-' | fzf | awk '{print $1}'); print -rs kex $pod -- psql; kubectl exec -it $pod -- psql";
    kdbreb = "pod=$(kgp --selector='postgres-operator.crunchydata.com/role=replica'| grep -- '-pg-' | fzf | awk '{print $1}'); print -rs kex $pod -- bash; kubectl exec -it $pod -- bash";
    kdbrep = "pod=$(kgp --selector='postgres-operator.crunchydata.com/role=replica'| grep -- '-pg-' | fzf | awk '{print $1}'); print -rs kex $pod -- psql; kubectl exec -it $pod -- psql";
    kgetall = "kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found";
  };

  home.packages = [
    pkgs.argocd
    pkgs.argo
    pkgs.awscli2
    (pkgs.unstable.azure-cli.withExtensions [ pkgs.unstable.azure-cli-extensions.storage-actions ])
    pkgs.circleci-cli
    pkgs.dig
    pkgs.helm-ls
    pkgs.krdc
    pkgs.kubectl
    pkgs.kubernetes-helm
    pkgs.kubectx
    pkgs.kubectl-neat
    pkgs.kubectl-node-shell
    pkgs.kubectl-view-secret
    pkgs.kube-linter
    pkgs.postgresql
    pkgs.redis
    pkgs.teleport
    pkgs.unstable.tflint # TODO: revert next nix update
    pkgs.trivy
    pkgs.terraform-docs
    pkgs.checkov
    # Client VPN
    pkgs.unstable.pritunl-client
    pkgs.yarn
  ];

}
