{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName  = "John Doe";
    userEmail = "johndoe@example.com";
    aliases = {
      ci = "commit";
      co = "checkout";
      s = "status";
    };
  };
}

