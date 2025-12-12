{ sshDir }:
# SSH config
#
# Args:
# - sshDir: path to the .ssh dir
#
{ config, pkgs, ... }:
let cri_key = sshDir + "/cri_key";
in {
  config = {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      extraConfig = ''
        AddKeysToAgent yes
        SendEnv EDITOR
      '';
      matchBlocks = {
        "*" = {
          forwardAgent = false;
          addKeysToAgent = "no";
          compression = false;
          serverAliveInterval = 0;
          serverAliveCountMax = 3;
          hashKnownHosts = false;
          userKnownHostsFile = "~/.ssh/known_hosts";
          controlMaster = "no";
          controlPath = "~/.ssh/master-%r@%n:%p";
          controlPersist = "no";
        };

        "git.assistants.epita.fr" = { identityFile = cri_key; };

        "git.forge.epita.fr" = { identityFile = cri_key; };

        "gitlab.cri.epita.fr" = { identityFile = sshDir + "/gitlab_cri_key"; };

        "github.com" = { identityFile = sshDir + "/github_key"; };

      };
    };
  };
}
