local M = {}

local border = {
  { "🭽", "FloatBorder" },
  { "▔", "FloatBorder" },
  { "🭾", "FloatBorder" },
  { "▕", "FloatBorder" },
  { "🭿", "FloatBorder" },
  { "▁", "FloatBorder" },
  { "🭼", "FloatBorder" },
  { "▏", "FloatBorder" },
}

--- Function to set a key mapping for the current buffer
---@param keys string # The sequence to bind
---@param func function # The function to call when the key is pressed
---@param opts {bufnr: number, desc: string} # A table containing desc and bufnr
local nmap = function(keys, func, opts)
  if opts.desc then
    opts.desc = "LSP: " .. opts.desc
  end

  ---@diagnostic disable-next-line: missing-fields
  vim.keymap.set("n", keys, func, { buffer = opts.bufnr, desc = opts.desc })
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

  nmap("<leader>rn", vim.lsp.buf.rename, { bufnr = bufnr, desc = "re name buff value" })
  nmap("<leader>ca", vim.lsp.buf.code_action, { bufnr = bufnr, desc = "code action" })
  nmap("gd", vim.lsp.buf.definition, { bufnr = bufnr, desc = "goto definition" })
  nmap("gI", vim.lsp.buf.implementation, { bufnr = bufnr, desc = "goto Implementation" })
  nmap("<leader>D", vim.lsp.buf.type_definition, { bufnr = bufnr, desc = "Type Definition" })
  --
  -- diagnostics
  nmap("<leader>cl", function()
    vim.diagnostic.open_float({ border = "rounded" })
  end, { bufnr = bufnr, desc = "code line diagnostic" })
  --
  -- diagnostics goto_mapping
  nmap("]d", diagnostic_goto(true), { bufnr = bufnr, desc = "Next Diagnostic" })
  nmap("[d", diagnostic_goto(false), { bufnr = bufnr, desc = "Prev Diagnostic" })
  nmap("]e", diagnostic_goto(true, "ERROR"), { bufnr = bufnr, desc = "Next Error" })
  nmap("[e", diagnostic_goto(false, "ERROR"), { bufnr = bufnr, desc = "Prev Error" })
  nmap("]w", diagnostic_goto(true, "WARN"), { bufnr = bufnr, desc = "Next Warning" })
  nmap("[w", diagnostic_goto(false, "WARN"), { bufnr = bufnr, desc = "Prev Warning" })
  --
  -- See `:help K` for why this keymap
  nmap("K", vim.lsp.buf.hover, { bufnr = bufnr, desc = "Hover Documentation" })
  nmap("<C-k>", vim.lsp.buf.signature_help, { bufnr = bufnr, desc = "Signature Documentation" })

  -- Lesser used LSP functionality
  nmap("gD", vim.lsp.buf.declaration, { bufnr = bufnr, desc = "goto Declaration" })
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, { bufnr = bufnr, desc = "workspace add Folder" })
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, { bufnr = bufnr, desc = "workspace remove Folder" })
  nmap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { bufnr = bufnr, desc = "workspace list Folders" })
end

M.handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

return M
