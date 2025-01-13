local M = {}

--- Function to set a key mapping for the current buffer
---@param keys string # The sequence to bind
---@param func function # The function to call when the key is pressed
---@param desc string|nil # A description for the key binding
local nmap = function(keys, func, desc)
	if desc then
		desc = "LSP: " .. desc
	end

	---@diagnostic disable-next-line: missing-fields
	vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
end

---Function to setup key mappings and custome commands when a new LSP client attaches
---@param _ any
---@bufnr number
function M.on_attach(_, bufnr)
	--function to reuse diagnostic_goto
	---@param next boolean to control if is next or prev
	---@param severity? string|integer|nil to control the severy level
	---@return function
	local diagnostic_goto = function(next, severity)
		local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
		severity = severity and vim.diagnostic.severity[severity] or nil
		return function()
			go({ severity = severity })
		end
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "re name buff value")
	nmap("<leader>ca", vim.lsp.buf.code_action, "code action")
	nmap("gd", vim.lsp.buf.definition, "goto definition")
	nmap("gI", vim.lsp.buf.implementation, "goto Implementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type Definition")
	--
	-- diagnostics
	nmap("<leader>cl", function()
		vim.diagnostic.open_float({ border = "rounded" })
	end, "code line diagnostic")
	--
	-- diagnostics goto_mapping
	nmap("]d", diagnostic_goto(true), "Next Diagnostic")
	nmap("[d", diagnostic_goto(false), "Prev Diagnostic")
	nmap("]e", diagnostic_goto(true, "ERROR"), "Next Error")
	nmap("[e", diagnostic_goto(false, "ERROR"), "Prev Error")
	nmap("]w", diagnostic_goto(true, "WARN"), "Next Warning")
	nmap("[w", diagnostic_goto(false, "WARN"), "Prev Warning")
	--
	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "goto Declaration")
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "workspace add Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "workspace remove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "workspace list Folders")
end

return M
