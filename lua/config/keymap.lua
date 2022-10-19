-- https://www.reddit.com/r/neovim/comments/u8jct5/a_stupid_but_effective_way_completely_native_to/
-- above regarding anonymous keymaps in nvim-tree when querying key maps

-- Doc: Following is native Lua approach to keymaps
-- --[[ keys.lua ]]
-- local map = vim.api.nvim_set_keymap
-- 
-- -- remap the key used to leave insert mode
-- map('i', 'jk', '', {})
-- Toggle more plugins
-- map('n', 'l', [[:IndentLinesToggle]], {})
-- map('n', 't', [[:TagbarToggle]], {})
-- map('n', 'ff', [[:Telescope find_files]], {})


-- Doc: Using nvim-mapper
-- Reload this file dynamically at runtime using:
-- <cmd>luafile %

-- A stock keymap
-- vim.api.nvim_set_keymap('n', '<leader>P', ":MarkdownPreview<CR>", {silent = true, noremap = true})

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
--local keymap = vim.api.nvim_set_keymap --builtin method

-- For associative arrays
function object_assign(t1, t2)
	for key, value in pairs(t2) do
	   t1[key] = value
	end 

	return t1
end

-- The same using nvim-mapper
Mapper = require("nvim-mapper")
-- M.map(mode, keys, cmd, options, category, unique_identifier, description)
-- The follow show up using <leader>MM
--
-- BEGIN TELESCOPE
Mapper.map('n', '<leader>pm', "<cmd>Telescope mapper<cr>", opts, "Telescope-Keys", "mapper", "Open custom keymaps.") -- OPEN VISUAL OF THIS FILE
Mapper.map('n', '<leader>pk', "<cmd>Telescope keymaps<cr>", opts, "Telescope-Keys", "keymaps", "Open keymap search for all key maps")
Mapper.map('n', '<leader>pp', "<cmd>lua require'telescope.builtin'.pickers()<cr>", {silent = true, noremap = true}, "Telescope", "pickers", "Picker of pickers")
Mapper.map('n', '<leader>pf', "<cmd>lua require'telescope.builtin'.find_files(object_assign({hidden=true}, require'telescope.themes'.get_dropdown({previewer=false})))<cr>", {silent = true, noremap = true}, "Telescope-Files", "findfiles", "Picker for find files")
Mapper.map('n', '<leader>pb', "<cmd>lua require'telescope.builtin'.buffers()<cr>", {silent = true, noremap = true}, "Telescope-vim", "vim-buffers", "Picker for buffers")
Mapper.map('n', '<leader>pt', "<cmd>lua require'telescope-tabs'.list_tabs()<cr>", {silent = true, noremap = true}, "Telescope-vim", "vim-tabs", "Picker for tabs")
Mapper.map('n', '<leader>pcs', "<cmd>lua require'telescope.builtin'.coloscheme()<cr>", {silent = true, noremap = true}, "Telescope-vim", "vim-colorscheme", "Picker for color schemes")
Mapper.map('n', '<leader>pmp', "<cmd>lua require'telescope.builtin'.man_pages()<cr>", {silent = true, noremap = true}, "Telescope-man", "man-pages", "pick-man-pages: Picker for man-pages")
Mapper.map('n', '<leader>plr', "<cmd>lua require'telescope.builtin'.lsp_references()<cr>", {silent = true, noremap = true}, "Telescope-Symbols", "lsp_references", "Picker for all references to symbol under cursor")
Mapper.map('n', '<leader>plsw', "<cmd>lua require'telescope.builtin'.lsp_workspace_symbols({query=''})<cr>", {silent = true, noremap = true}, "Telescope-Symbols", "lsp_workspace_symbols", "pick-symbols-workspace: Picker for all symbols in workspace")
Mapper.map('n', '<leader>plsb', "<cmd>lua require'telescope.builtin'.lsp_document_symbols()<cr>", {silent = true, noremap = true}, "Telescope-Symbols", "lsp_document_symbols", "pick-symbols-buffer: Picker for symbols in current buffer")
Mapper.map('n', '<leader>plic', "<cmd>lua require'telescope.builtin'.lsp_incoming_calls()<cr>", {silent = true, noremap = true}, "Telescope-LSP", "lsp_incoming_calls", "pick-incoming-calls: Picker for incoming calls in LSP for symbol under cursor")
Mapper.map('n', '<leader>plic', "<cmd>lua require'telescope.builtin'.lsp_outgoing_calls()<cr>", {silent = true, noremap = true}, "Telescope-LSP", "lsp_outgoing_calls", "pick-outgoing-calls: Picker for outgoing calls in LSP for symbol under cursor")
Mapper.map('n', '<leader>pld', "<cmd>lua require'telescope.builtin'.lsp_definitions()<cr>", {silent = true, noremap = true}, "Telescope-LSP", "lsp_definitions", "pick-definitions: Picker for defintions in LSP for symbol under cursor")
Mapper.map('n', '<leader>pltd', "<cmd>lua require'telescope.builtin'.lsp_type_definitions()<cr>", {silent = true, noremap = true}, "Telescope-LSP", "lsp_type_definitions", "pick-type-definitions: Picker for type defintions in LSP for symbol under cursor")
Mapper.map('n', '<leader>pgc', "<cmd>lua require'telescope.builtin'.git_commits()<cr>", {silent = true, noremap = true}, "Telescope-Git", "git_commits", "Picker for git commits")
Mapper.map('n', '<leader>pgb', "<cmd>lua require'telescope.builtin'.git_branches()<cr>", {silent = true, noremap = true}, "Telescope-Git", "git_branches", "Picker for git branches")
Mapper.map('n', '<leader>pgs', "<cmd>lua require'telescope.builtin'.git_status()<cr>", {silent = true, noremap = true}, "Telescope-Git", "git_status", "Picker for git branches")
Mapper.map('n', '<leader>pw', "<cmd>Telescope workspaces<cr>", {silent = true, noremap = true}, "Telescope-Workspace", "workspaces", "Find files in Telescope")
Mapper.map('n', '<leader>pg', "<cmd>Telescope live_grep<cr>", {silent=true, noremap=true}, "Telescope", "live_grep", "Open live grepper.")
Mapper.map('n', '<leader>ph', "<cmd>Telescope help_tags<cr>", {silent=true, noremap=true}, "Telescope", "help_tags", "Open help tag picker.")
Mapper.map('n', '<leader>g', "<cmd>lua require'telescope.builtin'.grep_string({use_regex=true})<cr>", {silent=true, noremap=true}, "Telescope", "grep_string", "Search for string under cursor in current working directory.")
Mapper.map('n', '<leader>pla', "lua vim.lsp.buf.code_action() <CR>", opts, "Telescope", "lsp_code_actions", "pick-lsp-actions List LSP-detected code actions.")


-- END TELESCOPE

-- global maps
Mapper.map('n', '<leader>P', ":MarkdownPreview<CR>", {silent = true, noremap = true}, "Markdown", "md_preview", "Display Markdown preview in Qutebrowser")
Mapper.map('n', '<leader>tt', ":NvimTreeToggle<CR>", {silent = true, noremap = true}, "Files", "nvimtree-toggle", "Toggle NvimTree")
Mapper.map('n', '<leader>tc', ":NvimTreeOpen ~/.config/nvim/<CR>", {silent = true, noremap = true}, "Files", "nvimtree-open-config", "Toggle NvimTree")
Mapper.map('n', '<leader>tw', ":NvimTreeOpen ~/.config/nvim/<CR>", {silent = true, noremap = true}, "Files", "nvimtree-open-workspace", "Toggle NvimTree")
Mapper.map('n', '-', ":NvimTreeOpen<CR>", {silent=true,noremap=true}, "Files", "nvimtree-open", "Toggle NvimTree")
--Mapper.map('v', '<leader>gY', '<cmd>lua require"gitlinker".get_repo_url()<cr>', {silent = true}, "Gitlinker", "getrepourl", "Get Repo URL")
--Mapper.map('v', '<leader>gB', '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>', {silent = true}, "Gitlinker", "gitopeninbrowser", "Open Git URL in Browser")
Mapper.map('n', '<leader>p', "<cmd>echo expand('%:p')<CR>", {silent=true, noremap=true}, "Paths", "bufferpath", "Show absolute path associated with current buffer.")

-- BEGIN COLOR THEME
Mapper.map('n', '<leader>nm', '<cmd>lua functions.toggleColorScheme()<cr>', {silent=true, noremap=true}, "Colorscheme", "toggle_colors", "Toggle light and dark color schemes")
-- END COLOR THEME



-- buffer-specific maps
-- Mapper.map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true}, "LSP", "lsp_definitions", "Go to definition")
-- Mapper.map_buf(bufnr, "n", "<leader>wl", {silent=true, noremap=true}, "", "", "Wrap ")


-- " Press i to enter insert mode, and ii to exit insert mode.
-- :inoremap ii <Esc>
-- :inoremap jk <Esc>
-- :inoremap kj <Esc>
-- :vnoremap jk <Esc>
-- :vnoremap kj <Esc>

Mapper.map("i", "ii", "<ESC><ESC>", {silent=true,noremap=true}, "General", "enterexitinsert", "i to enter insert mode, ii to exit insert mode")




Mapper.map("n", "<leader>yf", "<cmd>let @+=expand('%:p')<CR>", {silent=true,noremap=true}, "Copy", "filepathtoclipboard", "Copies buffer filepath to clipboard")
Mapper.map("n", "<leader>yd", "<cmd>let @+=expand('%:p:h')<CR>",{silent=true,noremap=true}, "Copy", "pwdtoclipboard", "Copies pwd of buffer to clipboard")
-- " copies filepath to clipboard by pressing yf
-- :nnoremap <silent> yf :let @+=expand('%:p')<CR>
-- " copies pwd to clipboard: command yd
-- :nnoremap <silent> yd :let @+=expand('%:p:h')<CR>

Mapper.map('n', '<leader>l', ':IndentLinesToggle<CR>', {silent=true,noremap=true}, "Display", "toggleshowindent", "Toggle IndentLinesToggle")
-- Toggle more plugins
-- map('n', 'l', [[:IndentLinesToggle]], {})
-- map('n', 't', [[:TagbarToggle]], {})
-- map('n', 'ff', [[:Telescope find_files]], {})
  Mapper.map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts, 'LSP', 'lsp.buf.declaration', 'Jump to declaration')
  Mapper.map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts, 'LSP', 'lsp.buf.definition', 'Jump to definition')
  Mapper.map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts, 'LSP', 'lsp.buf.hover', 'Hover')
  Mapper.map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts, 'LSP', 'lsp.buf.implementation', 'Show implementation')
  Mapper.map('n', '<leader>i', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts, 'LSP', 'lsp.bug.incoming_calls', 'Show callers (inbound)') -- "quickfix" list of call sites
  Mapper.map('n', '<leader>o', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts, 'LSP', 'lsp.buf.outgoing_calls', 'Show calls (outbound)') -- "quickfix" list of called
  Mapper.map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts, 'LSP', 'lsb.buf.signature_help', 'Show signature')
  Mapper.map('n', '<leader>hr', '<cmd>lua vim.lsp.util.buf_highlight_references<CR>', opts, 'LSP', 'lsp.util.buf_highlight_references', 'Highlight references')
  Mapper.map('n', '<leader>hc', '<cmd>lua vim.lsp.util.buf_clear_references<CR>', opts, 'LSP', 'lsp.util.buf_clear_references', 'Clear highlighted references')
  Mapper.map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts, 'LSP', 'lsp.buf.references', 'Show all references')
  Mapper.map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts, 'LSP', 'lsp.buf.add_workspace_folder', 'Add Workspace')
  Mapper.map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts, 'LSP', 'lsp.buf.remove_workspace_folder', 'Remove Workspace')
  Mapper.map('n', '<leader>ws', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts, 'LSP', 'lsp.buf.workspace_symbol', 'Show all symbols in Workspace') -- list all symbols in workspace
  Mapper.map('n', '<leader>wl',
    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts, 'LSP', 'lsp.buf.list_workspace_folders', 'Show Workspaces')
  Mapper.map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts, 'LSP', 'lsp.buf.type_definition', 'Show type definition')
  Mapper.map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts, 'LSP', 'lsp.buf.rename', 'Rename symbols in workspace') -- rename all refs to symbol
  Mapper.map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts, 'LSP', 'lsp.buf.code_action', 'TODO: What do I do?')
  Mapper.map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts, 'LSP', 'lsp.diagnostic.show_line_diagnostics', 'Diagnose line')
  Mapper.map('n', '<leader>dH', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts, 'LSP', 'lsp.diagnostic.goto_prev', 'Go to previous diagnosis')
  Mapper.map('n', '<leader>dh', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts, 'LSP', 'lsp.diagnostic.goto_next', 'Go to next diagnosis')
  Mapper.map('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts, 'LSP', 'lsp.diagnostic.set_loclist', 'TODO what do I do?')
  Mapper.map('n', '<leader>f', '<cmd>lua vim.lsp.buf.format { async = true }; print("Formatted file according to attached language server client asynchronously...")<CR>', opts, 'LSP', 'lsp.buf.format', 'Auto format code in buffer according to attached language server.')

-- BEGIN CMP Autocompletion
--    Mapper.map('n', ['<Tab>'] = function(fallback)
--    Mapper.map('n',   if cmp.visible() then
--    Mapper.map('n',     cmp.select_next_item()
--    Mapper.map('n',   else
--    Mapper.map('n',     fallback()
--    Mapper.map('n',   end
--    Mapper.map('n', end,
--    Mapper.map('n', ['<C-n>'] = cmp.mapping.select_next_item(select_opts), --cmp.mapping.select_prev_item(),
--    Mapper.map('n', ['<C-p>'] = cmp.mapping.select_prev_item(select_opts), --cmp.mapping.select_next_item(),
--    Mapper.map('n', ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
--    Mapper.map('n', ['<Down>'] = cmp.mapping.select_next_item(select_opts),
--    Mapper.map('n', ['<C-Space>'] = cmp.mapping.complete(select_opts),
--    Mapper.map('n', ["<C-d>"] = cmp.mapping.scroll_docs(-4),
--    Mapper.map('n', ["<C-f>"] = cmp.mapping.scroll_docs(4),
--    Mapper.map('n', ["<C-e>"] = cmp.mapping.close(),
--    Mapper.map('n', ["<C-y>"] = cmp.mapping.confirm({
--    Mapper.map('n',   behavior = cmp.ConfirmBehavior.Insert,
--    Mapper.map('n',   select = true,
--    Mapper.map('n', }),
--  },
-- END CMP Autocompletion
