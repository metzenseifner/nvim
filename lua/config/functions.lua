-- Abreviations for lua vim module
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

M = {}

M.getWords = function()
  return tostring(fn.wordcount().words)
end

M.colorschemestate = "light"

M.toggleColorScheme = function()

  local lightColorscheme = "PaperColor"
  local darkColorscheme = "duskfox" -- "ayu-dark"
  local function setColorschemeLight()
    local colorscheme = lightColorscheme
    cmd("colorscheme " .. colorscheme)
    opt.background = "light"
  end

  local function setColorschemeDark()
    local colorscheme = darkColorscheme
    cmd("colorscheme " .. colorscheme)
    vim.o.background = "dark"
  end

  if (M.colorschemestate == "light") then
    setColorschemeDark()
    M.colorschemestate = "dark"
  else
    setColorschemeLight()
    M.colorschemestate = "light"
  end
  print("Colorscheme set to " ..
    vim.g.colors_name .. " with background " .. vim.o.background .. " with state " .. M.colorschemestate)
end

M.printLSPCapabilities = function()
  print(vim.inspect(vim.lsp.buf_get_clients()[1].resolved_capabilities))
end

M.get_visual_selection = function()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  return table.concat(lines, '\n')
end

M.textToClipboard = function(text)
  require('osc52').copy(text);
end

M.is_empty_table = function(t)
  if t == nil then
    return true
  end
  return next(t) == nil
end

M.get_diagnostics = function(config)
  --if M.is_empty_table(config) then
  --  config.as_qflist = true
  --end
  --if config.as_qflist == true then
    return vim.diagnostic.toqflist(vim.diagnostic.get())
  --end
end

M.open_diagnostics = function()
  local content = vim.diagnostic.get()
  local convert_diag_table_to_quickfix_list = vim.diagnostic.toqflist
  local set_quickfix_list_to = vim.diagnostic.setqflist
  --vim.diagnostic.setqflist(vim.diagnostic.toqflist(vim.diagnostic.get()))
  set_quickfix_list_to(convert_diag_table_to_quickfix_list(content))
end

M.print_package_path = function()
  print(table.concat(split(package.path, ";"), "\n"))
end

return M
