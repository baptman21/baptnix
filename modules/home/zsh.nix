{ sshIdentities ? "github_key" }:
# sshIdentities is the list of keys seperated by space to add to agent
{ config, pkgs, ... }:
# ZSH configuration
{
  config = {
    programs.zsh = {
      enable = true;
      autosuggestion = { enable = true; };
      enableCompletion = true;
      syntaxHighlighting.enable = true;

      history = {
        ignoreSpace = true;
        extended = true;
        save = 420000;
        size = 420000;
      };

      initContent = ''
        export LESS=-iXFR
      '';

      oh-my-zsh = {
        enable = true;
        # theme = "bapt";
        # custom = "${../../assets/zsh-custom}";
        plugins = [ "ssh-agent" "fzf" ];
        extraConfig = ''
          zstyle :omz:plugins:ssh-agent identities ${sshIdentities}
        '';
      };
    };
  };
}
