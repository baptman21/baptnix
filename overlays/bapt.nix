self: super: {
  # Add owned packages to .bapt
  bapt = import ../pkgs { pkgs = self.pkgs; };
}
