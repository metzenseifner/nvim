-- LSP facilitates features like go-to-definition, find-references, hover,
-- completion, rename, format, refactor, etc., using semantic whole-project
-- analysis (unlike |ctags|).
-- https://microsoft.github.io/language-server-protocol/
-- https://microsoft.github.io/language-server-protocol/implementors/servers/
--
-- :h lsp
-- :h lsp-quickstart
-- :h lsp-handlers
-- :h mason-lspconfig -- for easy auto installation of lsp servers
--require("nvim-lsp-installer").setup {}
-- What does setup() do?
-- Pass configuration options that are cached for a given language server (overriding the defaults)
-- Watch for buffers of a filetype that match a configured language server, launch, and attach a language server to said buffer (using a FileType autocommand)
-- setup should only be invoked once per language server. It takes the same {config} table as :help vim.lsp.start_client(), as it's main role is to cache and pass this table to start_client().
-- https://github.com/neovim/nvim-lspconfig/wiki/Understanding-setup-%7B%7D
--
-- Auto-called for you: vim.lsp.start_client(config_table_passed_to_setup)

-- LOGGING Logging Level
vim.lsp.set_log_level("info")
require('vim.lsp.log').set_format_func(vim.inspect)
--vim.lsp.log.set_format_func(vim.inspect)

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "tsserver", "sumneko_lua", "rust_analyzer", "jsonls", "marksman", "eslint" },
  automatic_installation = true
})

-- nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local my_on_attach = function(client, bufnr)
  print("LSP Started. Use LspInfo or LspLog for details at path: " .. vim.lsp.get_log_path())
  --if client.name == "tsserver" then
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Sets up all of the keybindings that we will need for navigating the code and using features like getting documentation tooltips or quick actions. We'll go through them in more detail in a moment.
  --local opts = { noremap = true, silent = true }
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>i', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts) -- "quickfix" list of call sites
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>o', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts) -- "quickfix" list of called
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hs', '<cmd>lua vim.lsp.util.buf_highlight_references<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hc', '<cmd>lua vim.lsp.util.buf_clear_references<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ws', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts) -- list all symbols in workspace
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl',
  --  '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) -- rename all refs to symbol
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dH', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dh', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f',
  --  '<cmd>lua vim.lsp.buf.format { async = true }; print("Formatted file according to attached language server client asynchronously...")<CR>'
  --  , opts) -- format code according to lsp
  --    [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  --vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
  -- end
end

local lsp_flags = {
  debounce_text_changes = 150,
}

-- commented this out
-- local capabilities = require('cmp-nvim-lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Set up lspconfig.
local my_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- set default capabilities globally
-- require('lspconfig').util.default_config.capabilities = vim.tbl_deep_extend(
--   -- vim.tbl_deep_extend to merge the defaults lspconfig provides with the capabilities nvim-cmp adds
--   'force',
--   require('lspconfig').util.default_config.capabilities,
--   require('cmp_nvim_lsp').default_capabilities()
-- )

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
--local servers = { 'jsonls', 'tsserver' }
--for _, lsp in pairs(servers) do
--  print("Loading " .. lsp)
--  require('lspconfig')[lsp].setup {
--    on_attach = on_attach,
--    capabilities = capabilities,
--    flags = lsp_flags
--  }
--end



-- To appropriately highlight codefences returned from denols, you will need to augment vim.g.markdown_fenced languages
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

require('lspconfig').marksman.setup({
  on_attach = my_on_attach,
  capabilities = my_capabilities,
  filetypes = { 'markdown' },
})


--- Neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
--- the resolved capabilities of the eslint server ourselves!
---
---@param  allow_formatting boolean whether to enable formating
---
local function toggle_formatting(allow_formatting)
  return function(client)
    default_on_attach(client)
    client.resolved_capabilities.document_formatting = allow_formatting
    client.resolved_capabilities.document_range_formatting = allow_formatting
  end
end

require('lspconfig').eslint.setup({
  on_attach = function(client, bufnr)
    my_on_attach(client, bufnr)
    toggle_formatting(true)
  end,
  -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
  -- the resolved capabilities of the eslint server ourselves!
  capabilities = my_capabilities,
  --root_dir = 
  settings = {
    autoFixOnSave = false,
    format = true,
    codeActionOnSave = {
      enable = false,
      mode = 'all'
    }
  },
})
-- npm install -g diagnostic-langaugeserver
-- npm install -g jsonls
-- if server == "jsonls" then
-- npm install -g vscode-json-languageserver (or LspInstall)
--
--require'lspconfig'.jsonls.setup{
--  on_attach = my_on_attach,
--  cmd = { 'vscode-json-languageserver', '--stdio' },
--}
require('lspconfig').jsonls.setup {
  on_attach = my_on_attach,
  filetypes = { 'json' },
  capabilities = my_capabilities,
  settings = {
    json = {
      trace = {
        server = 'on'
      },
      validate = { enable = true },
      cmd = { "vscode-json-languageserver", "--stdio" },
      schemas = {
        require('schemastore').json.schemas(),
        {
          -- git clone --depth 1 ssh://git@bitbucket.lab.dynatrace.org/rx/configuration-core.git ~/devel/dynatrace_bitbucket/
          description = 'Dynatrace Settings 2.0 Schema',
          fileMatch = { '/settings-2.0/*.schema.json' }, -- array of filepath names separated by /, * glob supported
          url = 'file://' ..
              vim.fn.expand('~') ..
              '/devel/dynatrace_bitbucket/configuration-core/core-schema/src/main/resources/1/schema_strict_static.json'
        },
        {
          description = 'TypeScript compiler configuration file',
          fileMatch = { 'tsconfig.json', 'tsconfig.*.json' },
          url = 'http://json.schemastore.org/tsconfig'
        },
        {
          description = 'Lerna config',
          fileMatch = { 'lerna.json' },
          url = 'http://json.schemastore.org/lerna'
        },
        {
          description = 'Babel configuration',
          fileMatch = { '.babelrc.json', '.babelrc', 'babel.config.json' },
          url = 'http://json.schemastore.org/lerna'
        },
        {
          description = 'ESLint config',
          fileMatch = { '.eslintrc.json', '.eslintrc' },
          url = 'http://json.schemastore.org/eslintrc'
        },
        {
          description = 'Bucklescript config',
          fileMatch = { 'bsconfig.json' },
          url = 'https://bucklescript.github.io/bucklescript/docson/build-schema.json'
        },
        {
          description = 'Prettier config',
          fileMatch = { '.prettierrc', '.prettierrc.json', 'prettier.config.json' },
          url = 'http://json.schemastore.org/prettierrc'
        },
        {
          description = 'Vercel Now config',
          fileMatch = { 'now.json' },
          url = 'http://json.schemastore.org/now'
        },
        {
          description = 'Stylelint config',
          fileMatch = { '.stylelintrc', '.stylelintrc.json', 'stylelint.config.json' },
          url = 'http://json.schemastore.org/stylelintrc'
        }
      }
    }
  }
}

-- tsserver vs denols
require('lspconfig').tsserver.setup {
  on_attach = my_on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  --
  capabilities = my_capabilities,
  --cmd = cmd,
  --on_new_config = function(new_config,new_root_dir)
  --  new_config.cmd = cmd
  --end,
  root_dir = require('lspconfig').util.root_pattern("package.json", "tsconfig.json", "jsonconfig.json", ".git"),
  flags = lsp_flags,
}

require('lspconfig').sumneko_lua.setup {
  on_attach = my_on_attach,
  capabilities = my_capabilities,
  --cmd = { vim.env.HOME .. '/.local/src/lua-language-server' }
}

require('lspconfig').pyright.setup {
  on_attach = my_on_attach,
  capabilities = my_capabilities,
  flags = lsp_flags,
}


-- groovy-language-server
-- Status: Untested
-- Site: https://github.com/prominic/groovy-language-server
-- Installation:
--    mkdir ~/lsp
--    cd ~/lsp
--    git clone https://github.com/prominic/groovy-language-server.git
--    cd ~/lsp/groovy-language-server
--    ./gradlew build
-- lspconfig.groovyls = add_lsp {
--   name = "groovy-language-server",
--   language = "groovy",
--   file_patterns = { "%.groovy$", "%.gvy$", "%.gy$", "%.gsh$" },
--   -- command = { "java", "-jar", "/path/to/groovy-language-server-all.jar" },
--   command = { "groovy-language-server" },
--   verbose = false
-- }



--" local lsp_defaults = {
--"   flags = {
--"     debounce_text_changes = 150,
--"   },
--"   capabilities = require('cmp-vim-lsp').update_capabilities(
--"      vim.lsp.protocol.make_client_capabilities()
--"   ),
--"   on_attach = function(client, bufnr)
--"     vim.api.nvim_exe_autocmds('User', {pattern = 'LspAttached'})
--"   end
--" }

-- Make runtime files discoverable to the server.
--local runtime_path = vim.split(package.path, ';')
--table.insert(runtime_path, 'lua/?.lua')
--table.insert(runtime_path, 'lua/?/init.lua')


-- commented out because it should be in nvim-cmp
-- Set completeopt to have a better completion experience.
-- vim.o.completeopt = 'menuone,noselect'  -- see completion.completeopt


-- TECHNIQUE TO ITERATE ALL SERVERS
--
-- local servers = { 'tsserver','jsonls' }
-- for _, server in ipairs(servers) do
--   local opts = {
-- 		on_attach = on_attach,
-- 		capabilities = capabilities,
-- 	}
--
--   nvim_lsp[server].setup(opts)
-- end
