local root = require('util.editor')

---@class PluginKey
---@field desc string
---@field mod? string[]
---@public field key string
---@public field action function

---@class PluginKeys table<string, PluginKey[]>
local keys = {
  -- stylua: ignore
  snacks = {
    -- Top Pickers & Explorer
    { "<leader><space>", desc = "Smart Find Files",        function() Snacks.picker.smart() end },
    { "<leader>,",       desc = "Buffers",                 function() Snacks.picker.buffers() end },
    { "<leader>/",       desc = "Grep",                    function() Snacks.picker.grep() end },
    { "<leader>:",       desc = "Command History",         function() Snacks.picker.command_history() end },
    { "<leader>e",       desc = "File Explorer",           function() Snacks.explorer() end },
    { "<leader>pa",      desc = "Snacks: List of pickers", function() Snacks.picker.pick() end },
    -- find
    {
      "<leader>fc",
      desc = "Find Config File",
      function()
        Snacks.picker.files({
          cwd = vim.fn.stdpath(
            "config")
        })
      end
    },
    { "<leader>ff",  desc = "Find Files",                                      function() Snacks.picker.files() end },
    { "<leader>fg",  desc = "Find Git Files",                                  function() Snacks.picker.git_files() end },
    { "<leader>fp",  desc = "Projects",                                        function() Snacks.picker.projects() end },
    { "<leader>fr",  desc = "Recent",                                          function() Snacks.picker.recent() end },
    -- git
    { "<leader>gSb", desc = "Git Branches",                                    function() Snacks.picker.git_branches() end },
    { "<leader>gSl", desc = "Git Log",                                         function() Snacks.picker.git_log() end },
    { "<leader>gSL", desc = "Git Log Line",                                    function() Snacks.picker.git_log_line() end },
    { "<leader>gSs", desc = "Git Status",                                      function() Snacks.picker.git_status() end },
    { "<leader>gSS", desc = "Git Stash",                                       function() Snacks.picker.git_stash() end },
    { "<leader>gSd", desc = "Git Diff (Hunks)",                                function() Snacks.picker.git_diff() end },
    { "<leader>gSf", desc = "Git Log File",                                    function() Snacks.picker.git_log_file() end },
    -- git GH CLI
    { "<leader>gi",  function() Snacks.picker.gh_issue() end,                  desc = "GitHub Issues (open)" },
    { "<leader>gI",  function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
    { "<leader>gp",  function() Snacks.picker.gh_pr() end,                     desc = "GitHub Pull Requests (open)" },
    { "<leader>gP",  function() Snacks.picker.gh_pr({ state = "all" }) end,    desc = "GitHub Pull Requests (all)" },
    -- Grep
    { "<leader>sb",  desc = "Buffer Lines",                                    function() Snacks.picker.lines() end },
    { "<leader>sB",  desc = "Grep Open Buffers",                               function() Snacks.picker.grep_buffers() end },
    -- LSP
    {
      "gI",
      desc = "Goto Implementation",
      function()
        Snacks.picker
            .lsp_implementations()
      end
    },
    {
      "gy",
      desc = "Goto T[y]pe Definition",
      function()
        Snacks.picker
            .lsp_type_definitions()
      end
    },
    { "<leader>ss", desc = "LSP Symbols",             function() Snacks.picker.lsp_symbols() end },
    {
      "<leader>sS",
      desc = "LSP Workspace Symbols",
      function()
        Snacks.picker
            .lsp_workspace_symbols()
      end
    },
    -- Other
    { "<leader>n",  desc = "notificaton Historiy",    function() Snacks.notifier.show_history() end },
    { "<leader>z",  desc = "z Toggle Zen mode",       function() Snacks.zen() end, },
    { "<leader>Z",  desc = "Z Toggle Zoom",           function() Snacks.zen.zoom() end },
    { "<leader>.",  desc = ". Toggle Scratch buffer", function() Snacks.scratch() end },
    { "<leader>S",  desc = "Select Scratch Buffer",   function() Snacks.scratch.select() end },
    { "<leader>cd", desc = "code debug",              function() Snacks.debug.run() end },
    { "<leader>bd", desc = "buff delete ",            function() Snacks.bufdelete() end },
    { "<leader>rF", desc = "rename File ",            function() Snacks.rename.rename_file() end },
    { "<leader>gB", desc = "git Browse ",             function() Snacks.gitbrowse() end },
    { "<leader>gb", desc = "git blame  line",         function() Snacks.git.blame_line() end },
    { "<leader>gf", desc = "git file  history",       function() Snacks.lazygit.log_file() end },
    { "<leader>gg", desc = "git ui ",                 function() Snacks.lazygit() end },
    { "<leader>gl", desc = "g log file ",             function() Snacks.lazygit.log() end },
    { "<leader>un", desc = "notification hide ",      function() Snacks.notifier.hide() end },
    { "<c-t>",      desc = "Toggle terminal",         function() Snacks.terminal() end },
    {
      "]]",
      desc = "Next Reference",
      mode = { "n", "t" },
      function()
        Snacks.words.jump(vim.v.count1)
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
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    }
  },
  treesitter = {
    { '<c-space>', desc = 'Increment Selection' },
    { '<bs>', desc = 'Decrement Selection', mode = 'x' },
  },
  mason = {
    { '<leader>cm', '<cmd>Mason<cr>', desc = 'Open mason' },
  },
  fzflua = {
    { '<c-j>', '<c-j>', ft = 'fzf', mode = 't', nowait = true },
    { '<c-k>', '<c-k>', ft = 'fzf', mode = 't', nowait = true },
    --- configs
    {
      '<leader>f,',
      '<cmd>FzfLua files cwd=~/.config<CR>',
      desc = '[,] find config files',
    },
    -- find
    {
      '<leader>ff',
      '<cmd>FzfLua files<CR>',
      desc = 'find e Files (root)',
    },
    {
      '<leader>fF',
      '<cmd>FzfLua files root=true<cr>',
      desc = 'find Files (cwd)',
    },
    {
      '<leader>fg',
      '<cmd>FzfLua git_files<cr>',
      desc = 'find git Files (git-files)',
    },
    {
      '<leader>fr',
      '<cmd>FzfLua oldfiles<cr>',
      desc = 'find recent Files',
    },
    -- git
    { '<leader>gc', '<cmd>FzfLua git_commits<CR>', desc = 'git commits' },
    { '<leader>gs', '<cmd>FzfLua git_status<CR>', desc = 'git status' },
    -- search
    { '<leader>s"', '<cmd>FzfLua registers<cr>', desc = '[s] registers' },
    { '<leader>sa', '<cmd>FzfLua autocmds<cr>', desc = 'Auto Commands' },
    -- { "<leader>sb", "<cmd>FzfLua grep_curbuf<cr>", desc = "Grep current buffer" },
    { '<leader>sC', '<cmd>FzfLua commands<cr>', desc = 'Commands' },
    {
      '<leader>sd',
      '<cmd>FzfLua diagnostics_document<cr>',
      desc = 'Document Diagnostics',
    },
    {
      '<leader>sD',
      '<cmd>FzfLua diagnostics_workspace<cr>',
      desc = 'Workspace Diagnostics',
    },
    { '<leader>sh', '<cmd>FzfLua help_tags<cr>', desc = 'Help Pages' },
    {
      '<leader>sH',
      '<cmd>FzfLua highlights<cr>',
      desc = 'Search Highlight Groups',
    },
    { '<leader>sj', '<cmd>FzfLua jumps<cr>', desc = 'Jumplist' },
    { '<leader>sk', '<cmd>FzfLua keymaps<cr>', desc = 'Key Maps' },
    { '<leader>sl', '<cmd>FzfLua loclist<cr>', desc = 'Location List' },
    { '<leader>sM', '<cmd>FzfLua man_pages<cr>', desc = 'Man Pages' },
    { '<leader>sm', '<cmd>FzfLua marks<cr>', desc = 'Jump to Mark' },
    { '<leader>sR', '<cmd>FzfLua resume<cr>', desc = 'Resume' },
    { '<leader>sq', '<cmd>FzfLua quickfix<cr>', desc = 'Quickfix List' },
  },
  grugfar = {
    {
      '<leader>sr',
      function()
        local grug = require('grug-far')
        local ext = vim.bo.buftype == '' and vim.fn.expand('%:e')
        grug.open({
          transient = true,
          prefills = {
            filesFilter = ext and ext ~= '' and '*.' .. ext or nil,
          },
        })
      end,
      mode = { 'n', 'v' },
      desc = 'Search and Replace',
    },
  },
  --stylua: ignore
  flash = {
    { "ss",    mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    { "S",     mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
  },
  wichkey = {
    {
      '<leader>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
  todocomment = {
    {
      ']t',
      function()
        require('todo-comments').jump_next()
      end,
      desc = 'Next Todo Comment',
    },
    {
      '[t',
      function()
        require('todo-comments').jump_prev()
      end,
      desc = 'Previous Todo Comment',
    },
    {
      '<leader>st',
      function()
        require('todo-comments.fzf').todo()
      end,
      desc = 'Search todos',
    },
    {
      '<leader>sT',
      function()
        require('todo-comments.fzf').todo({ keywords = { 'TODO', 'FIX', 'FIXME', 'BUG' } })
      end,
      desc = 'Search todos code',
    },
  },
  markdown = {
    {
      '<leader>cX',
      '<cmd>MarkdownPreviewToggle<CR>',
      desc = 'Markdown Preview',
    },
  },
  dark_present = {
    {
      '<leader>cp',
      '<cmd>DarkPresent<CR>',
      desc = 'DarkPresent markdwon',
    },
  },
  neogen = {
    {
      '<leader>cn',
      function()
        require('neogen').generate()
      end,
      desc = 'Generate Annotations (Neogen)',
    },
  },
  conform = {
    {
      '<leader>cf',
      function()
        local ts_fts = {
          javascript = true,
          javascriptreact = true,
          typescript = true,
          typescriptreact = true,
        }
        local function fmt()
          require('conform').format({ async = true, lsp_format = 'fallback' })
        end
        if ts_fts[vim.bo.filetype] then
          pcall(vim.cmd, 'VtsExec organize_imports')
          vim.defer_fn(fmt, 200)
        else
          fmt()
        end
      end,
      mode = { 'n', 'v' },
      desc = 'Format buffer',
    },
  },
  oil = {
    {
      '-',
      '<cmd>Oil<CR>',
      desc = 'Open parent directory',
    },
    {
      '<space>-',
      function()
        require('oil').toggle_float()
      end,
      desc = 'Open parent floating window',
    },
  },
  claudecode = {
    { '<leader>a', nil, desc = 'AI/Claude Code' },
    { '<leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
    { '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
    { '<leader>ar', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
    { '<leader>aC', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
    { '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude model' },
    { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
    { '<leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude' },
    {
      '<leader>as',
      '<cmd>ClaudeCodeTreeAdd<cr>',
      desc = 'Add file',
      ft = { 'NvimTree', 'neo-tree', 'oil', 'minifiles', 'netrw' },
    },
    { '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
    { '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
  },
  undotree = {
    {
      '<leader>acu',
      vim.cmd.UndotreeToggle,
      desc = 'UndoTree: toggle',
    },
  },
  fyler = {
    { '__', '<cmd>Fyler<cr>', desc = 'Explorer' },
  },
}

return keys
