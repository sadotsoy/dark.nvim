---
-- Editor utils
---

local patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" }

local M = {}
function M.get_root_dir()
  local rootdir = vim.fs.dirname(vim.fs.find(patterns, { upward = true })[1])

  return rootdir or vim.uv.cwd()
end

return M
