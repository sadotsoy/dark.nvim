local prompts = require("config.prompts")

return {
	---Use your Neovim like using Cursor AI IDE!
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
		opts = {
			---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
			provider = "copilot",
			-- auto_suggestions_provider = "copilot", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
			---@type AvanteSupportedProvider
			copilot = {
				endpoint = "https://api.githubcopilot.com",
				model = "gpt-4o-2024-08-06", -- o1-preview | o1-mini | claude-3.5-sonnet | gpt-4o-2024-08-06
				proxy = nil, -- [protocol://]host[:port] Use this proxy
				allow_insecure = false, -- Allow insecure server connections
				timeout = 30000, -- Timeout in milliseconds
				temperature = 0,
				max_tokens = 4096,
			},
			file_selector = {
				--- @alias FileSelectorProvider "native" | "fzf" | "telescope" | string
				provider = "fzf",
				-- Options override for custom providers
				provider_opts = {},
			},
			behaviour = {
				auto_suggestions = false, -- Experimental stage
				auto_set_highlight_group = true,
				auto_set_keymaps = true,
				auto_apply_diff_after_generation = false,
				support_paste_from_clipboard = false,
				minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
			},
			mappings = {
				--- @class AvanteConflictMappings
				diff = {
					ours = "co",
					theirs = "ct",
					all_theirs = "ca",
					both = "cb",
					cursor = "cc",
					next = "]x",
					prev = "[x",
				},
				suggestion = {
					accept = "<M-l>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
				jump = {
					next = "]]",
					prev = "[[",
				},
				submit = {
					normal = "<CR>",
					insert = "<C-s>",
				},
				sidebar = {
					apply_all = "A",
					apply_cursor = "a",
					switch_windows = "<Tab>",
					reverse_switch_windows = "<S-Tab>",
				},
			},
			hints = { enabled = true },
			windows = {
				---@type "right" | "left" | "top" | "bottom"
				position = "right", -- the position of the sidebar
				wrap = true, -- similar to vim.o.wrap
				width = 30, -- default % based on available width
				sidebar_header = {
					enabled = false, -- true, false to enable/disable the header
					align = "center", -- left, center, right for title
					rounded = true,
				},
				input = {
					prefix = "> ",
					height = 8, -- Height of the input window in vertical layout
				},
				edit = {
					border = "rounded",
					start_insert = true, -- Start insert mode when opening the edit window
				},
				ask = {
					floating = false, -- Open the 'AvanteAsk' prompt in a floating window
					start_insert = true, -- Start insert mode when opening the ask window
					border = "rounded",
					---@type "ours" | "theirs"
					focus_on_apply = "ours", -- which diff to focus after applying
				},
			},
			highlights = {
				---@type AvanteConflictHighlights
				diff = {
					current = "DiffText",
					incoming = "DiffAdd",
				},
			},
			--- @class AvanteConflictUserConfig
			diff = {
				autojump = true,
				---@type string | fun(): any
				list_opener = "copen",
				--- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
				--- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
				--- Disable by setting to -1.
				override_timeoutlen = 500,
			},
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"echasnovski/mini.icons", -- or echasnovski/mini.icons
			{ "github/copilot.vim", enabled = false }, -- or zbirenbaum/copilot.lua
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
		},
		keys = keys.avante,
	},
	-- Copilot Chat plugin configuration
	{
		"CopilotC-Nvim/CopilotChat.nvim", -- Load the Copilot Chat plugin
		-- branch = "canary", -- Use the 'canary' branch
		build = "make tiktoken", -- Only on MacOS or Linux
		dependencies = {
			{ "github/copilot.vim", enabled = false }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim" }, -- for curl, log and async functions
		},
		opts = {
			chat_auto_complete = true,
			model = "gpt-4o-2024-08-06", -- o1-preview | o1-mini | claude-3.5-sonnet | gpt-4o-2024-08-06
			question_header = "## User ", -- Header for user questions
			answer_header = "## Copilot ", -- Header for Copilot answers
			error_header = "## Error ", -- Header for errors
			prompts = prompts, -- Use the defined prompts
			auto_follow_cursor = false, -- Disable auto-follow cursor
			show_help = false, -- Disable showing help by default
			mappings = {
				complete = { detail = "Use @<Tab> or /<Tab> for options.", insert = "<Tab>" }, -- Keybinding for completion
				close = { normal = "q", insert = "<C-c>" }, -- Keybinding to close chat
				reset = { normal = "<C-x>", insert = "<C-x>" }, -- Keybinding to reset chat
				submit_prompt = { normal = "<CR>", insert = "<C-CR>" }, -- Keybinding to submit prompt
				accept_diff = { normal = "<C-y>", insert = "<C-y>" }, -- Keybinding to accept diff
				yank_diff = { normal = "gmy" }, -- Keybinding to yank diff
				show_diff = { normal = "gmd" }, -- Keybinding to show diff
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
