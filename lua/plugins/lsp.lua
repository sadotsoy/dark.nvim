local utils = require("util.lsp")
--
-- LSP configs
--

local servers = {
	"bashls",
	"clangd",
	"cssls",
	"lua_ls",
	"vtsls",
}

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			"mason.nvim",
			{ "williamboman/mason-lspconfig.nvim", config = function() end },
		},
		-- example using `opts` for defining servers
		opts = {
			servers = {
				bashls = {},
				clangd = {},
				cssls = {},
				eslint = {},
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
								-- enable = true,
								-- setType = false,
								-- paramType = true,
								-- paramName = "Disable",
								-- semicolon = "Disable",
								-- arrayIndex = "Disable",
							},
						},
					},
				},
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
						vtsls = {
							enableMoveToFileCodeAction = true,
							autoUseWorkspaceTsdk = true,
							experimental = {
								maxInlayHintLength = 30,
								completion = {
									enableServerSideFuzzyMatch = true,
								},
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
								variableTypes = { enabled = false },
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
				config.on_attach = utils.on_attach
				lspconfig[server].setup(config)
			end
			require("ufo").setup()
		end,
	},
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
}
