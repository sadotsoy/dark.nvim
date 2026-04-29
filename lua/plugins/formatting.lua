return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = keys.conform,
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        css = { 'prettierd' },
        fish = { 'fish_indent' },
        go = { 'goimports', 'gofumpt' },
        html = { 'prettierd' },
        javascript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        json = { 'prettierd' },
        lua = { 'stylua' },
        markdown = { 'mdformat' },
        scss = { 'prettierd' },
        sh = { 'shfmt' },
        typescript = { 'prettierd' },
        typescriptreact = { 'prettierd' },
      },
      -- Set default options
      default_format_opts = {
        lsp_format = 'fallback',
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
      },
      -- Set up format-on-save
      -- format_on_save = {
      -- 	timeout_ms = 3000,
      -- 	lsp_format = "fallback",
      -- 	async = false, -- not recommended to change
      -- 	quiet = false, -- not recommended to change
      -- },
    },
  },
}
