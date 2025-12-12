{ inputs }:
self: super: {
  unstable = import inputs.unstable {
    inherit (self.stdenv.hostPlatform) system;
    config.allowUnfree = true;
  };
}
