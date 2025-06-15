# BaptNix

Nix configuration for multiple environments:

- Some [Nixos](https://nixos.org/) hosts with [home-manager](https://github.com/nix-community/home-manager)
  (and flakes).
- Some Standalone `home-manager` environments
- Some [Nix-Darwin](https://github.com/nix-darwin/nix-darwin) environments

## Installation

### Nixos configuration

Install `nixos` on your machine.

Clone this repository to some `<path>` on your machine.

The `/etc/nixos/hardware-configuration.nix` will be used by the configuration
of the hosts, make sure it is valid for your configuration.

```bash
sudo nixos-rebuild -j auto --impure --flake <path>#<host> switch
```

### Standalone Home Manager configuration

Install [home-manager](https://github.com/nix-community/home-manager).

Run `home-manager`.

```bash
home-manager switch --flake <path>#<home>
```

## Structure

```bash
$
.
├── assets/                # Assets for the configuration
├── flake.lock
├── flake.nix
├── darwin.nix             # Definitions of Darwin environments, to keep flake cleaner
│
├── darwin/
│   └── strom.nix          # Definition of a Darwin environments.
│
├── home.nix               # Definitions of homes for home-manager, to keep flake cleaner
│
├── homes/
│   └── tempest.nix        # Definition of a Home. May be used by a Host or Darwin environments
│
├── hosts.nix              # Definitions of Hosts, to keep flake cleaner
│
├── hosts/
│   ├── tempest.nix        # Definition of an host
│   └── shared.nix         # Shared configuration.nix used by all hosts
│
├── modules/               # Modules that can be shared by multiple hosts
│   ├── home/              # Home manager modules
│   └── system/            # System modules (e.g. docker)
└── README.md
```

## Hosts

Currently the following hosts are available:

- [tempest](./hosts/tempest.nix)
- [whirlwind](./hosts/whirlwind.nix)
- [typhoon](./hosts/typhoon.nix)

> [!WARNING]
> Typhoon is currently deprecated and not used
