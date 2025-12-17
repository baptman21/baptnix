{ theme, enableNodeShell ? true }:
# Kube configuration
#
# Args:
# - theme: name of the them to use for k9s
#   * typhoon
#   * whirlind
{ config, pkgs, ... }:
# Config for kube
let
  kubernetes-helm = pkgs.wrapHelm pkgs.kubernetes-helm {
    plugins = with pkgs.kubernetes-helmPlugins; [
      helm-secrets
      helm-diff
      helm-s3
      helm-git
    ];
  };

  helmfile =
    pkgs.helmfile-wrapped.override { inherit (kubernetes-helm) pluginsDir; };
in {
  config = {
    home.packages = [
      pkgs.kind
      pkgs.fluxcd
      pkgs.kubectl
      pkgs.kubernetes-helm
      pkgs.kubectx
      pkgs.kubectl-neat
      pkgs.kubectl-view-secret
      pkgs.kube-linter
      pkgs.kustomize
      pkgs.k3d
      helmfile
      kubernetes-helm
    ] ++ (pkgs.lib.lists.optional enableNodeShell pkgs.kubectl-node-shell);

    programs.kubecolor = { enable = true; };

    programs.k9s = {
      enable = true;
      package = pkgs.unstable.k9s;
      settings = {
        k9s = {
          ui = { skin = theme; };
          featureGates = { nodeShell = true; };
        };
      };
      skins = {
        typhoon = ../../assets/config/k9s/typhoon.yaml;
        whirlwind = ../../assets/config/k9s/whirlwind.yaml;
      };
    };

    home.shellAliases = {
      k = "kubectl";
      kvs = "kubectl-view-secret";
      kex = "k exec -it";
      ksh =
        "pod=$(kgp | fzf | awk '{print $1}'); print -rs kex $pod -- /bin/sh; kubectl exec -it $pod -- /bin/sh";
      kbh =
        "pod=$(kgp | fzf | awk '{print $1}'); print -rs kex $pod -- bash; kubectl exec -it $pod -- bash";
      ky = "k -o yaml";
      kg = "k get";
      kwg = "watch -n 2 -- kubectl get";
      kyg = "ky get";
      kygp = "ky get pods";
      kgp = "k get pods";
      ktx = "kubectx";
      kns = "kubens";
      kdbb =
        "pod=$(kgp | grep -- '-pg-' | fzf | awk '{print $1}'); print -rs kex $pod -- bash; kubectl exec -it $pod -- bash";
      kdbp =
        "pod=$(kgp | grep -- '-pg-' | fzf | awk '{print $1}'); print -rs kex $pod -- psql; kubectl exec -it $pod -- psql";
      kdbmab =
        "pod=$(kgp --selector='postgres-operator.crunchydata.com/role=master'| grep -- '-pg-' | fzf | awk '{print $1}'); print -rs kex $pod -- bash; kubectl exec -it $pod -- bash";
      kdbmap =
        "pod=$(kgp --selector='postgres-operator.crunchydata.com/role=master'| grep -- '-pg-' | fzf | awk '{print $1}'); print -rs kex $pod -- psql; kubectl exec -it $pod -- psql";
      kdbreb =
        "pod=$(kgp --selector='postgres-operator.crunchydata.com/role=replica'| grep -- '-pg-' | fzf | awk '{print $1}'); print -rs kex $pod -- bash; kubectl exec -it $pod -- bash";
      kdbrep =
        "pod=$(kgp --selector='postgres-operator.crunchydata.com/role=replica'| grep -- '-pg-' | fzf | awk '{print $1}'); print -rs kex $pod -- psql; kubectl exec -it $pod -- psql";
      kgetall =
        "kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found";
    };
  };
}
