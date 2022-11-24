{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
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
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    aliases = {
      st = "status";
      sw = "switch";
      sc = "switch -c";
      b = "branch";
      cb = "checkout -b";
      ch = "checkout";
      mgt = "mergetool";
      pushft = "push --follow-tags";
      pushwl = "push --force-with-lease";
      pushff = "push --force";
      alog = "log --oneline --graph --all --decorate";
      tlog = "log --oneline --graph --decorate -n 15";
      nlog = "log --oneline --graph --decorate";
    };

    userName = "Baptiste Bourdet";
    userEmail = "baptiste.bourdet@epita.fr";

    extraConfig = {
      push.merge = true;
      commit.verbose = true;
      rebase = {
        autoStash = true;
        autoSquash = true;
      };
      merge.tool = "fugitive";
      mergetool."fugitive" = ''vim -f -c '"set nocursorline"' -c '":set wrap"' -c "Gvdiffsplit!" "$MERGED"'';
      core = {
        editor = "vim";
	autocrlf = "input";
      };
      pull.ff = "only";
    };
  };
}
