#!/bin/sh

. ~/.nix-profile/etc/profile.d/nix.sh

nix-env -p /nix/var/nix/profiles/system -f '<nixpkgs/nixos>' -I nixos-config=/etc/nixos/configuration.nix -iA system