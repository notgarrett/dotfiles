{ config, pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "NotGarrett";
    userEmail = "garrettrgiles@gmail.com";
    aliases = {
      ci = "commit";
      co = "checkout";
      s = "status";
    };
  };
}

