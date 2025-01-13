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
	map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "hunk stage")
	map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "hunk reset")
	map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
	map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
	map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
	map("n", "<leader>ghp", gs.preview_hunk_inline, "preview Hunk Inline")
	map("n", "<leader>ghb", function()
		gs.blame_line({ full = true })
	end, "blame Line")
	map("n", "<leader>ghB", function()
		gs.blame()
	end, "blame Buffer")
	map("n", "<leader>ghd", gs.diffthis, "diff This")
	map("n", "<leader>ghD", function()
		gs.diffthis("~")
	end, "Diff This ~")
	map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
end

return M
