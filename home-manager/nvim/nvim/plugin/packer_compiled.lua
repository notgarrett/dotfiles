-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', { 'nvim-0.5' }) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()
  _G._packer = _G._packer or {}
  _G._packer.inside_compile = true

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end

  local function save_profiles(threshold)
    local sorted_times = {}
    for chunk_name, time_taken in pairs(profile_info) do
      sorted_times[#sorted_times + 1] = { chunk_name, time_taken }
    end
    table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
    local results = {}
    for i, elem in ipairs(sorted_times) do
      if not threshold or threshold and elem[2] > threshold then
        results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
      end
    end
    if threshold then
      table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
    end

    _G._packer.profile_output = results
  end

  time([[Luarocks path setup]], true)
  local package_path_str =
  "/home/garrett/.cache/nvim/packer_hererocks/2.1.1713773202/share/lua/5.1/?.lua;/home/garrett/.cache/nvim/packer_hererocks/2.1.1713773202/share/lua/5.1/?/init.lua;/home/garrett/.cache/nvim/packer_hererocks/2.1.1713773202/lib/luarocks/rocks-5.1/?.lua;/home/garrett/.cache/nvim/packer_hererocks/2.1.1713773202/lib/luarocks/rocks-5.1/?/init.lua"
  local install_cpath_pattern = "/home/garrett/.cache/nvim/packer_hererocks/2.1.1713773202/lib/lua/5.1/?.so"
  if not string.find(package.path, package_path_str, 1, true) then
    package.path = package.path .. ';' .. package_path_str
  end

  if not string.find(package.cpath, install_cpath_pattern, 1, true) then
    package.cpath = package.cpath .. ';' .. install_cpath_pattern
  end

  time([[Luarocks path setup]], false)
  time([[try_loadstring definition]], true)
  local function try_loadstring(s, component, name)
    local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
    if not success then
      vim.schedule(function()
        vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result,
          vim.log.levels.ERROR, {})
      end)
    end
    return result
  end

  time([[try_loadstring definition]], false)
  time([[Defining packer_plugins]], true)
  _G.packer_plugins = {
    ["Comment.nvim"] = {
      config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.comment\frequire\0" },
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/Comment.nvim",
      url = "https://github.com/numToStr/Comment.nvim"
    },
    LuaSnip = {
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/LuaSnip",
      url = "https://github.com/L3MON4D3/LuaSnip"
    },
    ["barbar.nvim"] = {
      config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.barbar\frequire\0" },
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/barbar.nvim",
      url = "https://github.com/romgrk/barbar.nvim"
    },
    ["cmp-nvim-lsp"] = {
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
      url = "https://github.com/hrsh7th/cmp-nvim-lsp"
    },
    ["dressing.nvim"] = {
      config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rdressing\frequire\0" },
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/dressing.nvim",
      url = "https://github.com/stevearc/dressing.nvim"
    },
    ["gitsigns.nvim"] = {
      config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.gitsigns\frequire\0" },
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
      url = "https://github.com/lewis6991/gitsigns.nvim"
    },
    ["impatient.nvim"] = {
      config = { "\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14impatient\frequire\0" },
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/impatient.nvim",
      url = "https://github.com/lewis6991/impatient.nvim"
    },
    ["leap.nvim"] = {
      config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25add_default_mappings\tleap\frequire\0" },
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/leap.nvim",
      url = "https://github.com/ggandor/leap.nvim"
    },
    ["lsp-inlayhints.nvim"] = {
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/lsp-inlayhints.nvim",
      url = "https://github.com/lvimuser/lsp-inlayhints.nvim"
    },
    ["lsp-zero.nvim"] = {
      config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.cmp\frequire\0" },
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
      url = "https://github.com/VonHeikemen/lsp-zero.nvim"
    },
    ["lualine.nvim"] = {
      config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.lualine\frequire\0" },
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/lualine.nvim",
      url = "https://github.com/nvim-lualine/lualine.nvim"
    },
    ["null-ls.nvim"] = {
      config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.nullls\frequire\0" },
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
      url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
    },
    ["nvim-autopairs"] = {
      config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.auto_pairs\frequire\0" },
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
      url = "https://github.com/windwp/nvim-autopairs"
    },
    ["nvim-cmp"] = {
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/nvim-cmp",
      url = "https://github.com/hrsh7th/nvim-cmp"
    },
    ["nvim-dap"] = {
      config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.dap\frequire\0" },
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/nvim-dap",
      url = "https://github.com/mfussenegger/nvim-dap"
    },
    ["nvim-dap-ui"] = {
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
      url = "https://github.com/rcarriga/nvim-dap-ui"
    },
    ["nvim-lspconfig"] = {
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
      url = "https://github.com/neovim/nvim-lspconfig"
    },
    ["nvim-nio"] = {
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/nvim-nio",
      url = "https://github.com/nvim-neotest/nvim-nio"
    },
    ["nvim-notify"] = {
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/nvim-notify",
      url = "https://github.com/rcarriga/nvim-notify"
    },
    ["nvim-tree.lua"] = {
      config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21config.nvim-tree\frequire\0" },
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
      url = "https://github.com/nvim-tree/nvim-tree.lua"
    },
    ["nvim-treesitter"] = {
      config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.treesitter\frequire\0" },
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
      url = "https://github.com/nvim-treesitter/nvim-treesitter"
    },
    ["nvim-treesitter-refactor"] = {
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
      url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
    },
    ["nvim-web-devicons"] = {
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
      url = "https://github.com/nvim-tree/nvim-web-devicons"
    },
    ["packer.nvim"] = {
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/packer.nvim",
      url = "https://github.com/wbthomason/packer.nvim"
    },
    ["plenary.nvim"] = {
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/plenary.nvim",
      url = "https://github.com/nvim-lua/plenary.nvim"
    },
    ["rust-tools.nvim"] = {
      config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
      url = "https://github.com/simrat39/rust-tools.nvim"
    },
    ["startup.nvim"] = {
      config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.startup\frequire\0" },
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/startup.nvim",
      url = "https://github.com/startup-nvim/startup.nvim"
    },
    ["telescope-file-browser.nvim"] = {
      config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24config.file-browser\frequire\0" },
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
      url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
    },
    ["telescope-fzf-native.nvim"] = {
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
      url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
    },
    ["telescope.nvim"] = {
      config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21config.telescope\frequire\0" },
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/telescope.nvim",
      url = "https://github.com/nvim-telescope/telescope.nvim"
    },
    ["toggleterm.nvim"] = {
      config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.toggleterm\frequire\0" },
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
      url = "https://github.com/akinsho/toggleterm.nvim"
    },
    ["vim-bbye"] = {
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/vim-bbye",
      url = "https://github.com/moll/vim-bbye"
    },
    ["vim-repeat"] = {
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/vim-repeat",
      url = "https://github.com/tpope/vim-repeat"
    },
    ["which-key.nvim"] = {
      config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21config.which-key\frequire\0" },
      loaded = true,
      path = "/home/garrett/.local/share/nvim/site/pack/packer/start/which-key.nvim",
      url = "https://github.com/folke/which-key.nvim"
    }
  }

  time([[Defining packer_plugins]], false)
  -- Config for: nvim-tree.lua
  time([[Config for nvim-tree.lua]], true)
  try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21config.nvim-tree\frequire\0", "config",
    "nvim-tree.lua")
  time([[Config for nvim-tree.lua]], false)
  -- Config for: lualine.nvim
  time([[Config for lualine.nvim]], true)
  try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.lualine\frequire\0", "config",
    "lualine.nvim")
  time([[Config for lualine.nvim]], false)
  -- Config for: gitsigns.nvim
  time([[Config for gitsigns.nvim]], true)
  try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.gitsigns\frequire\0", "config",
    "gitsigns.nvim")
  time([[Config for gitsigns.nvim]], false)
  -- Config for: toggleterm.nvim
  time([[Config for toggleterm.nvim]], true)
  try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.toggleterm\frequire\0", "config",
    "toggleterm.nvim")
  time([[Config for toggleterm.nvim]], false)
  -- Config for: null-ls.nvim
  time([[Config for null-ls.nvim]], true)
  try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.nullls\frequire\0", "config",
    "null-ls.nvim")
  time([[Config for null-ls.nvim]], false)
  -- Config for: nvim-autopairs
  time([[Config for nvim-autopairs]], true)
  try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.auto_pairs\frequire\0", "config",
    "nvim-autopairs")
  time([[Config for nvim-autopairs]], false)
  -- Config for: which-key.nvim
  time([[Config for which-key.nvim]], true)
  try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21config.which-key\frequire\0", "config",
    "which-key.nvim")
  time([[Config for which-key.nvim]], false)
  -- Config for: nvim-dap
  time([[Config for nvim-dap]], true)
  try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.dap\frequire\0", "config", "nvim-dap")
  time([[Config for nvim-dap]], false)
  -- Config for: rust-tools.nvim
  time([[Config for rust-tools.nvim]], true)
  try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "rust-tools.nvim")
  time([[Config for rust-tools.nvim]], false)
  -- Config for: impatient.nvim
  time([[Config for impatient.nvim]], true)
  try_loadstring("\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14impatient\frequire\0", "config",
    "impatient.nvim")
  time([[Config for impatient.nvim]], false)
  -- Config for: startup.nvim
  time([[Config for startup.nvim]], true)
  try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.startup\frequire\0", "config",
    "startup.nvim")
  time([[Config for startup.nvim]], false)
  -- Config for: leap.nvim
  time([[Config for leap.nvim]], true)
  try_loadstring(
    "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25add_default_mappings\tleap\frequire\0",
    "config", "leap.nvim")
  time([[Config for leap.nvim]], false)
  -- Config for: barbar.nvim
  time([[Config for barbar.nvim]], true)
  try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.barbar\frequire\0", "config",
    "barbar.nvim")
  time([[Config for barbar.nvim]], false)
  -- Config for: telescope-file-browser.nvim
  time([[Config for telescope-file-browser.nvim]], true)
  try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24config.file-browser\frequire\0", "config",
    "telescope-file-browser.nvim")
  time([[Config for telescope-file-browser.nvim]], false)
  -- Config for: Comment.nvim
  time([[Config for Comment.nvim]], true)
  try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.comment\frequire\0", "config",
    "Comment.nvim")
  time([[Config for Comment.nvim]], false)
  -- Config for: nvim-treesitter
  time([[Config for nvim-treesitter]], true)
  try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.treesitter\frequire\0", "config",
    "nvim-treesitter")
  time([[Config for nvim-treesitter]], false)
  -- Config for: telescope.nvim
  time([[Config for telescope.nvim]], true)
  try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21config.telescope\frequire\0", "config",
    "telescope.nvim")
  time([[Config for telescope.nvim]], false)
  -- Config for: lsp-zero.nvim
  time([[Config for lsp-zero.nvim]], true)
  try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.cmp\frequire\0", "config",
    "lsp-zero.nvim")
  time([[Config for lsp-zero.nvim]], false)
  -- Config for: dressing.nvim
  time([[Config for dressing.nvim]], true)
  try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rdressing\frequire\0",
    "config", "dressing.nvim")
  time([[Config for dressing.nvim]], false)

  _G._packer.inside_compile = false
  if _G._packer.needs_bufread == true then
    vim.cmd("doautocmd BufRead")
  end
  _G._packer.needs_bufread = false

  if should_profile then save_profiles() end
end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: ' ..
    error_msg .. '" | echom "Please check your config for correctness" | echohl None')
end
