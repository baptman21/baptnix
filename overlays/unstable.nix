{ inputs }:
self: super: {
  unstable = import inputs.unstable {
    system = self.system;
    config.allowUnfree = true;
  };
}
