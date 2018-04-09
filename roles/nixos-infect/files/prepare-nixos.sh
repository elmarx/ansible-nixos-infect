#!/bin/sh

set -o errexit

. ~/.nix-profile/etc/profile.d/nix.sh

test -z "$NIX_CHANNEL" && NIX_CHANNEL="nixos-${1}"
nix-channel --add "https://nixos.org/channels/$NIX_CHANNEL" nixpkgs
nix-channel --update

nix-env -iE "_: with import <nixpkgs/nixos> { configuration = {}; }; with config.system.build; [ nixos-generate-config nixos-install nixos-enter manual.manpages ]"