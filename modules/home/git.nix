{ config, pkgs, ... }:
# Git configuration
{
  config = {
    programs.git = {
      enable = true;
      aliases = {
        st = "status";
        sw = "switch";
        sc = "switch -c";
        b = "branch";
        cp = "cherry-pick";
        cb = "checkout -b";
        ch = "checkout";
        cc = "commit";
        ca = "commit --amend";
        ce = "commit --amend --no-edit";
        mgt = "mergetool";
        puo = "push -u origin";
        pushft = "push --follow-tags";
        pushwl = "push --force-with-lease";
        pushff = "push --force";
        alog = "log --oneline --graph --all --decorate";
        tlog = "log --oneline --graph --decorate -n 15";
        nlog = "log --oneline --graph --decorate";
        brclean = ''
          !git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D "$branch"; done'';
      };

      userName = "Baptiste Bourdet";
      userEmail = "bat.bourdet@gmail.com";

      extraConfig = {
        init.defaultBranch = "main";
        push.merge = true;
        commit.verbose = true;
        rebase = {
          autoStash = true;
          autoSquash = true;
        };
        merge.tool = "fugitive";
        mergetool."fugitive".cmd = ''
          lvim -f -c '"set nocursorline"' -c '":set wrap"' -c "Gvdiffsplit!" "$MERGED"'';
        core = {
          editor = "vim";
          autocrlf = "input";
          fsmonitor = true;
          untrackedcache = true;
        };
        pull.ff = "only";
      };
    };
  };
}
