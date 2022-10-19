-- https://luabyexample.org/docs/nvim-autocmd/
vim.api.nvim_create_augroup("buffer", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "buffer",
  pattern = "json|markdown",
  command = ":IndentLinesDisable"
})
vim.api.nvim_create_autocmd({ "BufWritePost", "ExitPre" }, {
  group = "buffer",
  pattern = "*",
  callback = function()
    local diagTable = require('config.functions').get_diagnostics({qflist=true})
    if not diagTable or not next(diagTable) then
      return 
    end
    functions.open_diagnostics()
  end
})
