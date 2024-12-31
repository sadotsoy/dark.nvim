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
}
