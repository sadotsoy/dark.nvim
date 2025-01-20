return {
  {
    -- 🍿 A collection of small QoL plugins for Neovim
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      debug = { enabled = true },
      indent = { enabled = true },
      lazygit = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
        -- Available style: "compact"|"fancy"|"minimal"
        style = "compact",
      },
      quickfile = { enabled = true },
      scope = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      zen = {
        enabled = true,
        toogles = {
          dim = true,
          git_signs = false,
          mini_diff_signs = false,
          -- diagnostics = false,
          -- inlay_hints = false,
        },
        show = {
          statusline = false, -- can only be shown when using the global statusline
          tabline = false,
        },
        ---@type snacks.win.Config
        ---@diagnostic disable-next-line: missing-fields
        win = { style = "zen" },
        zoom = {
          toogles = {},
          show = {
            statusline = true,
            tabline = true,
          },
          win = {
            backdrop = false,
            width = 0, -- full width
          },
        },
      },
      styles = {
        ---@diagnostic disable-next-line: missing-fields
        notification = {
          wo = { wrap = true }, -- Wrap notifications
        },
      },
      -- scroll = { enabled = true },
    },
  -- stylua: ignore
  keys = keys.snacks,
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end

          -- Create some toggle mappings
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
          Snacks.toggle.diagnostics():map("<leader>ud")
          Snacks.toggle.line_number():map("<leader>ul")
          Snacks.toggle
            .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
            :map("<leader>uc")
          Snacks.toggle.treesitter():map("<leader>uT")
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
          Snacks.toggle.inlay_hints():map("<leader>uh")
          Snacks.toggle.indent():map("<leader>ug")
          Snacks.toggle.dim():map("<leader>uD")
        end,
      })
    end,
  },
}
