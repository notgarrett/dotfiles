local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not status_ok then
  return
end



vim.g.nvim_tree_quit_on_open = 0 -- this doesn't play well with barbar

local options = {
  ensure_installed = { "lua", "rust" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}


treesitter.setup(options)

require 'nvim-treesitter.configs'.setup {
  refactor = {
    -- highlight_current_scope = { enable = false },

    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
    navigation = {
      enable = true,
      -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },


    smart_rename = {
      enable = true,
      -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
      keymaps = {
        smart_rename = "grr",
      },
    },
  },
}

