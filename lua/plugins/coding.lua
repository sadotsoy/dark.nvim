local keys = require('config.keys')

return {
  {
    -- comments
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
  },
  {
    -- A better annotation generator
    "danymat/neogen",
    cmd = "Neogen",
    config = true,
    keys = keys.neogen,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
  {
    -- better object
    "echasnovski/mini.nvim",
    config = function()
      require("mini.surround").setup()   -- surround
      require("mini.cursorword").setup() -- cursorword
      require("mini.pairs").setup({      -- pairs
        modes = { insert = true, command = true, terminal = false },
        -- skip autopair when next character is one of these
        skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
        -- skip autopair when the cursor is inside these treesitter nodes
        skip_ts = { "string" },
        -- skip autopair when next character is closing pair
        -- and there are more closing pairs than opening pairs
        skip_unbalanced = true,
        -- better deal with markdown code blocks
        markdown = true,
      })
    end,
  },
  {
    -- Performant, batteries-included completion plugin for Neovim
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = "rafamadriz/friendly-snippets",
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = {
      "sources.default",
    },

    -- use a release tag to download pre-built binaries
    version = "v0.*",

    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- see the "default configuration" section below for full documentation on how to define
      -- your own keymap.
      keymap = { preset = "super-tab" },
      ---@diagnostic disable-next-line: missing-fields
      appearance = {
        -- sets the fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = false,
        -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },
      sources = {
        -- adding any nvim-cmp sources here will enable them
        -- with blink.compat
        default = { "lsp", "path", "snippets", "buffer", "lazydev" },
        -- add lazydev for yor completion providers
        providers = {
          -- dont show LuaLS require statements when lazydev has items
          ---@diagnostic disable-next-line: missing-fields
          lsp = { fallbacks = { "lazydev" } },
          ---@diagnostic disable-next-line: missing-fields
          lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
        },
      },
      -- experimental signature help support
      -- signature = { enabled = true }
    },
  },
  --
  {
    --Faster LuaLS setup for Neovim
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load {X} types when the `X` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "lazy.nvim",          words = { "LazyVim" } },
        { path = "snacks.nvim",        words = { "Snacks" } },
        -- Load the wezterm types when the `wezterm` module is required
        -- Needs `justinsgithub/wezterm-types` to be installed
        { path = "wezterm-types",      mods = { "wezterm" } },
      },
    },
  },
}
