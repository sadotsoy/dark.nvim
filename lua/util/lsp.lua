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
  border = border,
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
  -- go function according next or prev
  -- https://neovim.io/doc/user/diagnostic.html#vim.diagnostic.JumpOpts
  local go = vim.diagnostic.jump({
    count = next and 1 or -1,
    severity = severity and vim.diagnostic.severity[severity] or nil
  })
  return function()
    if go then
      go()
    else
      print("Failes to jump top diagnostic", severity)
    end
  end
end


---Function to show the diagnostics in the virtual line
local virt_lines_ns = vim.api.nvim_create_namespace 'on_diagnostic_jump'
--- @param diagnostic? vim.Diagnostic
--- @param bufnr integer
function M.on_jump(diagnostic, bufnr)
  if not diagnostic then return end
  vim.diagnostic.show(
    virt_lines_ns,
    bufnr,
    { diagnostic },
    { virtual_lines = { current_line = true }, virtual_text = true }
  )
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
    "<leader>cL",
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
  keymap(normalMode, "]d", function() diagnostic_goto(true) end,
    { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "Next Diagnostic" })
  keymap(normalMode, "[d", function() diagnostic_goto(false) end,
    { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "Prev Diagnostic" })
  keymap(normalMode, "]e", function() diagnostic_goto(true, "ERROR") end,
    { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "Next Error" })
  keymap(normalMode, "[e", function() diagnostic_goto(false, "ERROR") end,
    { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "Prev Error" })
  keymap(normalMode, "]w", function() diagnostic_goto(true, "WARN") end,
    { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "Next Warning" })
  keymap(normalMode, "[w", function() diagnostic_goto(false, "WARN") end,
    { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "Prev Warning" })
  --
  -- See `:help K` for why this keymap
  keymap(normalMode, "K", function() vim.lsp.buf.hover({ border = border }) end,
    { buffer = bufnr, desc = LSP_DESC_PREFFIX .. "Hover Documentation" })
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

-- LSP HANDLERS
-- https://neovim.io/doc/user/diagnostic.html#_handlers
M.handlers = {}


return M
