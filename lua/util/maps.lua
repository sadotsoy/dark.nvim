local M = {}

---Function to creates a map
---@param mode string|string[]
---@param key string
---@param cmd string|function
---@param opts string|vim.keymap.set.Opts|nil
function M.keymap(mode, key, cmd, opts)
  local final_opts
  if type(opts) == "string" then
    final_opts = { desc = opts, silent = true }
  else
    final_opts = vim.tbl_extend("keep", opts or {}, { silent = true })
  end
  vim.keymap.set(mode, key, cmd, final_opts)
end

return M
