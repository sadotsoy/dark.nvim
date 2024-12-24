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
      },
      -- Set default options
      default_format_opts = {
        lsp_format = "fallback",
      },
      -- Set up format-on-save
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback"
      },
      -- Customize formatters
      formatters = {},
    },
  },
}
