{ callPackage }:
# Themes contains libs to interact with themes
{
  toKittyConf = callPackage ./toKittyConf.nix { };
  toLazyvimTheme = callPackage ./toLazyvimTheme.nix { };
}
