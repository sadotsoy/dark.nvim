---
-- Editor utils
---

local patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" }

local M = {}
function M.get_root_dir()
	local rootdir = vim.fs.dirname(vim.fs.find(patterns, { upward = true })[1])

	return rootdir or vim.uv.cwd()
end

function M.on_attach_git_signs(buffer)
	local gs = package.loaded.gitsigns

	local function map(mode, l, r, desc)
		vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
	end

	map("n", "]h", function()
		if vim.wo.diff then
			vim.cmd.normal({ "]c", bang = true })
		else
			gs.nav_hunk("next")
		end
	end, "Next Hunk")
	map("n", "[h", function()
		if vim.wo.diff then
			vim.cmd.normal({ "[c", bang = true })
		else
			gs.nav_hunk("prev")
		end
	end, "Prev Hunk")
	map("n", "]H", function()
		gs.nav_hunk("last")
	end, "Last Hunk")
	map("n", "[H", function()
		gs.nav_hunk("first")
	end, "First Hunk")
	map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "[h]unk [s]tage")
	map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "[h]unk [r]eset")
	map("n", "<leader>ghS", gs.stage_buffer, "[S]tage Buffer")
	map("n", "<leader>ghu", gs.undo_stage_hunk, "[U]ndo Stage Hunk")
	map("n", "<leader>ghR", gs.reset_buffer, "[R]eset Buffer")
	map("n", "<leader>ghp", gs.preview_hunk_inline, "[p]review Hunk Inline")
	map("n", "<leader>ghb", function()
		gs.blame_line({ full = true })
	end, "[b]lame Line")
	map("n", "<leader>ghB", function()
		gs.blame()
	end, "[b]lame Buffer")
	map("n", "<leader>ghd", gs.diffthis, "[d]iff This")
	map("n", "<leader>ghD", function()
		gs.diffthis("~")
	end, "[D]iff This ~")
	map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
end

return M
