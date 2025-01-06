return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			-- latte, frappe, macchiato, mocha
			flavour = "mocha",
			transparent_background = true,
		},
		integrations = {
			cmp = true, -- Enable integration with nvim-cmp
			gitsigns = true, -- Enable integration with gitsigns
			nvimtree = true, -- Enable integration with nvim-tree
			treesitter = true, -- Enable integration with treesitter
			notify = false, -- Disable integration with nvim-notify
			mini = {
				enabled = true, -- Enable mini plugin integration
				indentscope_color = "", -- Set indentscope color (empty means default)
			},
			-- Additional plugin integrations can be found in the documentation
		},
	},
	{
		"cideM/yui",
		name = "yui",
		priority = 1000,
		config = function()
			vim.g.yui_line_numbers = "fade" -- "fade", "emphasize"
			vim.g.yui_comments = "bg" -- "bg", "emphasize", "fade", "normal"
			vim.g.yui_folds = "emphasize" -- "emphasize", "fade"
		end,
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			italic_comments = true,
			theme = {
				variant = "dark",
			},
		},
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("kanagawa").setup({
				-- `wave` the default heart-warming theme,
				-- `dragon` for those late-night sessions
				-- `lotus` for when you're out in the open.
				theme = "wave",
				background = {
					dark = "wave",
					light = "lotus",
				},
				transparent = true,
				commentStyle = {
					italic = true,
				},
			})
		end,
	},
}
