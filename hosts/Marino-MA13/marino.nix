{
  self,
  pkgs,
  pwnvim,
  ...
}:
let
  imports = [
  ];
in
{

  inherit imports;

  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "23.05";
  # specify my home-manager configs
  home.packages = with pkgs; [
    thefuck
    ripgrep
    fd
    curl
    less
    ncdu
    pwnvim.packages."aarch64-darwin".default
    bun
    lftp
    vulnix
  ];
  home.sessionPath = [
    "$HOME/_work/m/nix-config/bin"
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
  programs.eza.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
        export PYENV_ROOT="$HOME/.pyenv"
        export PATH="$PYENV_ROOT/bin:$PATH"
        if command -v pyenv 1>/dev/null 2>&1; then
            eval "$(pyenv init --path)"
            # eval "$(pyenv virtualenv-init -)"
        fi

        export NVM_DIR="$HOME/.nvm"
        [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
        [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
        export JAVA_HOME=$(/usr/libexec/java_home)
        export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
        export LDFLAGS="-L/opt/homebrew/opt/mysql-client/lib"
        export CPPFLAGS="-I/opt/homebrew/opt/mysql-client/include"
        export LD_LIBRARY_PATH="/opt/homebrew/lib/":$LD_LIBRARY_PATH
    '';
  };
  programs.fish = {
    enable = true;
    loginShellInit = ''
        set -x PYENV_ROOT $HOME/.pyenv'
        set -x PATH $PYENV_ROOT/bin $PATH'
        status --is-interactive; and source (pyenv init -|psub)'
        # status --is-interactive; and source (pyenv virtualenv-init -|psub)'


        # install plugins installer
        if not functions -q fisher
            curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
            fish -c fisher
        end

    '';
  };


  # https://nix-community.github.io/home-manager/options.html
  home.shellAliases = {
    ls = "ls --color=auto -F";
    nixswitch = "darwin-rebuild switch --flake ~/_work/m/nix-config/.#";
    nixup = "pushd ~/_work/m/nix-config; nix flake update; nixswitch; popd";
    gst = "git status";
    q = "exit";
    n = "npm";
    nr = "npm run";
    m = "make";
    f = "thefuck";
    p = "python";
    pm = "python manage.py";
    pmm = "python manage.py migrate";
    pmmm = "python manage.py makemigrations";
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
    ignores = ["*~" ".DS_Store" "*.swp" "*.swo"];
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
  # home.file.".inputrc".source = ./dotfiles/inputrc;
}
