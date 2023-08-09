{ pkgs, pwnvim, ... }: {
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "23.05";
  # specify my home-manager configs
  home.packages = with pkgs; [
    ripgrep
    fd
    curl
    less
    pwnvim.packages."aarch64-darwin".default
  ];
  home.sessionVariables = {
    PAGER = "less";
    CLICLOLOR = 1;
    EDITOR = "nvim";
  };
  programs.bat.enable = true;
  programs.bat.config.theme = "TwoDark";
  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;
  programs.exa.enable = true;
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.shellAliases = {
    ls = "ls --color=auto -F";
    nixswitch = "darwin-rebuild switch --flake ~/_work/.#";
    nixup = "pushd ~/_work; nix flake update; nixswitch; popd";
  };
  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;
  programs.starship.settings.battery.disabled = true;
  programs.alacritty = {
    enable = true;
    settings.font.normal.family = "MesloLGS Nerd Font Mono";
    settings.font.size = 16;
  };
  programs.git = {
    enable = true;
    userEmail = "kernelfolla@gmail.com";
    userName = "Marino Di Clemente";
    ignores = [ "*~" ".DS_Store" ];
    extraConfig = {
      core = {
        editor = "vim";
      };
      url = {
        "git@github.com:" = {
          insteadOf = "https://github.com/";
        };
      };
      pull = {
        rebase = true;
      };
    };
  };
  programs.fish = {
    enable = true;
  };
  # home.file.".inputrc".source = ./dotfiles/inputrc;
}
