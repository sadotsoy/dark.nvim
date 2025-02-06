local codecompanion_prompts = require('config.ai.codecompanion_prompts')

return {
  {
    -- ✨ AI-powered coding, seamlessly in Neovim
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      display = {
        chat = {
          show_settings = true,
        }
      },
      prompt_library = {
        ["Code Expert"] = codecompanion_prompts.codeExpert,
      },
      stategies = {
        chat = {
          adapter = "copilot",
        },
        inline = {
          adapter = "copilot",
        },
      },
      adapters = {
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                default = "gpt-4o-2024-08-06",
              },
            },
          })
        end,
      },
    },
  },
}
