return {
	{
		"OXY2DEV/markview.nvim",
		lazy = false, -- Recommended
		-- ft = "markdown" -- If you decide to lazy-load anyway
		opts = {
			initial_state = false,
			-- Highlight groups to use
			-- "dynamic" | "light" | "dark"
			highlight_groups = "dynamic",
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>ct", "<cmd>Markview splitToggle<CR>", desc = "Markdown split view" },
		},
	},
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	-- 	ft = { "markdown" },
	-- 	build = function()
	-- 		require("lazy").load({ plugins = { "markdown-preview.nvim" } })
	-- 		vim.fn["mkdp#util#install"]()
	-- 	end,
	-- 	keys = keys.markdown,
	-- },
	{
		-- "sadotsoy/dark-present.nvim",
		dir = "~/workspace/personal/dark-present.nvim/",
	},
	{
		-- Make sure to set this up properly if you have lazy=true
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			file_types = { "markdown", "Avante" },
		},
		ft = { "markdown", "Avante" },
	},
}
