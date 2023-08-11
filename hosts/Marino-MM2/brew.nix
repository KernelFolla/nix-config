{
  inputs,
  config,
  pkgs,
  ...
}: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      upgrade = false;
      cleanup = "uninstall"; # should maybe be "zap" - remove anything not listed here
    };
    caskArgs.no_quarantine = true;
    global.brewfile = true;
    
    taps = [
      "koekeishiya/formulae"
    ];

    casks = [
      # standard brew packages

      #cask brew packages
      "dropbox"
      "jetbrains-toolbox"
      "iterm2"
      "logi-options-plus"
      "orbstack" # docker desktop replacement (faster)
      "notion"
      "warp" # term replacement

      
      "karabiner-elements" # keyboard shortcuts
      "espanso" # text expander functionality (but open source donationware, x-platform, rust-based)
      # Keeping the next three together as they act in concert and are made by the same guy
      "kindavim" # ctrl-esc allows you to control an input area as if in vim normal mode
      "scrolla" # use vim commands to select scroll areas and scroll
      "wooshy" # use cmd-shift-space to bring up search to select interface elements in current app
    ];

    brews = [
      "yabai" # window manager https://www.youtube.com/watch?v=k94qImbFKWE
    ];
    masApps = { 
    };
  };
}
