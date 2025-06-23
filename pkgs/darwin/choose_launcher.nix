{ pkgs, ... }:
# choose launcher on macos
pkgs.writeShellScriptBin "choose-launcher.sh" ''
  application_dirs=(
    "/Applications/"
    "/System/Applications/"
    "/System/Library/CoreServices/"
    "/System/Applications/Utilities/"
    "$HOME/Applications"
    "$HOME/Applications/Home Manager Apps"
  )

  bins="$(mktemp)"

  echo "$bins"
  export IFS=$'\n'

  echo $PATH
  for p in $(tr ':' '\n' <<< "$PATH"); do
    echo $p
    echo "$(ls "$p")" >> "$bins"
  done

  for d in "''${application_dirs[@]}"; do
    echo "$(ls "$d")" >> "$bins"
  done

  selection=$(cat "$bins" | ${pkgs.choose-gui}/bin/choose)

  if echo "$selection" | grep -q ".app"
  then
    app_name=$(basename "$selection" .app)
    osascript -e "tell application \"$app_name\" to activate"
  else
    binary="$(which "$selection")"
    exec "$binary" &
    disown
  fi
''
