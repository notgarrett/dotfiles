{ config, pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "notgarrett";
    userEmail = "garrettrgiles@gmail.com";
    aliases = {
      ci = "commit";
      co = "checkout";
      s = "status";
    };
  };
}

