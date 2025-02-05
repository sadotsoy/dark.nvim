return {
  {
    -- Tiny plugin to enhance Neovim's native comments
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
  },
  {
    -- ✅ Highlight, list and search todo comments in your projects
    -- TODO, HACK, WARN, PERF, NOTE, TEST
    "folke/todo-comments.nvim",
    cmd = { "TodoFzfLua" },
    event = "VeryLazy",
    opts = {
      signs = true,
    },
    keys = keys.todocomment,
  },
  {
    -- A better annotation generator for Neovim
    "danymat/neogen",
    cmd = "Neogen",
    config = true,
    keys = keys.neogen,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
  {
    -- Add/change/delete surrounding delimiter pairs with ease. Written with ❤️ in Lua.
    "kylechui/nvim-surround",
    event = { "BufReadPost", "BufNewFile" },
    config = true,
  },
  {
    -- Compatibility layer for using nvim-cmp sources on blink.cmp
    "saghen/blink.compat",
    -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
    version = "*",
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {},
  },
  {
    -- Performant, batteries-included completion plugin for Neovim with advanced features
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    -- dependencies = "rafamadriz/friendly-snippets",
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
      keymap = {
        preset = "default",
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-l>"] = { "hide" },
        ["<C-e>"] = {
          "show",
          "show_documentation",
          "hide_documentation",
        },
        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
      },
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
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
          "lazydev",
          "avante_commands",
          "avante_mentions",
          "avante_files",
        },
        per_filetype = {
          codecompanion = { "codecompanion" },
        },
        -- add lazydev for yor completion providers
        providers = {
          -- dont show LuaLS require statements when lazydev has items
          ---@diagnostic disable-next-line: missing-fields
          lsp = { fallbacks = { "lazydev" } },
          ---@diagnostic disable-next-line: missing-fields
          lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
          avante_commands = {
            name = "avante_commands",
            module = "blink.compat.source",
            score_offset = 90, -- show at a higher priority than lsp
            opts = {},
          },
          avante_files = {
            name = "avante_commands",
            module = "blink.compat.source",
            score_offset = 100, -- show at a higher priority than lsp
            opts = {},
          },
          avante_mentions = {
            name = "avante_mentions",
            module = "blink.compat.source",
            score_offset = 1000, -- show at a higher priority than lsp
            opts = {},
          },
        },
      },
      -- experimental signature help support
      -- signature = { enabled = true }
    },
  },
  {
    -- Faster LuaLS setup for Neovim
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load {X} types when the `X` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "snacks.nvim",        words = { "Snacks" } },
        -- Load the wezterm types when the `wezterm` module is required
        -- Needs `justinsgithub/wezterm-types` to be installed
        { path = "wezterm-types",      mods = { "wezterm" } },
      },
    },
  },
}
