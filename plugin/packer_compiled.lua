-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
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
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
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
local package_path_str = "/Users/jonathan.komar/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/jonathan.komar/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/jonathan.komar/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/jonathan.komar/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/jonathan.komar/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["beacon.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/beacon.nvim",
    url = "https://github.com/DanilaMihailov/beacon.nvim"
  },
  ["cheatsheet.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/cheatsheet.nvim",
    url = "https://github.com/sudormrfbin/cheatsheet.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["editorconfig.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/editorconfig.nvim",
    url = "https://github.com/gpanders/editorconfig.nvim"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["gitlinker.nvim"] = {
    config = { 'require("setup/gitlinker")' },
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/gitlinker.nvim",
    url = "https://github.com/ruifm/gitlinker.nvim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/gv.vim",
    url = "https://github.com/junegunn/gv.vim"
  },
  ["halcyon-neovim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/halcyon-neovim",
    url = "https://github.com/kwsp/halcyon-neovim"
  },
  ["iceberg.vim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/iceberg.vim",
    url = "https://github.com/cocopon/iceberg.vim"
  },
  indentLine = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/indentLine",
    url = "https://github.com/Yggdroot/indentLine"
  },
  jester = {
    config = { 'require("setup/jester")' },
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/jester",
    url = "https://github.com/David-Kunz/jester"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lualine.nvim"] = {
    config = { 'require("setup/lualine")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["lumiere.vim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/lumiere.vim",
    url = "https://github.com/alexanderjeurissen/lumiere.vim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  melange = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/melange",
    url = "https://github.com/savq/melange"
  },
  ["mini.nvim"] = {
    config = { 'require("setup/mini")' },
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  ["minimap.vim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/minimap.vim",
    url = "https://github.com/wfxr/minimap.vim"
  },
  molokai = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/molokai",
    url = "https://github.com/tomasr/molokai"
  },
  ["neovim-ayu"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/neovim-ayu",
    url = "https://github.com/Shatur/neovim-ayu"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["null-ls.nvim"] = {
    config = { 'require("setup/null-ls")' },
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-align"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/nvim-align",
    url = "https://github.com/RRethy/nvim-align"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { 'require("setup/nvim-cmp")' },
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { 'require("setup/nvim-lspconfig")' },
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-mapper"] = {
    config = { 'require("setup/nvim-mapper")' },
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/nvim-mapper",
    url = "https://github.com/lazytanuki/nvim-mapper"
  },
  ["nvim-osc52"] = {
    config = { 'require("setup/nvim-osc52")' },
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/nvim-osc52",
    url = "https://github.com/ojroques/nvim-osc52"
  },
  ["nvim-tree-docs"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/nvim-tree-docs",
    url = "https://github.com/nvim-treesitter/nvim-tree-docs"
  },
  ["nvim-tree.lua"] = {
    config = { 'require("setup/nvim-tree")' },
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { 'require("setup/nvim-treesitter")' },
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["papercolor-theme"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/papercolor-theme",
    url = "https://github.com/NLKNguyen/papercolor-theme"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["prettier.nvim"] = {
    config = { 'require("setup/prettier")' },
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/prettier.nvim",
    url = "https://github.com/MunifTanjim/prettier.nvim"
  },
  ["schemastore.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/schemastore.nvim",
    url = "https://github.com/b0o/schemastore.nvim"
  },
  ["sessions.nvim"] = {
    config = { 'require("setup/sessions")' },
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/sessions.nvim",
    url = "https://github.com/natecraddock/sessions.nvim"
  },
  ["tabline.nvim"] = {
    config = { 'require("setup/tabline")' },
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/tabline.nvim",
    url = "https://github.com/kdheepak/tabline.nvim"
  },
  tagbar = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/tagbar",
    url = "https://github.com/majutsushi/tagbar"
  },
  ["telescope-bookmarks.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/telescope-bookmarks.nvim",
    url = "https://github.com/dhruvmanila/telescope-bookmarks.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/telescope-github.nvim",
    url = "https://github.com/nvim-telescope/telescope-github.nvim"
  },
  ["telescope-packer.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/telescope-packer.nvim",
    url = "https://github.com/nvim-telescope/telescope-packer.nvim"
  },
  ["telescope-repo.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/telescope-repo.nvim",
    url = "https://github.com/cljoly/telescope-repo.nvim"
  },
  ["telescope-tabs"] = {
    config = { 'require("setup/telescope-tabs")' },
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/telescope-tabs",
    url = "https://github.com/LukasPietzschmann/telescope-tabs"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { 'require("setup/telescope")' },
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-dispatch-neovim"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/vim-dispatch-neovim",
    url = "https://github.com/radenling/vim-dispatch-neovim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["wind-colors"] = {
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/wind-colors",
    url = "https://github.com/windwp/wind-colors"
  },
  ["workspaces.nvim"] = {
    config = { 'require("setup/workspaces")' },
    loaded = true,
    path = "/Users/jonathan.komar/.local/share/nvim/site/pack/packer/start/workspaces.nvim",
    url = "https://github.com/natecraddock/workspaces.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require("setup/nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: jester
time([[Config for jester]], true)
require("setup/jester")
time([[Config for jester]], false)
-- Config for: workspaces.nvim
time([[Config for workspaces.nvim]], true)
require("setup/workspaces")
time([[Config for workspaces.nvim]], false)
-- Config for: nvim-osc52
time([[Config for nvim-osc52]], true)
require("setup/nvim-osc52")
time([[Config for nvim-osc52]], false)
-- Config for: tabline.nvim
time([[Config for tabline.nvim]], true)
require("setup/tabline")
time([[Config for tabline.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
require("setup/null-ls")
time([[Config for null-ls.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("setup/nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: gitlinker.nvim
time([[Config for gitlinker.nvim]], true)
require("setup/gitlinker")
time([[Config for gitlinker.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require("setup/nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: sessions.nvim
time([[Config for sessions.nvim]], true)
require("setup/sessions")
time([[Config for sessions.nvim]], false)
-- Config for: mini.nvim
time([[Config for mini.nvim]], true)
require("setup/mini")
time([[Config for mini.nvim]], false)
-- Config for: nvim-mapper
time([[Config for nvim-mapper]], true)
require("setup/nvim-mapper")
time([[Config for nvim-mapper]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require("setup/nvim-tree")
time([[Config for nvim-tree.lua]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require("setup/telescope")
time([[Config for telescope.nvim]], false)
-- Config for: telescope-tabs
time([[Config for telescope-tabs]], true)
require("setup/telescope-tabs")
time([[Config for telescope-tabs]], false)
-- Config for: prettier.nvim
time([[Config for prettier.nvim]], true)
require("setup/prettier")
time([[Config for prettier.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'lualine.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
