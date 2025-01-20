local utils = require("util.editor")

return {
  {
    -- Neovim plugin to manage the file system and other tree like structures.
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      sources = { "filesystem", "buffers", "git_status" },
      open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
      filesystem = {
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = false,
          hide_gitignored = true,
          -- hide_hidden = true,   -- only works on Windows for hidden files/directories
          hide_by_name = {
            "node_modules",
          },
        },
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      window = {
        position = "left",
        width = 40,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
          ["<space>"] = "none",
          ["Y"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg("+", path, "c")
            end,
            desc = "Y Copy path to Clipboard",
          },
          ["P"] = { "toggle_preview", config = { use_float = false } },
        },
      },
    },
    keys = keys.neotree,
  },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["<C-s>"] = { "actions.select", opts = { vertical = true } },
        ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-t>"] = { "actions.select", opts = { tab = true } },
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = { "actions.close", mode = "n" },
        ["<C-l>"] = "actions.refresh",
        ["-"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["`"] = { "actions.cd", mode = "n" },
        ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["g."] = { "actions.toggle_hidden", mode = "n" },
        ["g\\"] = { "actions.toggle_trash", mode = "n" },
      },
    },
    keys = keys.oil,
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
  },
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
      modes = {
        char = {
          jump_labels = true,
        },
      },
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
        { "<leader>a", group = "ai" }, -- Define a group for AI-related commands
        { "<leader>b", group = "buffer" }, -- Define a group for buffer-related commands
        { "<leader>c", group = "code" }, -- Define a group for code-related commands
        { "<leader>e", group = "explorer" }, -- Define a group for explorer-related commands
        { "<leader>f", group = "find" }, -- Define a group for find-related commands
        { "<leader>g", group = "git" }, -- Define a group for git-related commands
        { "<leader>r", group = "rename" }, -- Define a group for rename-related commands
        { "<leader>s", group = "search" }, -- Define a group for search-related commands
        { "<leader>u", group = "toggles" }, -- Define a group for toggle-related commands
        { "<leader>w", group = "workspace" }, -- Define a group for workspace-related commands
        { "<leader><space>", group = "extras" }, -- Define a group for extra commands
      },
    },
    keys = keys.wichkey,
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
      on_attach = utils.on_attach_git_signs,
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
