{ config, ... }: {
  services.cloudflared = {
    enable = true;
    tunnels = {
      "f2a4f6ef-3df5-4360-914d-82c8460e7f6d" = {
        credentialsFile = "/home/garrett/.cloudflared/cert.pem";
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
