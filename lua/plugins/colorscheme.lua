return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      -- latte, frappe, macchiato, mocha
      flavour = 'mocha',
      background = {
        light = "latte",
        dark = "mocha"
      },
      transparent_background = true,
      float = {
        transparent = true,       -- enable transparent floating windows
        solid = false,            -- use solid styling for floating windows, see |winborder|
      },
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = false,        -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false,          -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15,        -- percentage of the shade to apply to the inactive window
      },
      no_italic = false,          -- Force no italic
      no_bold = false,            -- Force no bold
      no_underline = false,       -- Force no underline
      styles = {                  -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" },  -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      custom_highlights = {},
      default_integrations = true,
      auto_integrations = false,
      color_overrides = require('util.colorscheme.catpuccin_overrides').dark,
      integrations = {
        fidget = true,
        cmp = true,               -- Enable integration with nvim-cmp
        gitsigns = true,          -- Enable integration with gitsigns
        nvimtree = true,          -- Enable integration with nvim-tree
        treesitter = true,        -- Enable integration with treesitter
        notify = false,           -- Disable integration with nvim-notify
        mini = {
          enabled = true,         -- Enable mini plugin integration
          indentscope_color = '', -- Set indentscope color (empty means default)
        },
        -- Additional plugin integrations can be found in the documentation
      },
      notification = {
        window = {
          winblend = 0
        }
      }
    },
  },
  {
    'cideM/yui',
    name = 'yui',
    priority = 1000,
    config = function()
      vim.g.yui_line_numbers = 'fade' -- "fade", "emphasize"
      vim.g.yui_comments = 'bg'       -- "bg", "emphasize", "fade", "normal"
      vim.g.yui_folds = 'emphasize'   -- "emphasize", "fade"
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'night',
      transparent = true,
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = 'dark', -- style for sidebars, see below
        floats = 'dark',   -- style for floating windows
      },
    },
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('kanagawa').setup({
        -- `wave` the default heart-warming theme,
        -- `dragon` for those late-night sessions
        -- `lotus` for when you're out in the open.
        theme = "wave",
        background = {
          dark = 'wave',
          light = 'wave',
        },
        transparent = true,
        commentStyle = {
          italic = true,
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = 'none' },
            FloatBorder = { bg = 'none' },
            FloatTitle = { bg = 'none' },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            -- LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            -- MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          }
        end,
      })
    end,
  },
  {
    'Shatur/neovim-ayu',
    lazy = false,
    priority = 1000,
    config = function()
      require('ayu').setup({
        mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
        terminal = true, -- Set to `false` to let terminal manage its own colors.
        overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
      })
    end
  }
}
