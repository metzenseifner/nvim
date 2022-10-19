-- require('nvim-treesitter.configs').setup({
--   highlight = {
--       enable = true,
--       -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--       -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--       -- Using this option may slow down your editor, and you may see some duplicate highlights.
--       -- Instead of true it can also be a list of languages
--       additional_vim_regex_highlighting = false,
--     },
--   incremental_selection = {
--       enable = true,
--       keymaps = {
--         init_selection = "gnn",
--         node_incremental = "grn",
--         scope_incremental = "grc",
--         node_decremental = "grm",
--       },
--     },
--   indent = {
--       enable = true
--   }
-- })

local status, treesitterconfigs = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

treesitterconfigs.setup({
  ensure_installed = {
    "typescript",
    "javascript",
    "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "css",
    "html",
    "lua"
  },
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
    disable = {},
  },
  indent = {
    enable = false, -- on EnterInsert move cursor to location based on syntax tree
    disable = {}, -- any indentation grammars to ignore
  },
  autotag = {
    enable = true,
  },
  --   incremental_selection = {
  --       enable = true,
  --       keymaps = {
  --         init_selection = "gnn",
  --         node_incremental = "grn",
  --         scope_incremental = "grc",
  --         node_decremental = "grm",
  --       },
  --     },
  context_commentstring = { -- nvim-JoosepAlviste/nvim-ts-context-commentstring
    enable = true, -- gcc for line comment,
    config = {
      -- language refers to the treesitter language, not the filetype or the file extension.
      javascript = {
        __default = '// %s',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
        jsx_attribute = '// %s',
        comment = '// %s'
      },
      typescript = { __default = '// %s', __multiline = '/* %s */' }
    }
  },
  tree_docs = { enable = true }
})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript", "tsx", "ts" }
