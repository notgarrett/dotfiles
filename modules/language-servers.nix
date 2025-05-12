{ config, pkgs, lib, ... }:
# Should rename this to language tools.
with lib; {
  options.language-servers = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable my custom module";
    };
  };

  config = mkIf config.language-servers.enable {

    environment.systemPackages = with pkgs; [
      lldb_18
      nixfmt
      omnisharp-roslyn
      vscode-extensions.vadimcn.vscode-lldb
      sumneko-lua-language-server
      nodePackages.typescript-language-server
      rust-analyzer
      pyright
      nil
      clang
      # Add packages you want to install
    ];
  };
}
