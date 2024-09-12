{ config, pkgs, ... }: let
  hostname = config.networking.hostName;
in{
programs.zsh = {
  enable = true;
  enableCompletion = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;

  shellAliases = {
    update = "sudo nixos-rebuild switch --flake /etc/nixos/hosts/${hostname}";
    ls = "exa --all --icons --group-directories-first";
    cat = "bat";
    vi = "nvim";
    vim = "nvim";
  };
  history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
  };
  zplug = {
    enable = true;
    plugins = [
      { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
    ];
  };

};
}
