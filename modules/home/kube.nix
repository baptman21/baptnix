{ config, pkgs, ... }:
# Config for kube
{
  home.packages = [
    pkgs.k9s
    pkgs.kubectl
    pkgs.kubernetes-helm
    pkgs.kubectx
    pkgs.kubectl-neat
    pkgs.kubectl-node-shell
    pkgs.kubectl-view-secret
    pkgs.kube-linter
  ];

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

}
