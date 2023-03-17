# BaptNix

Nix configuration for a [Nixos](https://nixos.org/) environment with
[home-manager](https://github.com/nix-community/home-manager) (and flakes).

## Installation

Install `nixos` on your machine.

Clone this repository to some `<path>` on your machine.

The `/etc/nixos/hardware-configuration.nix` will be used by the configuration
of the hosts, make sure it is valid for your configuration.

```bash
$ sudo nixos-rebuild -j auto --impure --flake <path>#<host> switch
```

Install [home-manager](https://github.com/nix-community/home-manager).

Specify the machine to use in the [`local.nix`](./local.nix) file.

Run `home-manager`.

```bash
$ home-manager switch --flake <path>#<host>
```

## Structure

```bash
$ 
.
├── assets/                # Assets for the configuration
├── flake.lock
├── flake.nix
├── home.nix               # Definitions of homes for home-manager
│
├── hosts/
│   ├── baptcomp/          # Specific configuration for the host and home
│   ├── baptcomp.nix       # definition of an host
│   └── configuration.nix  # General configuration.nix used by all hosts
│
├── modules/               # Modules that can be shared by multiple hosts
│   ├── home/              # Home manager modules
│   └── system/            # System modules (e.g. docker)
└── README.md
```

## Hosts

Currently the following hosts are available:

* [baptcomp](./hosts/baptcomp.nix)

## Disclaimer

Even if in theory hosts and home-manager configuration are separated, on some
level they need each-other. Especially for i3-plasma configuration where i3
configuration is managed by `home-manager` but is needed for the i3+kde plasma
of the host to work. It is advised to always use both the host and the home of
every configuration available.
