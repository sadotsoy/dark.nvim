local keymap = require("util.maps").keymap
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

  local normalMode = "n"
  local LSP_DESC_PREFFIX = "LSP: "

  -- code
  keymap(
    normalMode,
    "<leader>rn",
    vim.lsp.buf.rename,
    { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "re name buff value" }
  )
  keymap(normalMode, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "code action" })
  keymap(normalMode, "<leader>c=", function()
    vim.lsp.buf.format({ timeout_ms = 5000 })
  end, { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "code format" })
  -- diagnostics
  keymap(
    normalMode,
    "<leader>cl",
    show_line_diagnostics,
    { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "code line diagnostic" }
  )
  -- definitions and delcarations
  keymap(normalMode, "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "goto definition" })
  keymap(normalMode, "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "goto declaration" })
  keymap(
    normalMode,
    "gI",
    vim.lsp.buf.implementation,
    { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "goto implementation" }
  )
  keymap(normalMode, "gr", vim.lsp.buf.references, { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "list all references" })
  keymap(
    normalMode,
    "gt",
    vim.lsp.buf.type_definition,
    { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "goto type definitions" }
  )
  --
  -- diagnostics goto_mapping
  keymap(normalMode, "]d", diagnostic_goto(true), { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "Next Diagnostic" })
  keymap(normalMode, "[d", diagnostic_goto(false), { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "Prev Diagnostic" })
  keymap(normalMode, "]e", diagnostic_goto(true, "ERROR"), { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "Next Error" })
  keymap(normalMode, "[e", diagnostic_goto(false, "ERROR"), { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "Prev Error" })
  keymap(normalMode, "]w", diagnostic_goto(true, "WARN"), { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "Next Warning" })
  keymap(normalMode, "[w", diagnostic_goto(false, "WARN"), { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "Prev Warning" })
  --
  -- See `:help K` for why this keymap
  keymap(normalMode, "K", vim.lsp.buf.hover, { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "Hover Documentation" })
  keymap(
    normalMode,
    "<C-k>",
    vim.lsp.buf.signature_help,
    { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "Signature Documentation" }
  )

  -- Lesser used LSP functionality
  keymap(
    normalMode,
    "<leader>wa",
    vim.lsp.buf.add_workspace_folder,
    { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "workspace add Folder" }
  )
  keymap(
    normalMode,
    "<leader>wr",
    vim.lsp.buf.remove_workspace_folder,
    { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "workspace remove Folder" }
  )
  keymap(normalMode, "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "workspace list Folders" })

  -- Keymaps by language
  -- TS | JS
  if client == "vtsls" then
    keymap(
      normalMode,
      "<leader>co",
      "<Cmd>VtsExec organize_imports<CR>",
      { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "Organize imports" }
    )
    keymap(
      normalMode,
      "<leader>ci",
      "<Cmd>VtsExec add_missing_imports<CR>",
      { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "Add missing imports" }
    )
    keymap(
      normalMode,
      "<leader>cx",
      "<Cmd>VtsExec remove_unused_imports<CR>",
      { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "Removed unused imports" }
    )
    keymap(
      normalMode,
      "<leader>rf",
      "<Cmd>VtsExec rename_file<CR>",
      { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "Rename file" }
    )
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
