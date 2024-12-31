return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = keys.conform,
		-- This will provide type hinting with LuaLS
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				fish = { "fish_indent" },
				javascript = { "prettierd", "eslint_d" },
				javascriptreact = { "prettierd", "eslint_d" },
				lua = { "stylua" },
				markdown = { "mdformat" },
				sh = { "shfmt" },
				typescript = { "prettierd", "eslint_d" },
				typescriptreact = { "prettierd", "eslint_d" },
			},
			-- Set default options
			default_format_opts = {
				lsp_format = "fallback",
				async = false, -- not recommended to change
				quiet = false, -- not recommended to change
			},
			-- Set up format-on-save
			format_on_save = {
				timeout_ms = 3000,
				lsp_format = "fallback",
				async = false, -- not recommended to change
				quiet = false, -- not recommended to change
			},
		},
	},
}
