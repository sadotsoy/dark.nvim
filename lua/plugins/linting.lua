return {
  {
    'mfussenegger/nvim-lint',
    event = 'VeryLazy',
    keys = _G.keys.linting,
    opts = {
      -- Event to trigger linters
      events = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
      linters_by_ft = {
        c = { 'cpplint' },
        cpp = { 'cpplint' },
        css = { 'stylelint' },
        fish = { 'fish' },
        go = { 'golangcilint' },
        javascript = { 'oxlint' },
        javascriptreact = { 'oxlint' },
        lua = { 'selene' },
        markdown = { 'markdownlint-cli2' },
        scss = { 'stylelint' },
        typescript = { 'oxlint' },
        typescriptreact = { 'oxlint' },
      },
    },
    config = function(_, opts)
      local lint = require('lint')
      lint.linters_by_ft = opts.linters_by_ft

      vim.api.nvim_create_autocmd(opts.events, {
        callback = function()
          -- try_lint without arguments runs the linters defined in `linters_by_ft`
          -- for the current filetype
          require('lint').try_lint()

          -- You can call `try_lint` with a linter name or a list of names to always
          -- run specific linters, independent of the `linters_by_ft` configuration
          -- require("lint").try_lint("cspell")
        end,
      })
    end,
  },
}
