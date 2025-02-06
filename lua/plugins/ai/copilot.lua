local copilot_prompts = require("config.ai.copilot_prompts")

return {
  {
    -- Fully featured & enhanced replacement for copilot.vim complete with API for interacting with Github Copilot
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "VeryLazy",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "bottom", -- | top | left | right | horizontal | vertical
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = false,
          auto_trigger = false,
          keymap = {
            accept = "<TAB>",
            accept_word = "<C-w>",
            accept_line = "<C-l>",
            next = "<C-j>",
            prev = "<C-k>",
            dismiss = "<ESC>",
          },
        }
      })
    end,
  },
  {
    -- Copilot Chat plugin configuration
    "CopilotC-Nvim/CopilotChat.nvim", -- Load the Copilot Chat plugin
    -- branch = "canary", -- Use the 'canary' branch
    build = "make tiktoken",          -- Only on MacOS or Linux
    dependencies = {
      { "zbirenbaum/copilot.lua" },   -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim" },    -- for curl, log and async functions
    },
    opts = {
      chat_auto_complete = true,
      model = "gpt-4o-2024-08-06",                                                     -- o1-preview | o1-mini | claude-3.5-sonnet | gpt-4o-2024-08-06
      question_header = "## User ",                                                    -- Header for user questions
      answer_header = "## Copilot ",                                                   -- Header for Copilot answers
      error_header = "## Error ",                                                      -- Header for errors
      prompts = copilot_prompts,                                                       -- Use the defined prompts
      auto_follow_cursor = false,                                                      -- Disable auto-follow cursor
      show_help = false,                                                               -- Disable showing help by default
      mappings = {
        complete = { detail = "Use @<Tab> or /<Tab> for options.", insert = "<Tab>" }, -- Keybinding for completion
        close = { normal = "q", insert = "<C-c>" },                                    -- Keybinding to close chat
        reset = { normal = "<C-x>", insert = "<C-x>" },                                -- Keybinding to reset chat
        submit_prompt = { normal = "<CR>", insert = "<C-CR>" },                        -- Keybinding to submit prompt
        accept_diff = { normal = "<C-y>", insert = "<C-y>" },                          -- Keybinding to accept diff
        yank_diff = { normal = "gmy" },                                                -- Keybinding to yank diff
        show_diff = { normal = "gmd" },                                                -- Keybinding to show diff
        show_info = { normal = "gmp" },
        show_context = { normal = "gms" },
        show_help = { normal = "gmh" }, -- Keybinding to show help
      },
      contexts = {
        git = {
          description = "Requires `git`. Includes current git diff in chat context. Supports input (default unstaged).",
          input = function(callback)
            vim.ui.select({ "unstaged", "staged" }, {
              prompt = "Select diff type> ",
            }, callback)
          end,
          resolve = function(input, source)
            input = input or "unstaged"
            return {
              require("CopilotChat.context").gitdiff(input, source.winnr),
            }
          end,
        },
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      local select = require("CopilotChat.select")

      -- Set default selection method
      opts.selection = select.unnamed

      -- Setup Copilot Chat with the provided options
      chat.setup(opts)

      -- Create user commands for different chat modes
      vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
        chat.ask(args.args, { selection = select.visual })
      end, { nargs = "*", range = true })

      vim.api.nvim_create_user_command("CopilotChatInline", function(args)
        chat.ask(args.args, {
          selection = select.visual,
          window = {
            layout = "float",
            relative = "cursor",
            width = 1,
            height = 0.4,
            row = 1,
          },
        })
      end, { nargs = "*", range = true })

      vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
        chat.ask(args.args, { selection = select.buffer })
      end, { nargs = "*", range = true })

      -- Set buffer-specific options when entering Copilot buffers
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-*",
        callback = function()
          vim.opt_local.relativenumber = true
          vim.opt_local.number = true

          -- C-p to print last response
          vim.keymap.set("n", "<C-p>", function()
            print(require("CopilotChat").response())
          end, { buffer = true, remap = true })

          local ft = vim.bo.filetype
          if ft == "copilot-chat" then
            vim.bo.filetype = "markdown"
          end
        end,
      })
    end,
    event = "VeryLazy", -- Load this plugin on the 'VeryLazy' event
    keys = keys.copilot,
  },
}
