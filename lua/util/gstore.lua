local M = {}

--- Function to print and save to './debug.log' the _G store
function M.get_store()
	vim.print("_G", _G)
	dd(_G)
end

return M
