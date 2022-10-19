-- https://github.com/natecraddock/sessions.nvim
-- :h sessions-api
require("sessions").setup({
  events = {"VimLeavePre"},
  -- does not support dir, so following does not work
  --session_filepath = vim.fn.stdpath("data") .. "/sessions/",
  -- following is not ideal because it uses buffer path which might be nested within workspace
  session_filepath = vim.fn.expand('%:h') .. "/.session"
})

