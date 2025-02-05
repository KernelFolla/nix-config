# nix-config

*My personal nix-darwin configuration*

## Why

Nix reminds me of Gentoo. I spent a part of my life getting Gentoo to work, so why not spend the rest with Nix?
Jokes aside, I've always did (tried) to keep most of my setup under version control, did symlinks, scripts, Brewfile, 

I can perform this sort of magic thanks to amazing people who shared their own experiences and made configurations public ( [just search nix-config in github](https://github.com/search?q=nix-config+darwin&type=repositories)), so I feel obliged to do the same.

## What

- **[nix](https://nixos.org/)**: A package manager and a distribution-independent package manager system that focuses on declarative and functional package management.
- **[nix-darwin](https://github.com/LnL7/nix-darwin)**: An extension of Nix that focuses on managing the configuration of macOS systems.
- **[home-manager](https://github.com/nix-community/home-manager)**: An add-on for Nix that focuses on managing user-level environments. Mainly dotfiles

## How

TBD

## First setup

### 1. Install Nix

Follow the official method to install nix:

```bash
curl -L https://nixos.org/nix/install | sh
```
Ensure to close and reopen terminal to apply changes.

### 2. Add channels

This adds home-manager and nix-darwin channels

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --add https://github.com/LnL7/nix-darwin/archive/master.tar.gz darwin
nix-channel --update
```

### 3. Install Brew

Follow the official method to install Brew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 4. run nix darwin rebuild

```bash
nix-build '<darwin>' -A darwin-rebuild
```

### 5. run nix switch

be sure to have committed the repo with your new host

```bash
nix --extra-experimental-features "nix-command flakes"  run nix-darwin/master#darwin-rebuild -- switch
```



## Cool things

- JSONnet is a domain-specific configuration language that's designed for generating JSON data structures. 
- Karabiner is a powerful keyboard customization utility for macOS 
- so I've used JSONnet to set up Karabiner configurations:)

I've also added a script to compile all JSONnet files recursively.	 

```bash
./bin/jsonnet-compile
```

## Credits

A big thank you to zmre for sharing their nix-config repository and providing inspiration for this configuration!

- **ZMRE Tutorial**: [Watch the YouTube Video](https://www.youtube.com/watch?v=LE5JR4JcvMg)
- **ZMRE personal configuration**: [zmre/nix-config Repository](https://github.com/zmre/nix-config)

