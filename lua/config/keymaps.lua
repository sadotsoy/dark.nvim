local keymap = require("util.maps").keymap
local api = vim.api

-- files
keymap("n", "QQ", "<cmd>q<cr>", { noremap = false })
keymap("n", "WW", "<cmd>w!<cr>", { silent = true })

-- Join lines without losing cursor position
keymap("n", "J", "mjJ`j")

-- Alternative way to save and exit in Normal mode.
-- NOTE: Adding `redraw` helps with `cmdheight=0` if buffer is not modified
keymap("n", "<C-S>", "<Cmd>silent! update | redraw<CR>", { desc = "Save" })
keymap({ "i", "x" }, "<C-S>", "<Esc><Cmd>silent! update | redraw<CR>", { desc = "Save and go to Normal mode" })
keymap("n", "E", "$", { noremap = false })
keymap("n", "B", "^", { noremap = false })

-- keymap("n", "SS", "<cmd>noh<CR>", { noremap = true })
-- - Condition on `v:count == 0` to allow easier use of relative line numbers.
keymap({ "n", "x" }, "j", [[v:count == 0 ? 'gj' : 'j']], { expr = true })
keymap({ "n", "x" }, "k", [[v:count == 0 ? 'gk' : 'k']], { expr = true })

-- Copy/paste with system clipboard
keymap({ "n", "x" }, "gy", '"+y', { desc = "Copy to system clipboard" })
keymap("n", "gp", '"+p', { desc = "Paste from system clipboard" })
-- - Paste in Visual with `P` to not copy selected text (`:h v_P`)
keymap("x", "gp", '"+P', { desc = "Paste from system clipboard" })
-- Reselect latest changed, put, or yanked text
keymap(
  "n",
  "gV",
  '"`[" . strpart(getregtype(), 0, 1) . "`]"',
  { expr = true, replace_keycodes = false, desc = "Visually select changed text" }
)

-- Search inside visually highlighted text. Use `silent = false` for it to
-- make effect immediately.
keymap("x", "g/", "<esc>/\\%V", { silent = false, desc = "Search inside visual selection" })

-- Marks
keymap("n", "dm", function()
  local key = vim.fn.getchar()
  local mark = vim.fn.nr2char(key)
  api.nvim_buf_del_mark(0, mark)
end, { noremap = false, desc = "delete mark" })

-- only
keymap("n", "<leader>o", "<cmd>:only<CR>", { silent = true, noremap = true, desc = "Only" })

-- plugin manager
keymap("n", "<leader>l", "<cmd>Lazy<CR>", { silent = true, desc = "Open Lazy" })

-- splits when am lazyyy
keymap("n", "vv", "<c-w>v", { silent = true, desc = "Vertical split" })
keymap("n", "vn", "<c-w>n", { silent = true, desc = "Horizontal split" })

-- --- resize
-- Window resize (respecting `v:count`)
keymap(
  "n",
  "<Left>",
  '"<Cmd>vertical resize -" . v:count1 . "<CR>"',
  { expr = true, replace_keycodes = false, desc = "Decrease window width" }
)
keymap(
  "n",
  "<Down>",
  '"<Cmd>resize -"          . v:count1 . "<CR>"',
  { expr = true, replace_keycodes = false, desc = "Decrease window height" }
)
keymap(
  "n",
  "<Up>",
  '"<Cmd>resize +"          . v:count1 . "<CR>"',
  { expr = true, replace_keycodes = false, desc = "Increase window height" }
)
keymap(
  "n",
  "<Right>",
  '"<Cmd>vertical resize +" . v:count1 . "<CR>"',
  { expr = true, replace_keycodes = false, desc = "Increase window width" }
)

-- -- nop
keymap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- -- folds
-- Using ufo provider need remap `zR` and `zM`.
keymap("n", "zR", require("ufo").openAllFolds)
keymap("n", "zM", require("ufo").closeAllFolds)

-- -- Remap for dealing with word wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- --- Tabs
keymap({ "n" }, "<leader>tt", ":tabnew<cr>", { silent = true })
keymap({ "n" }, "<leader>tc", ":tabclose<cr>", { silent = true })
keymap({ "n" }, "<leader>tn", ":tabn<cr>", { silent = true })
keymap({ "n" }, "<leader>tp", ":tabp<cr>", { silent = true })
keymap({ "n" }, "<leader>tf", ":tabfirst<cr>", { silent = true })
keymap({ "n" }, "<leader>tl", ":tablast<cr>", { silent = true })

-- store
keymap("n", "<leader>ss", function()
  require("util/gstore").get_store()
end, { desc = "Print _G" })

-- lua
keymap("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute current line" })
keymap("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

-- GIT
keymap("n", "<leader>gvd", "<cmd>Gvdiffsplit<CR>", { desc = "Git: Diff split" })
keymap("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Git: Diff" })

---CODE
-- copy relative path
keymap("n", "<leader>cp", "<cmd>let @+ = expand('%')<cr>", { desc = "Copy: relative path" })
