#!/bin/bash
set -euo pipefail

# Install Xcode Command Line Tools
xcode-select --install || true

# Install Nix
if ! command -v nix &> /dev/null; then
    sh <(curl -L https://nixos.org/nix/install)
    echo "restart terminal and restart setup.sh, this in order to have nix available"
    exit
else
    echo "nix is already installed"
fi

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --add https://github.com/LnL7/nix-darwin/archive/master.tar.gz darwin

nix-channel --update
