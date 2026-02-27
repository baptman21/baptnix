{ theme }:
# Args:
# - theme: one of whirlwind, tempest
let
  colors = {
    tempest = {
      primary = "blue";
      secondary = "cyan";
    };
    typhoon = {
      primary = "purple";
      secondary = "red";
    };
    whirlwind = {
      primary = "green";
      secondary = "cyan";
    };
    storm = {
      primary = "79";
      secondary = "122";
    };
    cant = {
      primary = "24";
      secondary = "31";
    };
  };
in { config, pkgs, ... }:
# Starship configuration

{
  config = {
    programs.starship = {
      enable = true;
      # Configuration written to ~/.config/starship.toml
      settings = {
        add_newline = false;

        format =
          "[┌\\[$username@$hostname\\]$localip$shlvl$singularity\\[$directory\\] $vcsh$git_branch$git_commit$git_state$git_metrics$git_status$hg_branch$docker_context$package$c$cmake$cobol$daml$dart$deno$dotnet$elixir$elm$erlang$golang$guix_shell$haskell$haxe$helm$java$julia$kotlin$lua$nim$nodejs$ocaml$opa$perl$php$pulumi$purescript$python$raku$rlang$red$ruby$rust$scala$swift$terraform$vlang$vagrant$zig$buf$nix_shell$conda$meson$spack$direnv$memory_usage$aws$gcloud$openstack$azure$env_var$crystal$custom$sudo$cmd_duration$time$kubernetes[ ](bright-blue)$line_break└$jobs$battery$status$container$shell$character](${
            colors.${theme}.secondary
          })";

        username = {
          show_always = true;
          format = "[$user]($style)";
          style_user = "${colors.${theme}.primary}";
        };

        git_status = { use_git_executable = true; };

        hostname = {
          ssh_only = false;
          style = "${colors.${theme}.primary}";
          format = "[$ssh_symbol$hostname]($style)";
        };

        kubernetes = {
          contexts = [{
            context_pattern = ".*prod.*";
            style = "bold red";
          }];
        };

        directory = {
          style = "${colors.${theme}.primary}";
          format = "[$path]($style)[$read_only]($read_only_style)";
          truncate_to_repo = false;
          truncation_symbol = "…/";
        };

        jobs = {
          disabled = false;
          style = "${colors.${theme}.primary}";
          format = "[\\[$symbol$number\\]]($style)";
        };

        direnv = {
          disabled = false;
          style = "bright-yellow";
          allowed_msg = "";
          loaded_msg = "";
          not_allowed_msg = " ✗ not allowed";
          denied_msg = " ✗ denied";
          unloaded_msg = " ✗ not loaded";
        };

        character = { format = " "; };

        shell = {
          disabled = false;
          format = "[$indicator]($style)";
          style = "${colors.${theme}.secondary}";
          zsh_indicator = "";
          bash_indicator = "[bash](yellow)\\$";
        };

        time = {
          disabled = false;
          style = "bold blue";
        };

        status = {
          disabled = false;
          format = "[\\[](${colors.${theme}.secondary})[$symbol]($style)[\\]](${
              colors.${theme}.secondary
            })";
          symbol = "❌$status";
          success_symbol = "[$status](white)";
          not_executable_symbol = "🚫$status";
          not_found_symbol = "🔍$status";
          sigint_symbol = "🧱$status";
          signal_symbol = "⚡$status";
          style = "bold red";
        };

        # Brakets
        aws.format =
          "\\[[$symbol($profile)(\\($region\\))(\\[$duration\\])]($style)\\] ";
        bun.format = "\\[[$symbol($version)]($style)\\] ";
        c.format = "\\[[$symbol($version(-$name))]($style)\\] ";
        cmake.format = "\\[[$symbol($version)]($style)\\] ";
        cmd_duration.format = "\\[[took ⏱ $duration ]($style)\\] ";
        cobol.format = "\\[[$symbol($version)]($style)\\] ";
        conda.format = "\\[[$symbol$environment]($style)\\] ";
        crystal.format = "\\[[$symbol($version)]($style)\\] ";
        daml.format = "\\[[$symbol($version)]($style)\\] ";
        dart.format = "\\[[$symbol($version)]($style)\\] ";
        deno.format = "\\[[$symbol($version)]($style)\\] ";
        docker_context.format = "\\[[$symbol$context]($style)\\] ";
        dotnet.format = "\\[[$symbol($version)(🎯 $tfm)]($style)\\] ";
        elixir.format =
          "\\[[$symbol($version \\(OTP $otp_version\\))]($style)\\] ";
        elm.format = "\\[[$symbol($version)]($style)\\] ";
        erlang.format = "\\[[$symbol($version)]($style)\\] ";
        gcloud.format =
          "\\[[$symbol$account(@$domain)(\\($region\\))]($style)\\] ";
        git_branch.format = "\\[[$symbol$branch]($style)\\] ";
        git_status.format = "([\\[$all_status$ahead_behind\\]]($style) )";
        golang.format = "\\[[$symbol($version)]($style)\\] ";
        haskell.format = "\\[[$symbol($version)]($style)\\] ";
        helm.format = "\\[[$symbol($version)]($style)\\] ";
        hg_branch.format = "\\[[$symbol$branch]($style)\\] ";
        java.format = "\\[[$symbol($version)]($style)\\] ";
        julia.format = "\\[[$symbol($version)]($style)\\] ";
        kotlin.format = "\\[[$symbol($version)]($style)\\] ";
        kubernetes.format =
          "\\[[$symbol$context( \\($namespace\\))]($style)\\] ";
        lua.format = "\\[[$symbol($version)]($style)\\] ";
        memory_usage.format = "\\[$symbol[$ram( | $swap)]($style)\\] ";
        meson.format = "\\[[$symbol$project]($style)\\] ";
        nim.format = "\\[[$symbol($version)]($style)\\] ";
        nix_shell.format = "\\[[$symbol$state( \\($name\\))]($style)\\] ";
        direnv.format = "\\[[$symbol $loaded$allowed]($style)\\] ";
        nodejs.format = "\\[[$symbol($version)]($style)\\] ";
        ocaml.format =
          "\\[[$symbol($version)(\\($switch_indicator$switch_name\\))]($style)\\] ";
        openstack.format = "\\[[$symbol$cloud(\\($project\\))]($style)\\] ";
        package.format = "\\[[$symbol$version]($style)\\] ";
        perl.format = "\\[[$symbol($version)]($style)\\] ";
        php.format = "\\[[$symbol($version)]($style)\\] ";
        pulumi.format = "\\[[$symbol$stack]($style)\\] ";
        purescript.format = "\\[[$symbol($version)]($style)\\] ";
        python.format =
          "\\[[$symbol$pyenv_prefix($version)(\\($virtualenv\\))]($style)\\] ";
        raku.format = "\\[[$symbol($version-$vm_version)]($style)\\] ";
        red.format = "\\[[$symbol($version)]($style)\\] ";
        ruby.format = "\\[[$symbol($version)]($style)\\] ";
        rust.format = "\\[[$symbol($version)]($style)\\] ";
        scala.format = "\\[[$symbol($version)]($style)\\] ";
        spack.format = "\\[[$symbol$environment]($style)\\] ";
        sudo.format = "\\[[as $symbol]\\] ";
        swift.format = "\\[[$symbol($version)]($style)\\] ";
        terraform.format = "\\[[$symbol$workspace]($style)\\] ";
        time.format = "\\[[at $time]($style)\\] ";
        vagrant.format = "\\[[$symbol($version)]($style)\\] ";
        vlang.format = "\\[[$symbol($version)]($style)\\] ";
        zig.format = "\\[[$symbol($version)]($style)\\] ";

        # Nerdfont
        aws.symbol = "  ";
        buf.symbol = " ";
        c.symbol = " ";
        conda.symbol = " ";
        dart.symbol = " ";
        directory.read_only = " ";
        docker_context.symbol = " ";
        elixir.symbol = " ";
        elm.symbol = " ";
        git_branch.symbol = " ";
        golang.symbol = " ";
        haskell.symbol = " ";
        hg_branch.symbol = " ";
        java.symbol = " ";
        julia.symbol = " ";
        lua.symbol = " ";
        memory_usage.symbol = " ";
        meson.symbol = "喝 ";
        nim.symbol = " ";
        nix_shell.symbol = " ";
        nodejs.symbol = " ";
        package.symbol = " ";
        python.symbol = " ";
        rlang.symbol = "ﳒ ";
        ruby.symbol = " ";
        rust.symbol = " ";
        scala.symbol = " ";
        spack.symbol = "🅢 ";
        direnv.symbol = "";
      };
    };
  };
}
