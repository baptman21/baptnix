{ }:
# ZSH configuration
{
  enable = true;
  enableAutosuggestions = true;
  enableCompletion = true;
  enableSyntaxHighlighting = true;
  history.ignoreSpace = true;
  oh-my-zsh = {
    enable = true;
    theme = "bapt";
    custom = "${./config/zsh-custom}";
    plugins = [ "ssh-agent" "fzf" ];
  };
}
