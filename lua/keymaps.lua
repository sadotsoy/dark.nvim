-- See `:help vim.keymap.set()`

local keymap = vim.keymap.set

-- files
keymap("n", "QQ", "<cmd>q!<cr>", { noremap = false })
keymap("n", "WW", "<cmd>w!<cr>", { silent = true })
keymap("n", "E", "$", { noremap = false })
keymap("n", "B", "^", { noremap = false })
keymap("n", "ss", "<cmd>noh<CR>", { noremap = true })
--
-- plugin manager
keymap("n", "<leader>l", "<cmd>Lazy<CR>", { silent = true, desc = "Open Lazy" })
--
-- splits when am lazyyy
keymap("n", "vv", "<c-w>v", { silent = true, desc = "Vertical split" })
keymap("n", "vn", "<c-w>n", { silent = true, desc = "Horizontal split" })
-- --- close
keymap("n", "qq", "<cmd>q<CR>", { silent = true, noremap = true, desc = "Close split" })
-- only
keymap("n", "<leader>o", "<cmd>:only<CR>", { silent = true, noremap = true, desc = "Only" })
-- --- move
keymap("n", "<leader>vl", "<c-w>l", { silent = true, noremap = true, desc = "Go right" })
keymap("n", "<leader>vh", "<c-w>j", { silent = true, noremap = true, desc = "Go left" })
keymap("n", "<leader>vj", "<c-w>h", { silent = true, noremap = true, desc = "Go bottom" })
keymap("n", "<leader>vk", "<c-w>k", { silent = true, noremap = true, desc = "Go up" })
-- --- resize
keymap("n", "<C-W>,", "<cmd>vertical resize -10<CR>", { noremap = true })
keymap("n", "<C-W>.", "<cmd>vertical resize +10<CR>", { noremap = true })
--
-- -- nop
keymap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
--
-- -- Remap for dealing with word wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
--
-- --- Tabs
keymap({ "n" }, "<leader>t", ":tabnew<cr>", { silent = true })
keymap({ "n" }, "<leader>tc", ":tabclose<cr>", { silent = true })
keymap({ "n" }, "<leader>tn", ":tabn<cr>", { silent = true })
keymap({ "n" }, "<leader>tp", ":tabp<cr>", { silent = true })
keymap({ "n" }, "<leader>tf", ":tabfirst<cr>", { silent = true })
keymap({ "n" }, "<leader>tl", ":tablast<cr>", { silent = true })
--
-- others
keymap({ "n", "v" }, "<leader>lr", vim.lsp.buf.references, { buffer = true })
