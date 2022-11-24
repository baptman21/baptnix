{ }:
# ZSH configuration
{
  enable = true;
  enableAutosuggestions = true;
  enableCompletion = true;
  enableSyntaxHighlighting = true;
  history.ignoreSpace = true;
  oh-my-zsh = {
    plugins = [ "ssh" "fzf" "zsh-autosugggestios" ];
  };
}
