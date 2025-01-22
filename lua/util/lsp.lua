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

---Float diagnostic options
local float_options = {
  focusable = false,
  width = 80,
  border = "rounded"
}

--- Function to set a key mapping for the current buffer
---@param keys string # The sequence to bind
---@param func function # The function to call when the key is pressed
---@param opts {bufnr: number, desc: string} # A table containing desc and bufnr
local buff_keymap = function(keys, func, opts)
  if opts.desc then
    opts.desc = "LSP: " .. opts.desc
  end

  ---@diagnostic disable-next-line: missing-fields
  vim.keymap.set("n", keys, func, { buffer = opts.bufnr, desc = opts.desc, noremap = true })
end

---Function to show line diagnostics
local show_line_diagnostics = function()
  vim.diagnostic.open_float(float_options)
end

---Function to reuse diagnostic_goto
---@param next boolean to control if is next or prev
---@param severity? string|integer|nil to control the severy level
---@return function
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity, float = float_options })
  end
end

---Function to setup key mappings and custome commands when a new LSP client attaches
---@param _ any
---@param bufnr number
function M.on_attach(_, bufnr)
  -- code
  buff_keymap("<leader>rn", vim.lsp.buf.rename, { bufnr = bufnr, desc = "re name buff value" })
  buff_keymap("<leader>ca", vim.lsp.buf.code_action, { bufnr = bufnr, desc = "code action" })
  buff_keymap("<leader>c=", function()
    vim.lsp.buf.format({ timeout_ms = 5000 })
  end, { bufnr = bufnr, desc = "code format" })
  -- diagnostics
  buff_keymap("<leader>cl", show_line_diagnostics, { bufnr = bufnr, desc = "code line diagnostic" })
  -- definitions and delcarations
  buff_keymap("gd", vim.lsp.buf.definition, { bufnr = bufnr, desc = "goto definition" })
  buff_keymap("gD", vim.lsp.buf.declaration, { bufnr = bufnr, desc = "goto Declaration" })
  buff_keymap("gI", vim.lsp.buf.implementation, { bufnr = bufnr, desc = "goto Implementation" })
  buff_keymap("<leader>D", vim.lsp.buf.type_definition, { bufnr = bufnr, desc = "Type Definition" })
  --
  -- diagnostics goto_mapping
  buff_keymap("]d", diagnostic_goto(true), { bufnr = bufnr, desc = "Next Diagnostic" })
  buff_keymap("[d", diagnostic_goto(false), { bufnr = bufnr, desc = "Prev Diagnostic" })
  buff_keymap("]e", diagnostic_goto(true, "ERROR"), { bufnr = bufnr, desc = "Next Error" })
  buff_keymap("[e", diagnostic_goto(false, "ERROR"), { bufnr = bufnr, desc = "Prev Error" })
  buff_keymap("]w", diagnostic_goto(true, "WARN"), { bufnr = bufnr, desc = "Next Warning" })
  buff_keymap("[w", diagnostic_goto(false, "WARN"), { bufnr = bufnr, desc = "Prev Warning" })
  --
  -- See `:help K` for why this keymap
  buff_keymap("K", vim.lsp.buf.hover, { bufnr = bufnr, desc = "Hover Documentation" })
  buff_keymap("<C-k>", vim.lsp.buf.signature_help, { bufnr = bufnr, desc = "Signature Documentation" })

  -- Lesser used LSP functionality
  buff_keymap("<leader>wa", vim.lsp.buf.add_workspace_folder, { bufnr = bufnr, desc = "workspace add Folder" })
  buff_keymap("<leader>wr", vim.lsp.buf.remove_workspace_folder, { bufnr = bufnr, desc = "workspace remove Folder" })
  buff_keymap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { bufnr = bufnr, desc = "workspace list Folders" })
end

M.handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border, width = 80 }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help,
    { border = border, close_events = { "CursorMoved", "BufHidden", "InsertCharPre" },
    }),
}

return M
