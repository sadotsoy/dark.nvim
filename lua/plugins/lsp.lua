local lsp_utils = require("util.lsp")
--
-- LSP configs
--

local servers = {
  "bashls",
  "clangd",
  "cssls",
  "eslint",
  "lua_ls",
  "vtsls",
}

return {
  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = keys.mason,
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = servers,
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require("mason").setup(opts)
      ---@diagnostic disable-next-line: missing-fields
      require("mason-lspconfig").setup({
        ensure_installed = servers,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      {
        -- 💫 Extensible UI for Neovim notifications and LSP progress messages.
        "j-hui/fidget.nvim",
        opts = {
          notification = {
            -- Options related to the notification window and buffer
            window = {
              normal_hl = "Comment", -- Base highlight group in the notification window
              winblend = 0,          -- Background color opacity in the notification window
              border = "none",       -- Border around the notification window
              zindex = 45,           -- Stacking priority of the notification window
              max_width = 0,         -- Maximum width of the notification window
              max_height = 0,        -- Maximum height of the notification window
              x_padding = 1,         -- Padding from right edge of window boundary
              y_padding = 0,         -- Padding from bottom edge of window boundary
              align = "bottom",      -- How to align the notification window
              relative = "editor",   -- What the notification window position is relative to
            },
          },
        },
      },
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
      {
        "yioneko/nvim-vtsls",
        config = function()
          require("lspconfig.configs").vtsls = require("vtsls")
              .lspconfig -- set default server config, optional but recommended
        end,
      },
    },
    -- example using `opts` for defining servers
    opts = {
      servers = {
        bashls = {},
        clangd = {},
        cssls = {},
        eslint = {},
        vtsls = {
          -- explicitly add default filetypes, so that we can extend
          -- them in related extras
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
          },
          settings = {
            complete_function_calls = true,
            autoImports = true,
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                maxInlayHintLength = 40,
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
            javascript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = true },
              },
            },
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = true },
              },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = {
                  "vim",
                },
              },
              workspace = {
                checkThirdParty = false,
              },
              codeLens = {
                enable = true,
              },
              completion = {
                callSnippet = "Replace",
              },
              doc = {
                privateName = { "^_" },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")

      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)

        -- add foldingRange capabilities to each server
        config.capabilities.textDocument.foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        }
        -- add custom on_attach
        config.on_attach = lsp_utils.on_attach
        -- add custom handlers (with borders)
        config.handlers = lsp_utils.handlers
        lspconfig[server].setup(config)
      end
      require("ufo").setup()
    end,
  },
}
