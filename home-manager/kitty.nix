{ config, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      shell = "zsh";
      window_padding_width = 10;
      scrollback_lines = 10000;
      show_hyperlink_targets = "yes";
      enable_audio_bell = false;
      url_style = "none";
      underline_hyperlinks = "never";
      copy_on_select = "clipboard";
      font_family = "FiraCode";
    };
  };
}
