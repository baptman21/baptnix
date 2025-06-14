{ config, pkgs, ... }:
# Enable docker
{
  config = {
    virtualisation.docker.enable = true;

    environment.systemPackages = with pkgs; [ docker-compose ];
  };
}
