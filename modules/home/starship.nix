{ config, pkgs, ... }:
# Starship configuration
{
  programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      add_newline = true;

      format =
        ''[┌\[](cyan)$username@$hostname[\]](cyan) $localip$shlvl$singularity$kubernetes[\[](cyan)$directory[\]](cyan) $vcsh$git_branch$git_commit$git_state$git_metrics$git_status$hg_branch$docker_context$package$c$cmake$cobol$daml$dart$deno$dotnet$elixir$elm$erlang$golang$guix_shell$haskell$haxe$helm$java$julia$kotlin$lua$nim$nodejs$ocaml$opa$perl$php$pulumi$purescript$python$raku$rlang$red$ruby$rust$scala$swift$terraform$vlang$vagrant$zig$buf$nix_shell$conda$meson$spack$memory_usage$aws$gcloud$openstack$azure$env_var$crystal$custom$sudo$cmd_duration[❄️](bright-blue)$line_break[└](cyan)$jobs$battery$time$status$container$shell$character'';

      username = {
        show_always = true;
        format = ''[$user]($style)'';
        style_user = "green";
      };

      hostname = {
        style = "green";
      };

      directory = {
        style = "green";
        format = ''[$path]($style)[$read_only]($read_only_style)'';
        truncate_to_repo = false;
        truncation_symbol = "…/";
      };

      jobs = {
        disabled = true;
        style = "green";
        format = ''[\[$symbol$number\]]($style)'';
      };

      character = {
        format = " ";
      };

      shell = {
        disabled = false;
        format = "[$indicator]($style)";
        style = "white";
        zsh_indicator = "";
        bash_indicator = "<bash>";
      };

      status = {
        disabled = false;
        format = ''[\[](cyan)[$symbol]($style)[\]](cyan)'';
        symbol = ''❌$status'';
        success_symbol = ''[$status](white)'';
        not_executable_symbol = ''🚫$status'';
        not_found_symbol = ''🔍$status'';
        sigint_symbol = ''🧱$status'';
        signal_symbol = ''⚡$status'';
        style = ''bold red'';
      };
    };
  };
}
