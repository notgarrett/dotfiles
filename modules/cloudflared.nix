{ config, pkgs, sops, ... }:
{
  #
  #   environment.systemPackages = with pkgs; [ cloudflared ];
  #
  #
  # sops.secrets."cloudflared/cert".path = "/home/garrett/.cloudflared/cert.pem";
  #
  #
  # sops.secrets."cloudflared/test" = {
  #     # Both are "cloudflared" by default
  #     owner = config.services.cloudflared.user;
  #     group = config.services.cloudflared.group;
  # };
  #
  #
  #   services.cloudflared = {
  #     enable = true;
  #     tunnels = {
  #       "f2a4f6ef-3df5-4360-914d-82c8460e7f6d" = {
  #         credentialsFile = config.sops.secrets."cloudflared/test".path;
  #         ingress = {
  #           "llama.garrettg.dev" = {
  #             service = "http://localhost:5555";
  #             path = "/obsidian";
  #           };
  #         };
  #         default = "http_status:404";
  #       };
  #     };
  #   };
}
