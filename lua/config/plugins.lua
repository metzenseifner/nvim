-- git clone --depth 1 https://github.com/wbthomason/packer.nvim\
--   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- needed only if delayed loading in opt
vim.cmd [[packadd packer.nvim]]

-- PackerCompile needed after changing config to update cache
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

function get_setup(name)
  return string.format('require("setup/%s")', name)
end

-- loads packer module at every startup
return require('packer').startup({
  function(use) -- loads plugins
    --print("packer starting up: :PackerCompile :PackerClean :PackerInstall :PackerUpdate :PackerSync :PackerLoad")
    -- if you get linter complaints about use being an undefined global, these
    -- errors are spurious - packer injects use into the scope of the function
    -- passed to startup
    -- Packer can manage itself
    use { -- must be near first to load to grab keymaps of other plugins
      "lazytanuki/nvim-mapper",
      --config = function() require("nvim-mapper").setup{} end,
      config = get_setup('nvim-mapper'),
      before = "telescope.nvim" -- important to load before telescope
    }
    use { 'wbthomason/packer.nvim' }
    use { 'tpope/vim-unimpaired' }
    -- use { 'junegunn/fzf' } -- replaced by live_grep in Telescope
    use { 'tpope/vim-dispatch' }
    use { 'radenling/vim-dispatch-neovim' }
    use { 'gpanders/editorconfig.nvim' }
    use { 'wfxr/minimap.vim' } -- Orientation in file
    --use { 'mhinz/vim-startify' } -- startup with list of most recent
    --use { 'folke/which-key.nvim',
    --      get_setup('which-key')
    --    }
    use { 'norcalli/nvim-colorizer.lua' }
    use { 'nvim-lualine/lualine.nvim',
      config = get_setup('lualine'),
      event = "VimEnter",
    }
    use { 'williamboman/nvim-lsp-installer' }
    use { 'nvim-treesitter/nvim-treesitter',
      -- indentation module could influence indentexpr; verbose set indentexpr?
      requires = {
        { 'kyazdani42/nvim-web-devicons' }
      },
      config = get_setup('nvim-treesitter'),
      run = "TSUpdate",
      -- {'do': ':TSUpdate'}
    } -- see :TSInstallInfo }
    --use { 'JoosepAlviste/nvim-ts-context-commentstring', before = 'nvim-treesitter/nvim-treesitter' }
    use { 'nvim-treesitter/nvim-tree-docs' }
    -- Color schemes
    use { 'EdenEast/nightfox.nvim' }
    use { 'alexanderjeurissen/lumiere.vim' }
    use { 'NLKNguyen/papercolor-theme' }
    use { 'savq/melange' }
    use { 'cocopon/iceberg.vim' }
    use { 'folke/tokyonight.nvim' }
    use { 'kwsp/halcyon-neovim' }
    use { 'windwp/wind-colors' }
    --use { 'michaelmalick/vim-colors-bluedrake' }
    use { 'tomasr/molokai' }
    --use { 'vim-scripts/darkblue2.vim'}
    -- End Color schemes


    use { 'Shatur/neovim-ayu' }
    -- Telescope
    use { 'nvim-telescope/telescope.nvim', -- replaces any search plugin you use, including FZF
      --config = function() require("telescope").load_extension("mapper") end
      config = get_setup('telescope'),
      requires = {
        { "nvim-lua/plenary.nvim" },
        --{ "nvim-telescope/telescope-live-grep-args.nvim" },
      }
    }
    -- Telescope Extensions
    use { 'nvim-telescope/telescope-file-browser.nvim' }
    -- Telescope Extensions
    use "cljoly/telescope-repo.nvim"
    use { "nvim-telescope/telescope-ui-select.nvim" }
    use "dhruvmanila/telescope-bookmarks.nvim"
    use "nvim-telescope/telescope-github.nvim"
    use "nvim-telescope/telescope-packer.nvim"
    --use { 'tpope/vim-vinegar' }-- adds key . to netrw to paste path on :command line }
    --use { 'jedrzejboczar/possession.nvim', requires = {'nvim-lua/plenary.nvim'}, after = {'nvim-lua/plenary.nvim'} } -- Session / Project Manager
    --use { 'nvim-lua/plenary.nvim', get_setup('plenary') } -- dep of possession }
    --use { 'romgrk/todoist.nvim' }
    use { 'tpope/vim-surround', requires = { 'tpope/vim-repeat' } }
    --use { 'b3nj5m1n/kommentary' }
    --use { 'christoomey/vim-titlecase' }
    --use { 'inkarkat/vim-ReplaceWithRegister' }
    --use { 'christoomey/vim-sort-motion' }
    --use { 'christoomey/vim-system-copy' }
    --use { 'folke/todo-comments.nvim' }
    use { 'RRethy/nvim-align' }
    use { 'sudormrfbin/cheatsheet.nvim',
      requires = {
        { 'nvim-telescope/telescope.nvim' },
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
      }
    }
    --use { 'francoiscabrol/ranger.vim' } -- python-based cli file browser
    use { 'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
      config = get_setup('nvim-tree'),
    }
    --use { 'Shatur/neovim-session-manager',
    --  requires = {
    --    'nvim-lua/plenary.nvim'
    --  }
    --}
    --use { 'nvim-telescope/telescope-ui-select.nvim', requires = {'nvim-telescope/telescope.nvim' }}
    use { --why this package manager? to get language servers automatically
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    }
    use { 'b0o/schemastore.nvim' }
    use { 'echasnovski/mini.nvim', branch = 'stable',
      config = get_setup('mini')
    }
    use { 'kdheepak/tabline.nvim',
      config = get_setup('tabline'),
      requires = { { 'hoob3rt/lualine.nvim', opt = true }, { 'kyazdani42/nvim-web-devicons', opt = true } }
    }
    use { 'natecraddock/workspaces.nvim',
      config = get_setup('workspaces')
    }
    use { 'natecraddock/sessions.nvim',
      config = get_setup('sessions')
    }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use { 'ruifm/gitlinker.nvim', requires = 'nvim-lua/plenary.nvim',
      config = get_setup('gitlinker'),
      -- Copy to System Clipboard using Terminal OSC 52 ASCII Control Sequence
      requires = { 'ojroques/nvim-osc52' }
    }
    use { 'ojroques/nvim-osc52',
      config = get_setup('nvim-osc52')
    }
    -- use { 'telescope-command-palette.nvim' }
    -- use{ "iamcco/markdown-preview.nvim",
    --       opt = false,
    --       ft = { "markdown" },
    --       run = "cd app && npm install",
    --       config = get_setup('markdown-preview'),
    --       --run = function() vim.fn["mkdp#util#install"]() end,
    --    }
    use { 'DanilaMihailov/beacon.nvim' } -- cursor jump animation
    use { 'junegunn/gv.vim' } -- browser commit history
    use { 'windwp/nvim-autopairs',
      config = function() require("nvim-autopairs").setup({}) end --get_setup('nvim-autopairs')
    } -- quote close brackets, parentheses, curly braces, and so on.
    use { 'Yggdroot/indentLine',
      -- will no longer see quotation marks in their JSON files and markdown files.
      -- " See https://github.com/Yggdroot/indentLine/commit/7753505f3c500ec88d11e9373d05250f49c1d900
      -- fix using postupdate hook
      run = ':let g:vim_json_conceal=0 | let g:markdown_syntax_conceal=0'
    } -- adds vertical lines along indentations but screws up JSON by removing quotes
    use { 'majutsushi/tagbar' } --  view the structure of any classes or functions in file
    use { 'tpope/vim-fugitive' }
    use { 'mbbill/undotree' }

    -- BEGIN CODE COMPLETION
    use { 'hrsh7th/cmp-nvim-lua' } --, after = 'nvim-cmp'}
    use { "hrsh7th/cmp-buffer" } --, after="cmp-nvim-lua"} -- already had it
    use { 'L3MON4D3/LuaSnip' } -- snippet engine used by nvim-cmp. Snippets provide small previews. See capabilities snippetSupport in nvim-lspconfig, nvim-cmp, using LSP CompletionItemSetting.SnippetSupport Property
    --use { 'quangnguyen30192/cmp-nvim-ultisnips' }
    use { 'saadparwaiz1/cmp_luasnip' } -- integrates LuaSnip with nvpim-cmp
    --use { "hrsh7th/vim-vsnip" , after="cmp-buffer"}
    --use { "hrsh7th/cmp-vsnip" , after="vim-vsnip"}
    --use { "rafamadriz/friendly-snippets" , after="cmp-vsnip"}
    --use { "hrsh7th/cmp-path" , after="friendly-snippets"}
    use { 'neovim/nvim-lspconfig', config = get_setup('nvim-lspconfig'), requires = { "hrsh7th/cmp-nvim-lsp" } } --, after = { "hrsh7th/cmp-nvim-lsp" }}
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/nvim-cmp', config = get_setup('nvim-cmp'), requires = { 'onsails/lspkind.nvim' } } -- completion engine }
    use { 'ray-x/lsp_signature.nvim' } -- kicks in when lsp code completion not supported for buffer
    use { 'f-person/git-blame.nvim' }
    use { 'mfussenegger/nvim-dap' } -- Debug Protocol Adapter client implementation
    use { 'David-Kunz/jester',
      config = get_setup('jester')
    } --
    --use { 'terrortylor/nvim-comment',
    --      config=function() require('nvim_comment').setup()end
    --      }
    --use { -- generates comments based on function signatures
    --  "danymat/neogen",
    --  config = get_setup('neogen'),
    --  requires = "nvim-treesitter/nvim-treesitter",
    --  -- tag = "*"
    --}
    -- END CODE COMPLETION
    -- use { 's1n7ax/nvim-terminal',
    --   get_setup('nvim-terminal')
    -- }
    use { 'MunifTanjim/prettier.nvim',
      config = get_setup('prettier'),
      requires = { 'jose-elias-alvarez/null-ls.nvim' }
    }
    use { 'jose-elias-alvarez/null-ls.nvim',
      config = get_setup('null-ls')
    }
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
    }
    -- use { 'nvim-orgmode/orgmode' }
    use { "LukasPietzschmann/telescope-tabs",
      requires = "nvim-telescope/telescope.nvim",
      config = get_setup("telescope-tabs")
    }
  end,
})
