{
  inputs,
  config,
  pkgs,
  ...
}: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "uninstall"; # should maybe be "zap" - remove anything not listed here
    };
    caskArgs.no_quarantine = true;
    global.brewfile = true;

    taps = [
      "koekeishiya/formulae"
      # "homebrew/services"
    ];

    casks = [
      "dropbox"
      "google-chrome"
      # dev ide
      "jetbrains-toolbox"
      "figma"
      "visual-studio-code@insiders"
      # dev tools
      "warp" # term replacement
      "orbstack" # docker desktop replacement (faster)
      # chats
      "microsoft-teams"
      "whatsapp"
      # osx tools
      "caffeine"
      "onyx"
      "coconutbattery"
      # "jordanbaird-ice"
    ];

    brews = [
      "ripgrep"
      "ncdu"
      "openjdk"
      # dev tools
      "nvm"
      "pyenv"
      "uv"
    ];
    masApps = {
    };
  };
}
