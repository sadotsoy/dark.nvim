local M = {}
local keymap = require("util.maps").keymap

function M.on_attach_git_signs(buffer)
  local gs = package.loaded.gitsigns

  keymap("n", "]h", function()
    if vim.wo.diff then
      vim.cmd.normal({ "]c", bang = true })
    else
      gs.nav_hunk("next")
    end
  end, { desc = "Next Hunk", buffer = buffer })
  keymap("n", "[h", function()
    if vim.wo.diff then
      vim.cmd.normal({ "[c", bang = true })
    else
      gs.nav_hunk("prev")
    end
  end, { desc = "Prev Hunk", buffer = buffer })
  keymap("n", "]H", function()
    gs.nav_hunk("last")
  end, { desc = "Last Hunk", buffer = buffer })
  keymap("n", "[H", function()
    gs.nav_hunk("first")
  end, { desc = "First Hunk", buffer = buffer })
  keymap({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", { desc = "hunk stage", buffer = buffer })
  keymap({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "hunk reset", buffer = buffer })
  keymap("n", "<leader>ghS", gs.stage_buffer, { desc = "Stage Buffer", buffer = buffer })
  keymap("n", "<leader>ghu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk", buffer = buffer })
  keymap("n", "<leader>ghR", gs.reset_buffer, { desc = "Reset Buffer", buffer = buffer })
  keymap("n", "<leader>ghp", gs.preview_hunk_inline, { desc = "preview Hunk Inline", buffer = buffer })
  keymap("n", "<leader>ghb", function()
    gs.blame_line({ full = true })
  end, { desc = "blame Line", buffer = buffer })
  keymap("n", "<leader>ghB", function()
    gs.blame()
  end, { desc = "blame Buffer", buffer = buffer })
  keymap("n", "<leader>ghd", gs.diffthis, { desc = "diff This", buffer = buffer })
  keymap("n", "<leader>ghD", function()
    gs.diffthis("~")
  end, { desc = "Diff This ~", buffer = buffer })
  keymap({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "GitSigns Select Hunk", buffer = buffer })
end

return M
