{ config, pkgs, ... }:
# Enable I3 and KDE together
{
  # Kerberos configuration
  krb5 = {
    enable = true;
    config = ''
      [libdefaults]
      	default_realm = ATHENA.MIT.EDU
      	forwardable = true
      	rdns = false

      [realms]
      	CRI.EPITA.FR = {
      		admin_server = kerberos.pie.cri.epita.fr
      	}

      # [domain_realm]
    '';
  };
}
