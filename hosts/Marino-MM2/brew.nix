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
      "notion"
      "warp" # term replacement
      "microsoft-teams"
      "obsidian"
      "telegram"
      "whatsapp"
      "google-chrome"
      "firefox"
      "brave-browser"
      # "karabiner-elements" # keyboard shortcuts
      # "espanso" # text expander functionality (but open source donationware, x-platform, rust-based)
      # Keeping the next three together as they act in concert and are made by the same guy
      # "kindavim" # ctrl-esc allows you to control an input area as if in vim normal mode
      # "scrolla" # use vim commands to select scroll areas and scroll
      # "wooshy" # use cmd-shift-space to bring up search to select interface elements in current app
      # "switchhosts" # a tool to manage hostnames
      "postman"
      # "redis-pro"
      # "cursor"
      "mockoon"
      "onyx"
      "visual-studio-code@insiders"
    ];

    brews = [
      # "yabai" # window manager https://www.youtube.com/watch?v=k94qImbFKWE
      # "jsonnet" #
      "nvm"

      # django deps
      # "weasyprint"
      # "cairo"
      # "pango"
      # "libffi"
      # "gobject-introspection"
      "pkgconfig"
      "mysql"
      # "redis"
      "pyenv"
    ];
    masApps = {
    };
  };
}
