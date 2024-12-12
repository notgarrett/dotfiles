-- Add additional capabilities supported by nvim-cmp
-- Mason does not work on nix :()
-- require("mason-lspconfig").setup_handlers {
--   -- The first entry (without a key) will be the default handler
--   -- and will be called for each installed server that doesn't have
--   -- a dedicated handler.
--   function(server_name) -- default handler (optional)
--     require("lspconfig")[server_name].setup {
--
--     } end,
--   -- Next, you can provide a dedicated handler for specific servers.
--   -- For example, a handler override for the `rust_analyzer`:
--   --
--
--   ["rust_analyzer"] = function()
--     require("config.rust_tools")
--   end
-- }
--
--
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_zero = require('lsp-zero')
-- I plan to set up a lsp_zero config in the future.


lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- here you can setup the language servers

------------------------------------------------
-- Lua

require('lspconfig').lua_ls.setup({
  capabilities = lsp_capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT'
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
        }
      }
    }
  }
})


-- Rust

require('lspconfig').rust_analyzer.setup({
  capabilities = lsp_capabilities,
  on_attach = function(client, bufnr)
    require("config.rust_tools")
  end
})


-- Typescript

require('lspconfig').tsserver.setup({
  capabilities = lsp_capabilities,
})

-- Nixos
require('lspconfig').nil_ls.setup({
  capabilities = lsp_capabilities,
})

-- Omnisharp
require('lspconfig').omnisharp.setup({
  capabilities = lsp_capabilities,
  cmd = { "OmniSharp" }
})

-- Python
require 'lspconfig'.pyright.setup({
  capabilites = lsp_capabilities,
})


-- luasnip setup
local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return
end

-- nvim-cmp setup
local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- LSP Inline hints


local default_config = {
  inlay_hints = {
    parameter_hints = {
      show = true,
      prefix = "<- ",
      separator = ", ",
      remove_colon_start = false,
      remove_colon_end = true,
    },
    type_hints = {
      -- type and other hints
      show = true,
      prefix = "",
      separator = ", ",
      remove_colon_start = false,
      remove_colon_end = false,
    },
    only_current_line = false,
    -- separator between types and parameter hints. Note that type hints are
    -- shown before parameter
    labels_separator = "  ",
    -- whether to align to the length of the longest line in the file
    max_len_align = false,
    -- padding from the left if max_len_align is true
    max_len_align_padding = 1,
    -- highlight group
    highlight = "Comment",
    -- virt_text priority
    priority = 0,
  },
  enabled_at_startup = true,
  debug_mode = false,
}

require("lsp-inlayhints").setup(default_config)

vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
})
