-- Neovim doesn't provide a way for non-LSP sources to hook into its LSP
-- client. null-ls is an attempt to bridge that gap
-- null-ls is also an attempt to reduce the boilerplate required to set up
-- general-purpose language servers and improve performance by removing the
-- need for external processes.
local null_ls = require("null-ls")

null_ls.setup({
  ["null-ls"] = {
    condition = function()
      return prettier.config_exists({
        -- if `false`, skips checking `package.json` for `"prettier"` key
        check_package_json = true,
      })
    end,
    runtime_condition = function(params)
      -- return false to skip running prettier
      return true
    end,
    timeout = 5000,
  },
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>") -- this line causes choice when formatting because the keystroke is assigned multiple times

      --   -- format on save
      --   vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
    end

    -- if client.server_capabilities.documentRangeFormattingProvider then
    --   vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
    -- end
  end,
})
