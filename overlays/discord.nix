let
  version = "0.0.27";
in
self: super: {
  discord = super.discord.overrideAttrs (
    _: {
      inherit version;

      src = builtins.fetchurl {
        url = "https://dl.discordapp.net/apps/linux/${version}/discord-${version}.tar.gz";
        sha256 = "sha256:1da72ic2i5q5zna2k7760cppyxk10k96m4qzav8b9gswy24dmwg9";
        # sha256 = super.lib.fakeSha256;
      };
    }
  );
}
