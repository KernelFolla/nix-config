{pkgs, ...}: {
  imports = [
    ./brew.nix
  ];

  # here go the darwin preferences and config items
  programs.zsh.enable = true;
  environment = {
    shells = with pkgs; [bash zsh fish];
    loginShell = pkgs.zsh;
    systemPackages = [
      pkgs.coreutils
      pkgs.curl
      pkgs.jq
      pkgs.xz # used by pyenv
      pkgs.pyenv
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
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;
  fonts.fontDir.enable = true; # DANGER
  fonts.fonts = [(pkgs.nerdfonts.override {fonts = ["Meslo"];})];
  services.nix-daemon.enable = true;
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
      # "com.apple.Safari" = {
      #  WebAutomaticSpellingCorrectionEnabled = false;
      # };
      "mo.com.sleeplessmind.Wooshy" = {
        "KeyboardShortcuts_toggleWith" = "{\"carbonModifiers\":768,\"carbonKeyCode\":49}";
        SUEnableAutomaticChecks = 0;
        SUUpdateGroupIdentifier = 3425398139;
        allowCyclingThroughTargets = 1;
        "com_apple_SwiftUI_Settings_selectedTabIndex" = 4;
        fuzzyMatchingFlavor = "wooshyClassic";
        hazeOverWindowStyle = "fadeOutExceptDockMenuBarAndFrontmostApp";
        inputPosition = "aboveWindow";
        inputPreset = "custom";
        inputTextSize = 20;
        searchIncludesTrafficLightButtons = 1;
      };
      "mo.com.sleeplessmind.kindaVim" = {
        "KeyboardShortcuts_enterNormalMode" = "{\"carbonModifiers\":4096,\"carbonKeyCode\":53}";
        "NSStatusItem Preferred Position Item-0" = 6009;
        SUEnableAutomaticChecks = 0;
        SUUpdateGroupIdentifier = 790660886;
        appsForWhichToEnforceElectron = "[\"com.superhuman.electron\"]";
        appsForWhichToEnforceKeyboardStrategy = "[\"mo.com.sleeplessmind.Wooshy\"]";
        appsForWhichToUseHybridMode = "[\"com.apple.Safari\"]";
        appsToAdviseFor = "[\"com.apple.mail\"]";
        appsToIgnore = "[\"io.alacritty\",\"com.microsoft.VSCode\"]";
        charactersWindowContent = "move";
        "com_apple_SwiftUI_Settings_selectedTabIndex" = 0;
        enableCommandPassthrough = 1;
        enableOptionPassthrough = 1;
        enterNormalModeWith = "customShortcut";
        hazeOverWindowNonFullScreenOpacity = "0.5173477564102564";
        sendEscapeToMacOSWith = "commandEscape";
        showCharactersWindow = 0;
      };
      "mo.com.sleeplessmind.Scrolla" = {
        "KeyboardShortcuts_toggleWith" = "{\"carbonModifiers\":4352,\"carbonKeyCode\":49}";
        "NSStatusItem Preferred Position Item-0" = 6276;
        SUEnableAutomaticChecks = 0;
        SUUpdateGroupIdentifier = 3756402529;
        "com_apple_SwiftUI_Settings_selectedTabIndex" = 0;
        ignoreAreasWithoutScrollBars = 0;
      };
    };
  };
  # backwards compat; don't change
  system.stateVersion = 4;
}
