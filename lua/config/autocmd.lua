local api = vim.api

-- Highlight text on yank
api.nvim_create_autocmd("TextYankPost", {
	group = api.nvim_create_augroup("highlight_yank", {}),
	desc = "Highlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 123 })
	end,
})
