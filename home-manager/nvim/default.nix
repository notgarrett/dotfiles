{ config, pkgs, lib, ... }: {

  home.packages = with pkgs; [
    libgccjit
    evil-helix
  ]; # Evil helix literally just being a backup.

  # I am lazy so for now it is here.

  programs.helix = {
    settings = {
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = [{
      name = "nix";
      auto-format = true;
      formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
    }];
    themes = {
      autumn_night_transparent = {
        "inherits" = "autumn_night";
        "ui.background" = { };
      };
    };
  };

  home.file = {
    ".config/nvim" = {
      source = ./nvim;
      recursive = true;
    };
  };

  programs.neovim = let
    configFile = file: builtins.readFile "./nvim/lua/config/${toString file}";
  in {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    # extraLuaConfig = ''
    #    ${builtins.readFile ./lua/keymaps.lua}
    #    ${builtins.readFile ./lua/options.lua}
    # '';

    extraLuaConfig = builtins.readFile ./init.lua;

    # This is for later tbh. Not sure if I want to do plugin management like this but I am keeping the option open.

    /* plugins = with pkgs.vimPlugins; [

         nvim-lspconfig
         lsp-zero-nvim
         cmp-nvim-lsp
         luasnip
         lsp-inlayhints-nvim
         planery-nvim

         {
           plugin = nvim-cmp;
           type = "lua";
           config = configFile cmp.lua;
         }

         rust-tools-nvim
         comment-nvim
         # rustaceanvim

         {
           plugin = which-key-nvim;
           type = "ua";
           config = configFile which-key.lua;
         }

         impatient-nvim

           {
             plugin = telescope-nvim;
             type = "lua";
             config = configFile telescope.lua;
           }

         {
           plugin = startup-nvim;
           type = "lua";
           config = configFile startup.lua;
         }

         gitsigns-nvim
         nvim-web-devicons
         {
           plugin = barbar-nvim;
           type = "lua";
           config = configFile barbar.lua;
         }

         {
           plugin = lualine-nvim;
           type = "lua";
           config = configFile lualine.lua;
         }

         {
           plugin = toggleterm-nvim;
           type = "lua";
           config = configFile toggleterm.lua;
         }

         {
           plugin = telescope-file-browser-nvim;
           type = "lua";
           config = configFile file-browser.lua;
         }

         {
             plugin = gitsigns.nvim;
             lua = "lua";
             config = configFile gitsigns.lua;
           }

         {
             plugin = nvim-tree-lua;
             lua = "lua";
             config = configFile nvim-tree.lua;
           }

           vim-bbye
           nvim-nio

           {
             plugin = nvim-treesitter;
             type = "lua";
             config = configFile treesitter.lua;
           }

           telescope-fzf-native-nvim

           vim-repeat
           {
             plugin = leap-nvim;
             type = "lua";
             config = "require('leap').add_default_mappings()";
           }
           {
             plugin = nvim-autopairs;
             type = "lua";
             config = configFile auto_pairs.lua;
           }

           {
             plugin = null-ls-nvim;
             type = "lua";
             config = configFile nullls.lua;
           }

           nvim-dap-ui
           {
             plugin = nvim-dap;
             type = "lua";
             config = configFile dap.lua;
           }

           nvim-notify
           {
             plugin = dressing-nvim;
             type = "lua";
             config = "require('dressing').setup()";
           }

       ];
    */
  };

}
