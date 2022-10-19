-- Assign empty table to conventionally named M module scoped local
local M = {}

-- Define functions in M
function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Define f-string for string interpolation (not built into Lua)
--
-- Also available here: luarocks install f-strings 
--
-- Usage:
--   local c = "Hello"
--   local d = "World"
--   print(f"Also works with locals: {c} {d}")
--
--   do
--      local h = "Hello"
--      do
--         local w = "World"
--         print(f"Of any scope level: {h} {w}")
--      end
--   end
function M.f(str)
   local outer_env = _ENV
   return (str:gsub("%b{}", function(block)
      local code = block:match("{(.*)}")
      local exp_env = {}
      setmetatable(exp_env, { __index = function(_, k)
         local stack_level = 5
         while debug.getinfo(stack_level, "") ~= nil do
            local i = 1
            repeat local name, value = debug.getlocal(stack_level, i)
               if name == k then
                  return value
               end
               i = i + 1
            until name == nil
            stack_level = stack_level + 1
         end
         return rawget(outer_env, k)
      end })
      local fn, err = load("return "..code, "expression `"..code.."`", "t", exp_env)
      if fn then
         return tostring(fn())
      else
         error(err, 0)
      end
   end))
end


-- Since M is in local scope, return it to be used(required) elsewhere
return M


-- usage in another module:
-- local map = require('utils').map
