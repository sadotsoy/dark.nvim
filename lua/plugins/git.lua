local git_utils = require("util.git")

return {
  {
    -- Fugitive.vim: A Git wrapper so awesome, it should be illegal
    "tpope/vim-fugitive",
  },
  {
    -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
    "sindrets/diffview.nvim",
  },
  {
    -- Git integration for buffers
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      signs_staged = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
      on_attach = git_utils.on_attach_git_signs,
    },
  },
  {
    "gitsigns.nvim",
    opts = function()
      Snacks.toggle({
        name = "Git Signs",
        get = function()
          return require("gitsigns.config").config.signcolumn
        end,
        set = function(state)
          require("gitsigns").toggle_signs(state)
        end,
      }):map("<leader>uG")
    end,
  },
  -- {
  --   -- Visual git plugin for Neovim
  --   'tanvirtin/vgit.nvim',
  --   branch = 'v1.0.x',
  --   -- or               , tag = 'v1.0.2',
  --   dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
  --   -- Lazy loading on 'VimEnter' event is necessary.
  --   event = 'VimEnter',
  --   config = function()
  --     require("vgit").setup({
  --       keymaps = {
  --         ['n <C-k>'] = function() require('vgit').hunk_up() end,
  --         ['n <C-j>'] = function() require('vgit').hunk_down() end,
  --         ['n <leader>gs'] = function() require('vgit').buffer_hunk_stage() end,
  --         ['n <leader>gr'] = function() require('vgit').buffer_hunk_reset() end,
  --         ['n <leader>gp'] = function() require('vgit').buffer_hunk_preview() end,
  --         ['n <leader>gb'] = function() require('vgit').buffer_blame_preview() end,
  --         ['n <leader>gf'] = function() require('vgit').buffer_diff_preview() end,
  --         ['n <leader>gh'] = function() require('vgit').buffer_history_preview() end,
  --         ['n <leader>gu'] = function() require('vgit').buffer_reset() end,
  --         ['n <leader>gd'] = function() require('vgit').project_diff_preview() end,
  --         ['n <leader>gx'] = function() require('vgit').toggle_diff_preference() end,
  --       },
  --     })
  --   end,
  -- },
}
