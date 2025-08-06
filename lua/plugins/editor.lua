return {
  {
    -- Improved fzf.vim written in lua
    "ibhagwan/fzf-lua",
    opts = {},
    keys = keys.fzflua,
  },
  {
    -- Find And Replace plugin for neovim
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 },
    cmd = "GrugFar",
    keys = keys.grugfar,
  },
  {
    -- Navigate your code with search labels, enhanced character motions and Treesitter integration
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    ---@type Flash.Config
    opts = {
      -- modes = {
      --   char = {
      --     -- with labels
      --     jump_labels = false,
      --   },
      -- },
    },
    -- stylua: ignore
    keys = keys.flash,
  },
  {
    -- 💥 Create key bindings that stick. WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type.
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      icons = {
        mappings = false,
      },
      spec = {
        { "<leader>a",       group = "ai" },     -- Define a group for AI-related commands
        { "<leader>b",       group = "buffer" }, -- Define a group for buffer-related commands
        { "<leader>c",       group = "code" },   -- Define a group for code-related commands
        { "<leader>e",       group = "explorer" }, -- Define a group for explorer-related commands
        { "<leader>f",       group = "find" },   -- Define a group for find-related commands
        { "<leader>g",       group = "git" },    -- Define a group for git-related commands
        { "<leader>r",       group = "rename" }, -- Define a group for rename-related commands
        { "<leader>s",       group = "search" }, -- Define a group for search-related commands
        { "<leader>t",       group = "tabs" },   -- Define a group for tabs commands
        { "<leader>u",       group = "toggles" }, -- Define a group for toggle-related commands
        { "<leader>w",       group = "workspace" }, -- Define a group for workspace-related commands
        { "<leader><space>", group = "extras" }, -- Define a group for extra commands
        { "<leader>gS",       group = "git snacks search" }
      },
    },
    keys = keys.wichkey,
  },
  {
    -- Not UFO in the sky, but an ultra fold in Neovim.
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    opts = {},
  },
  {
    -- The fastest Neovim colorizer.
    "norcalli/nvim-colorizer.lua",
    opts = {},
    config = function()
      require("colorizer").setup()
    end,
  },
}
