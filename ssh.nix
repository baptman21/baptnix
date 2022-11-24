{ homeDirectory }:
# SSH config
let
  cri_key = homeDirectory + "/.ssh/cri_key";
in
{
  enable = true;
  extraConfig = ''
    AddKeysToAgent yes
    SendEnv EDITOR
  '';
  matchBlocks = {
    "git.assistants.epita.fr" = {
      identityFile = cri_key;
    };

    "git.forge.epita.fr" = {
      identityFile = cri_key;
    };

    "gitlab.cri.epita.fr" = {
      identityFile = homeDirectory + "/.ssh/gitlab_cri_key";
    };

    "github.com" = {
      identityFile = homeDirectory + "/.ssh/github_key";
    };
  };
}
