local utils = require("util.editor")

return {
	{
		-- Neovim plugin to manage the file system and other tree like structures.
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		opts = {
			sources = { "filesystem", "buffers", "git_status" },
			open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
			filesystem = {
				filtered_items = {
					visible = false, -- when true, they will just be displayed differently than normal items
					hide_dotfiles = false,
					hide_gitignored = true,
					-- hide_hidden = true,   -- only works on Windows for hidden files/directories
					hide_by_name = {
						"node_modules",
					},
				},
				bind_to_cwd = false,
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
			window = {
				position = "left",
				width = 40,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
				mappings = {
					["l"] = "open",
					["h"] = "close_node",
					["<space>"] = "none",
					["Y"] = {
						function(state)
							local node = state.tree:get_node()
							local path = node:get_id()
							vim.fn.setreg("+", path, "c")
						end,
						desc = "[Y] Copy path to Clipboard",
					},
					["P"] = { "toggle_preview", config = { use_float = false } },
				},
			},
		},
		keys = keys.neotree,
	},
	{
		-- Improved fzf.vim written in lua
		"ibhagwan/fzf-lua",
		-- optional for icon support
		-- dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({})
		end,
		keys = keys.fzflua,
	},
	{
		-- Find And Replace plugin for neovim
		"MagicDuck/grug-far.nvim",
		opts = { headerMaxWidth = 80 },
		cmd = "GrugFar",
		keys = keys.grugfar,
	},
	{
		-- Navigate your code with search labels, enhanced character motions and Treesitter integration
		"folke/flash.nvim",
		event = "VeryLazy",
		vscode = true,
		---@type Flash.Config
		opts = {},
    -- stylua: ignore
    keys = keys.flash,
	},
	{
		-- 💥 Create key bindings that stick. WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type.
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			icons = {
				mappings = false,
			},
		},
		keys = keys.wichkey,
	},
	{
		-- Git integration for buffers
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			signs_staged = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
			},
			on_attach = utils.on_attach_git_signs,
		},
	},
	{
		"gitsigns.nvim",
		opts = function()
			Snacks.toggle({
				name = "Git Signs",
				get = function()
					return require("gitsigns.config").config.signcolumn
				end,
				set = function(state)
					require("gitsigns").toggle_signs(state)
				end,
			}):map("<leader>uG")
		end,
	},
	{
		-- ✅ Highlight, list and search todo comments in your projects
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = "VeryLazy",
		opts = {},
		keys = keys.todocomment,
	},
	{
		-- Not UFO in the sky, but an ultra fold in Neovim.
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		opts = {},
	},
	{
		-- The fastest Neovim colorizer.
		"norcalli/nvim-colorizer.lua",
		opts = {},
		config = function()
			require("colorizer").setup()
		end,
	},
}
