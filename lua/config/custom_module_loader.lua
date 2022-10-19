function requirePath(path) 
  local files = io.popen('find ./lua/' .. path .. ' -type f')

  for file in files:lines() do
    local req_file = file:gmatch('(' .. path .. '%/.+)%.lua$'){0}:gsub('/', '.')
    status_ok, _ = pcall(require, req_file)

    if status_ok then
      vim.notify('Loaded ' .. req_file)
    else
      vim.notify('Failed loading ' .. req_file, vim.log.levels.ERROR)
    end
  end
end
--local files = io.popen('find "$HOME"/.config/nvim/lua/custom_modules' .. path .. ' -type f', 'r')

--print(files)
