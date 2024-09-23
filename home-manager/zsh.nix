{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
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
      plugins = [{
        name = "zsh-users/zsh-autosuggestions";
      }
        {name = "jeffreytse/zsh-vi-mode";}
        # Simple plugin installation
        ];
    };

  };
}
