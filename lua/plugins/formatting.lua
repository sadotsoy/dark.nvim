return {
	{
		-- Lightweight yet powerful formatter plugin for Neovim
		"stevearc/conform.nvim",
		dependencies = { "mason.nvim" },
		event = { "BufWritePre" },
		lazy = true,
		cmd = { "ConformInfo" },
		keys = keys.conform,
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				lua = { "lua_ls", "stylua", stop_after_first = true },
				-- Conform will run the first available formatter
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
			-- Set default options
			default_format_opts = {
				lsp_format = "fallback",
			},
			-- Set up format-on-save
			format_on_save = { timeout_ms = 500 },
			-- Customize formatters
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		},
	},
}
