{config }:
{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "" = {
        credentialsFile = "${config.sops.secrets.cloudflared-creds.path}";
        ingress = {
          "llama.garrettg.dev" = {
            service = "http://localhost:5555";
            path = "/obsidian";
          };
        };
        default = "http_status:404";
      };
    };
  };
}
