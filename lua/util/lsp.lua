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
  border = "rounded",
}

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

function M.on_attach(args, bufnr)
  local client = args.name
  if not client then
    return
  end

  --- Function to set a key mapping for the current buffer
  ---@param keys string # The sequence to bind
  ---@param cmd string|function # The function to call when the key is pressed
  ---@param opts {desc: string} # A table containing desc and bufnr
  local buff_keymap = function(keys, cmd, opts)
    if opts.desc then
      opts.desc = "LSP: " .. opts.desc
    end

    ---@diagnostic disable-next-line: missing-fields
    vim.keymap.set("n", keys, cmd, { buffer = bufnr, desc = opts.desc, noremap = true })
  end

  -- code
  buff_keymap("<leader>rn", vim.lsp.buf.rename, { desc = "re name buff value" })
  buff_keymap("<leader>ca", vim.lsp.buf.code_action, { desc = "code action" })
  buff_keymap("<leader>c=", function()
    vim.lsp.buf.format({ timeout_ms = 5000 })
  end, { desc = "code format" })
  -- diagnostics
  buff_keymap("<leader>cl", show_line_diagnostics, { desc = "code line diagnostic" })
  -- definitions and delcarations
  buff_keymap("gd", vim.lsp.buf.definition, { desc = "goto definition" })
  buff_keymap("gD", vim.lsp.buf.declaration, { desc = "goto declaration" })
  buff_keymap("gI", vim.lsp.buf.implementation, { desc = "goto implementation" })
  buff_keymap("gr", vim.lsp.buf.references, { desc = "list all references" })
  buff_keymap("gt", vim.lsp.buf.type_definition, { desc = "goto type definitions" })
  --
  -- diagnostics goto_mapping
  buff_keymap("]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
  buff_keymap("[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
  buff_keymap("]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
  buff_keymap("[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
  buff_keymap("]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
  buff_keymap("[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
  --
  -- See `:help K` for why this keymap
  buff_keymap("K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
  buff_keymap("<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })

  -- Lesser used LSP functionality
  buff_keymap("<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "workspace add Folder" })
  buff_keymap("<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "workspace remove Folder" })
  buff_keymap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { desc = "workspace list Folders" })

  -- Keymaps by language
  -- TS | JS
  if client == "vtsls" then
    buff_keymap("<leader>co", "<Cmd>VtsExec organize_imports<CR>", { desc = "Organize imports" })
    buff_keymap("<leader>ci", "<Cmd>VtsExec add_missing_imports<CR>", { desc = "Add missing imports" })
    buff_keymap("<leader>cx", "<Cmd>VtsExec remove_unused_imports<CR>", { desc = "Removed unused imports" })
    buff_keymap("<leader>rf", "<Cmd>VtsExec rename_file<CR>", { desc = "Rename file" })
  end
end

M.handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border, width = 80 }),
  ["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = border, close_events = { "CursorMoved", "BufHidden", "InsertCharPre" } }
  ),
}

return M
