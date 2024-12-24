local root = require("util.editor")

---@class PluginKey
---@field desc string
---@field mod? string[]
---@public field key string
---@public field action function

---@class PluginKeys table<string, PluginKey[]>
local keys = {
  --stylua: ignore
  snacks = {
    { "<leader>z",  desc = "[z] Toggle Zen mode",       function() Snacks.zen() end, },
    { "<leader>Z",  desc = "[Z] Toggle Zoom",           function() Snacks.zen.zoom() end },
    { "<leader>.",  desc = "[.] Toggle Scratch buffer", function() Snacks.scratch() end },
    { "<leader>S",  desc = "Select Scratch Buffer",     function() Snacks.scratch.select() end },
    { "<leader>n",  desc = "[n]otificaton Historiy",    function() Snacks.notifier.show_history() end },
    { "<leader>cd", desc = "[c]ode d[ebug]",            function() Snacks.debug.run() end },
    { "<leader>bd", desc = "[b]uff [d]elete ",          function() Snacks.bufdelete() end },
    { "<leader>rF", desc = "[r]ename [F]ile ",          function() Snacks.rename.rename_file() end },
    { "<leader>gB", desc = "[g]it [B]rowse ",           function() Snacks.gitbrowse() end },
    { "<leader>gb", desc = "[g]it [b]lame  line",       function() Snacks.git.blame_line() end },
    { "<leader>gf", desc = "[g]it [f]ile  history",     function() Snacks.lazygit.log_file() end },
    { "<leader>gu", desc = "[g]it [u]i ",               function() Snacks.lazygit() end },
    { "<leader>gl", desc = "[g] [l]og file ",           function() Snacks.lazygit.log() end },
    { "<leader>un", desc = "[n]otification [h]ide ",    function() Snacks.notifier.hide() end },
    { "<c-t>",      desc = "Toggle terminal",           function() Snacks.terminal() end },
    {
      "]]",
      desc = "Next Reference",
      mode = { "n", "t" },
      function()
        Snacks
            .words.jump(vim.v.count1)
      end
    },
    {
      "[[",
      desc = "Prev Reference",
      mode = { "n", "t" },
      function()
        Snacks
            .words.jump(-vim.v.count1)
      end
    },

    {
      "<leader>N",
      desc = "[N]eovim News",
      function()
        ---@diagnostic disable-next-line: missing-fields
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          minimal = true,
          fixbuf = true,
          position = "float",
          width = 0.66,
          heigt = 0.66,
          wo = {
            spell = true,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    },
  },
  treesitter = {
    { "<c-space>", desc = "Increment Selection" },
    { "<bs>",      desc = "Decrement Selection", mode = "x" },
  },
  mason = {
    { "<leader>cm", "<cmd>Mason<cr>", desc = "Open mason" },
  },
  neotree = {
    {
      "<leader>ee",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = root.get_root_dir() })
      end,
      desc = "[e]xplorer (Root Dir)",
    },
    {
      "<leader>ef",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "[e]xlorer [f] (cwd)",
    },
  },
  fzflua = {
    { "<c-j>", "<c-j>", ft = "fzf", mode = "t", nowait = true },
    { "<c-k>", "<c-k>", ft = "fzf", mode = "t", nowait = true },
    {
      "<leader>,",
      "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",
      desc = "[,] switch buffer",
    },
    {
      "<leader>/",
      "<cmd>FzfLua live_grep<cr>",
      desc = "[/] greep (Root dir)",
    },
    {
      "<leader>:",
      "<cmd>FzfLua command_history<cr>",
      desc = "[:] command history",
    },
    {
      "<leader><space>",
      "<cmd>FzfLua files<cr>",
      desc = "[<space>] Find Files (Root Dir)",
    },
    -- find
    {
      "<leader>fF",
      "<cmd>FzfLua files root=true<cr>",
      desc = "[f]ind [F]iles (cwd)",
    },
    {
      "<leader>fg",
      "<cmd>FzfLua git_files<cr>",
      desc = "[f]ind [g]it Files (git-files)",
    },
    {
      "<leader>fr",
      "<cmd>FzfLua oldfiles<cr>",
      desc = "[find] [r]ecent Files",
    },
    -- git
    { "<leader>gc", "<cmd>FzfLua git_commits<CR>", desc = "[g]it [c]ommits" },
    { "<leader>gs", "<cmd>FzfLua git_status<CR>",  desc = "[g]it [s]tatus" },
    -- search
    { '<leader>s"', "<cmd>FzfLua registers<cr>",   desc = "[s] registers" },
    { "<leader>sa", "<cmd>FzfLua autocmds<cr>",    desc = "Auto Commands" },
    { "<leader>sb", "<cmd>FzfLua grep_curbuf<cr>", desc = "Grep current buffer" },
    { "<leader>sC", "<cmd>FzfLua commands<cr>",    desc = "Commands" },
    {
      "<leader>sd",
      "<cmd>FzfLua diagnostics_document<cr>",
      desc = "Document Diagnostics",
    },
    {
      "<leader>sD",
      "<cmd>FzfLua diagnostics_workspace<cr>",
      desc = "Workspace Diagnostics",
    },
    { "<leader>sh", "<cmd>FzfLua help_tags<cr>", desc = "Help Pages" },
    {
      "<leader>sH",
      "<cmd>FzfLua highlights<cr>",
      desc = "Search Highlight Groups",
    },
    { "<leader>sj", "<cmd>FzfLua jumps<cr>",     desc = "Jumplist" },
    { "<leader>sk", "<cmd>FzfLua keymaps<cr>",   desc = "Key Maps" },
    { "<leader>sl", "<cmd>FzfLua loclist<cr>",   desc = "Location List" },
    { "<leader>sM", "<cmd>FzfLua man_pages<cr>", desc = "Man Pages" },
    { "<leader>sm", "<cmd>FzfLua marks<cr>",     desc = "Jump to Mark" },
    { "<leader>sR", "<cmd>FzfLua resume<cr>",    desc = "Resume" },
    { "<leader>sq", "<cmd>FzfLua quickfix<cr>",  desc = "Quickfix List" },
  },
  grugfar = {
    {
      "<leader>sr",
      function()
        local grug = require("grug-far")
        local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
        grug.open({
          transient = true,
          prefills = {
            filesFilter = ext and ext ~= "" and "*." .. ext or nil,
          },
        })
      end,
      mode = { "n", "v" },
      desc = "Search and Replace",
    },
  },
  flash = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
    {
      "<c-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
  },
  wichkey = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  todocomment = {
    { "]t",         function() require("todo-comments").jump_next() end,                                                desc = "Next Todo Comment" },
    { "[t",         function() require("todo-comments").jump_prev() end,                                                desc = "Previous Todo Comment" },
    { "<leader>st", function() require("todo-comments.fzf").todo() end,                                                 desc = "Search todos" },
    { "<leader>sT", function() require("todo-comments.fzf").todo({ keywords = { "TODO", "FIX", "FIXME", "BUG" } }) end, desc = "Search todos code" },
  },
  conform = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true })
      end,
      mode = { "n", "v" },
      desc = "[c]ode [f]ormat",
    },
  },
  markdown = {
    {
      "<leader>cp",
      "<cmd>MarkdownPreviewToggle<cr>",
      desc = "Markdown Preview",
    },
  },
  trouble = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  }
}

return keys
