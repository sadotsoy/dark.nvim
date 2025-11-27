return {
  -- A neovim file manager which can edit file system like a buffer with tree view
  {
    "A7Lavinraj/fyler.nvim",
    dependencies = { "nvim-mini/mini.icons" },
    branch = "stable", -- Use stable branch for production
    lazy = false,      -- Necessary for `default_explorer` to work properly
    opts = {},
    keys = keys.fyler,
  }
}
