
local path = "$HOME/.local/share/nvim/mason/bin"

-- local servers = { 'clangd', 'pyright', 'tsserver', 'lua_ls' }

local servers = {}

local i, popen = 0, io.popen
local pfile = popen('ls "' .. path .. '"')

if pfile then
  for filename in pfile:lines() do
    print(filename)
    i = i + 1
    filename = filename:sub(1, -5)
    table.insert(servers, filename)
  end
  pfile:close()
end


