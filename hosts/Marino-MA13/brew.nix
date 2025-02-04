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
      "homebrew/services"
    ];

    casks = [
      "caffeine"
      "dropbox"
      "jetbrains-toolbox"
      "orbstack" # docker desktop replacement (faster)
      "warp" # term replacement
      "microsoft-teams"
      "google-chrome"
      "onyx"
    ];

    brews = [
      "nvm"
    ];
    masApps = {
    };
  };
}
