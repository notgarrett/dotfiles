{ pkgs, lib, ... }:
# Just a cumulation of non-specific device packages to be shared across all systems. 
{

  environment.systemPackages = with pkgs; [
    looking-glass-client
    vesktop
    git
    python3
    r2modman
    cargo
    rustc
    openssl
    pkg-config
    obs-studio
    obsidian
    spotify
    corepack_22
    unityhub
    gdb
    lazygit
    libgccjit
    openssl.dev
    pkg-config
    libreoffice
    parsec-bin
    pavucontrol
    gtk3
    libuuid
    dbus
    alsa-lib
    zoom
    docker-compose
    google-chrome # Not a fan of this one
  ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "obsidian"
      "spotify"

    ];

}
