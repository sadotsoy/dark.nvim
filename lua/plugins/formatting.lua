return {
  {
    -- Lightweight yet powerful formatter plugin for Neovim
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    event = { "BufWritePre" },
    lazy = true,
    cmd = { "ConformInfo" },
    keys = keys.conform,
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        markdown = { "mdformat" },
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        javascript = { 'prettierd', 'eslint_d' },
        javascriptreact = { 'prettierd', 'eslint_d' },
        typescript = { 'prettierd', 'eslint_d' },
        typescriptreact = { 'prettierd', 'eslint_d' }
      },
      -- Set default options
      default_format_opts = {
        timeout_ms = 3000,
        async = false,           -- not recommended to change
        quiet = false,           -- not recommended to change
        lsp_format = "fallback", -- not recommended to change
      },
      -- Set up format-on-save
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback"
      },
      -- Customize formatters
      formatters = {
        injected = { options = { ignore_errors = true } },
      },
    },
  },
}
