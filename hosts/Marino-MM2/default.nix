{pkgs, ...}: {
  imports = [
    ./brew.nix
  ];

  # here go the darwin preferences and config items
  programs.zsh.enable = true;
  environment = {
    shells = with pkgs; [bash zsh fish];
    systemPackages = [
      pkgs.coreutils
      pkgs.curl
      pkgs.jq
      pkgs.html2text
      pkgs.poetry
      pkgs.glow
      pkgs.openjdk
    ];
    systemPath = ["/opt/homebrew/bin"];
    pathsToLink = ["/Applications"];
  };

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  system.keyboard.enableKeyMapping = false;
  system.keyboard.remapCapsLockToEscape = false;
  # fonts.packages = [
  #   pkgs.nerd-fonts.meslo
  # ];
  system.defaults = {
    finder = {
      # Necessary for true finder, instead of Finder embeds.
      AppleShowAllExtensions = true;
      # Don't show icons on the desktop.
      CreateDesktop = false;
      # Search in the current folder, instead of the whole mac.
      FXDefaultSearchScope = "SCcf";
      # Don't warn us on changing a file extension.
      FXEnableExtensionChangeWarning = false;
      # Defeault to the list view in Finder windows.
      FXPreferredViewStyle = "Nlsv";
      # Show the pathbar, which gives us breadcrumbs to the current folder.
      ShowPathbar = true;
      # Show the status bar, which has some useful metadata.
      ShowStatusBar = true;
      # Use the POSIX path in the finder title, rather than just the folder name.
      _FXShowPosixPathInTitle = true;
    };
    dock = {
      # auto show and hide dock
      autohide = true;
      # remove delay for showing dock
      autohide-delay = 0.0;
      # how fast is the dock showing animation
      autohide-time-modifier = 0.2;
      expose-animation-duration = 0.2;
      tilesize = 48;
      launchanim = false;
      static-only = false;
      showhidden = true;
      show-recents = false;
      show-process-indicators = true;
      orientation = "bottom";
      mru-spaces = false;
      # mouse in top right corner will (5) start screensaver
      wvous-tr-corner = 2;
      wvous-br-corner = 4;
    };

    # https://macos-defaults.com/#🙋-what-s-a-defaults-command
    NSGlobalDomain = {
      AppleShowAllExtensions = true;
      InitialKeyRepeat = 14;
      KeyRepeat = 1;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
    };
    CustomSystemPreferences = {};
    CustomUserPreferences = {
      "com.apple.menuextra.clock" = {
        IsAnalog = 0;
        ShowAMPM = 0;
        ShowDate = 0;
        ShowDayOfWeek = 1;
      };
      "com.apple.controlcenter" = {
        "NSStatusItem Visible Bluetooth" = 1;
      };
    };
  };
  # backwards compat; don't change
  system.stateVersion = 4;
}
