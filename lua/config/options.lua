local vim = vim
-- :help options
-- query option:
-- To replicate the behavior of :set+=, use:
-- vim.opt.wildignore:append { "*.pyc", "node_modules" }
-- To replicate the behavior of :set^=, use:
-- vim.opt.wildignore:prepend { "new_first_value" }
-- To replicate the behavior of :set-=, use:
-- vim.opt.wildignore:remove { "node_modules" }
--
-- Example: set listchars=space:_,tab:>~
-- vim.o.listchars = 'space:_,tab:>~'
-- ::equivalent::
-- vim.opt.listchars = { space = '_', tab = '>~' }
--
-- " move between panes to left/bottom/top/right
-- " I use tmux bindings for this: tmux checks whether pane has nvim running
--
--
-- " In Lua:
-- " vim.api.nvim_set_var to set internal variables.
-- " vim.api.nvim_set_option to set options.
-- " vim.api.nvim_set_keymap to set key mappings.
-- " -- LEADER
-- " -- These keybindings need to be defined before the first /
-- " -- is called; otherwise, it will default to "\"
-- " vim.g.mapleader = ","
-- " vim.g.localleader = "\\"
vim.opt.backup = false
vim.opt.smartindent = true

vim.opt.conceallevel = 0 -- show `` in markdown files

vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true -- auto indent line same amount as previous line

vim.opt.number     = true
vim.opt.background = "light"
-- vim.opt.completeopt = ""
vim.opt.wildmode   = { "longest,list" } -- get bash-like tab completions
vim.opt.hlsearch   = true
vim.opt.showmatch  = true
vim.opt.ignorecase = false
vim.opt.mouse      = 'a'
vim.opt.incsearch  = true
vim.opt.number     = true
vim.opt.cc         = '80' -- set an 80 column border for good coding style
vim.opt.syntax     = 'off' -- syntax highlighting handled by treesitter?
vim.opt.ttyfast    = true -- faster scrolling in vim
vim.opt.cursorline = true -- highlight line containing cursor
vim.opt.spell      = false -- toggle spell check
vim.opt.swapfile   = false -- whether to auto-create swap files in the event of abrupt closure
--vim.opt.backupdir=vim.fn.stdpath("state") .. "/.local/var/cache/nvim/" --dir to store backup files
-- also see vim.fn.stdpath("run") -- undecided what is better
vim.opt.clipboard  = 'unnamedplus' -- uses system clipboard
-- vim.opt.fileencoding -- the current file's encoding set when opening

vim.api.nvim_command('filetype plugin indent on') -- or vim.cmd('filetype plugin indent on')


function printFormatOptions()
  -- formatoptions are the secret to Javadoc style comments
  -- print value of vim.opt.formatoptions
  -- Note that when 'paste' is on, Vim does no formatting at all.
  -- used in conjunction with
  --   <cmd>autocmd for file type contexts
  --   vim.opt.textwidth for auto wrapping (default 0, which means 79)
  -- For values that are lists of flags, a set will be returned with the
  -- flags as keys and true as entries.
  --
  -- Equivalent expressions:
  -- 1. vim.opt.formatoptions:append('j')
  -- 2. vim.opt.formatoptions = vim.opt.formatoptions + 'j'
  local letterToSemantics = {
    t = 'Auto-wrap using textwidth',
    c = 'Auto-wrap comments using textwidth, inserting comment leader (prefix)',
    r = 'Automatically insert the current comment leader after pressing <Enter> in Insert mode',
    o = 'Automatically insert the current comment leader after hitting "o" or "O" in Normal mode.  In case comment is unwanted in a specific place use CTRL-U to quickly delete it.',
    forwardslash = '',
    q = '',
    w = '',
    a = '',
    n = '',
    TWO = '',
    v = '',
    b = '',
    l = '',
    m = '',
    M = '',
    B = '',
    ONE = '',
    CLOSEBACKET = '',
    j = '',
    p = '',
  }
  print("Autoformat options: ")
  vim.pretty_print(vim.opt.formatoptions:get())
end

local all_severities = {
  vim.diagnostic.severity.ERROR,
  vim.diagnostic.severity.WARN,
  vim.diagnostic.severity.INFO,
  vim.diagnostic.severity.HINT,

  -- compare to vim.log.levels
    -- vim.log.levels.INFO
    -- vim.log.levels.WARN
    -- etc.
}

-- :h Diagnostic framework (generated from source using tree-sitter-vimdoc parser)
vim.diagnostic.config({ -- Global Nvim Diagnostic Framework config
  severity_sort = true,
  virtual_text = {
    severity = all_severities,
    source = true,
    prefix = "",
    spacing = 0,
    format =
    function(diagnostic)
      if diagnostic.severity == vim.diagnostic.severity.ERROR then
        return string.format("%s", diagnostic.message)
      end
      return diagnostic.message
    end
  }, -- non-float text shown inline with actual text
  underline = true, -- underline code affected by diagnostic message
  wrap = true,
  source = true,
  signs = { -- Indicator char prefix by line numbers to indicate diagnostics available
    severity = all_severities,
  },
  ["my/notify"] = { -- configure handler
    log_level = vim.log.levels.INFO,
  },
  float = { -- config open_float
    severity = all_severities,
    --header = "Diagnostics:",
    source = "false",
    -- format = function :: diagnostic -> string
    prefix = function(diag, idx, total) --function(diagnostic, i, total)|string|table
      return string.format("%s. %5s %11s: ", idx, vim.diagnostic.severity[diag.severity], diag.source)
    end
  }
})

-- Configure signs
-- sign define DiagnosticSignError text=E texthl=DiagnosticSignError linehl= numhl=
-- sign define DiagnosticSignWarn text=W texthl=DiagnosticSignWarn linehl= numhl=
-- sign define DiagnosticSignInfo text=I texthl=DiagnosticSignInfo linehl= numhl=
-- sign define DiagnosticSignHint text=H texthl=DiagnosticSignHint linehl= numhl=
--vim.fn.sign_define("LspDiagnosticsSignError", { text = "", numhl = "LspDiagnosticsDefaultError" })
--vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", numhl = "LspDiagnosticsDefaultWarning" })
--vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "", numhl = "LspDiagnosticsDefaultInformation" })
--vim.fn.sign_define("LspDiagnosticsSignHint", { text = "", numhl = "LspDiagnosticsDefaultHint" })


-- Nvim provides these handlers by default: "virtual_text", "signs", and
-- "underline"
-- It's good practice to namespace custom handlers to avoid collisions
vim.diagnostic.handlers["my/notify"] = {
  show = function(namespace, bufnr, diagnostics, opts)
    -- In our example, the opts table has a "log_level" option
    local level = opts["my/notify"].log_level

    local name = vim.diagnostic.get_namespace(namespace).name
    local msg = string.format("%d diagnostics in buffer %d from %s",
      #diagnostics,
      bufnr,
      name)
    vim.notify(msg, level)
  end,
}

-- compare vim.diagnostic.show() to vim.diagnostic.open_float()

-- Show diagnostics automatically in floating window
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]] -- This makes dianostics floating window auto appear

-- Delay show vim.diagnostic.open_float(...) diagnostics
vim.o.updatetime = 1000 --250
