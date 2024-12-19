--- 
--- Windows utils
---

local M = {}

--- Function to check if the os is windows
---@return boolean
function M.is_win()
  return vim.uv.os_uname().sysname:find("Windows") ~= nil
end

return M
