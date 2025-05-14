{ config, pkgs, lib, stylix, ... }: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "garrett";
  home.homeDirectory = "/home/garrett";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    ripgrep
    bat
    starship
    zathura
    filezilla
    base16-schemes
    ungoogled-chromium
    pass
    kate
    dolphin
    rofi-wayland
    eza
    bat
    ripgrep
    spotify
    prismlauncher
    obsidian
    fastfetch
    libreoffice-qt
    fastfetch
    tor-browser-bundle-bin
    pavucontrol
  ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [

    ];

  imports = [
    ./home-manager/zsh.nix
    ./home-manager/git.nix
    ./home-manager/nvim/default.nix
    ./home-manager/kitty.nix
    ./home-manager/firefox.nix
    ./home-manager/wayland/default.nix
    ./modules/stylix.nix
  ];

  services.dunst = { enable = true; };

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    zsh.enable = true; # see note on other shells below
    starship.enable = true;
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  #
  #

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/garrett/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = { EDITOR = "nvim"; };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
