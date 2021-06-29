{ pkgs, ... }:

{
  imports = [ ./fish.nix ./tmux.nix ./alacritty.nix ./git.nix ./vim.nix ];

  programs.home-manager.enable = true;
  home.username = "sakuraba";
  home.homeDirectory = "/home/sakuraba";
  home.stateVersion = "21.03";

  home.packages = with pkgs; [
    alacritty
    google-chrome
    git
    tig
    starship
    fish
    obsidian
    vim
    ripgrep
    fd
    procs
    ghq
    fzf
    nixfmt
    vscode
    tmux
    rustup
    stern
    skaffold
    tilt
    kubectx
    dive
    jq
    nkf
    flutter
    android-studio
    google-cloud-sdk
    kubectl
    bazelisk
    slack

    # GTK theme
    adapta-gtk-theme
    # xmonad
    networkmanager_dmenu # Network Manager on dmenu
    networkmanagerapplet # Network Manager applet
    nitrogen # wallpaper manager
  ];

  programs.exa.enable = true;
  programs.jq.enable = true;
  programs.go.enable = true;

  programs.bat = {
    enable = true;
    config = {
      theme = "Solarized (dark)";
      style = "changes,header";
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    nix-direnv.enable = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    changeDirWidgetCommand = "fd --type d";
    changeDirWidgetOptions = [ "--preview 'exa --tree {} | head -200'" ];
    defaultCommand = "fd --type f";
    fileWidgetOptions = [
      "--preview 'bat  --color=always --style=header,grid --line-range=:300 {}'"
    ];
    tmux = {
      enableShellIntegration = true;
      shellIntegrationOptions = [ "-w 80%" "-h 50%" ];
    };
  };

  programs.vscode = { enable = true; };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  xdg.enable = true;
  xdg.configFile."tig/config".text = ''
    bind generic h scroll-left
    bind generic j move-down
    bind generic k move-up
    bind generic l scroll-right

    bind generic g  none
    bind generic gg move-first-line
    bind generic gj next
    bind generic gk previous
    bind generic gp parent
    bind generic gP back
    bind generic gn view-next

    bind main    G move-last-line
    bind generic G move-last-line
  '';

  # gtk.theme = {
  # name = "Arc Darker"
  # };

  programs.broot = {
    enable = true;
    enableFishIntegration = true;
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "Adapta";
      package = pkgs.adapta-gtk-theme;
    };
  };

}
