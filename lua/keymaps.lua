-- See `:help vim.keymap.set()`

-- files
vim.keymap.set("n", "QQ", "<cmd>q!<cr>", { noremap = false })
vim.keymap.set("n", "WW", "<cmd>w!<cr>", { silent = true })
vim.keymap.set("n", "E", "$", { noremap = false })
vim.keymap.set("n", "B", "^", { noremap = false })
vim.keymap.set("n", "ss", "<cmd>noh<CR>", { noremap = true })
--
-- plugin manager
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { silent = true, desc = "Open Lazy" })
--
-- splits when am lazyyy
vim.keymap.set("n", "vv", "<c-w>v", { silent = true, desc = "Vertical split" })
vim.keymap.set("n", "vn", "<c-w>n", { silent = true, desc = "Horizontal split" })
-- --- close
vim.keymap.set("n", "qq", "<cmd>q<CR>", { silent = true, noremap = true, desc = "Close split" })
-- only
vim.keymap.set("n", "<leader>o", "<cmd>:only<CR>", { silent = true, noremap = true, desc = "Only" })
-- --- move
vim.keymap.set("n", "<leader>vl", "<c-w>l", { silent = true, noremap = true, desc = "Go right" })
vim.keymap.set("n", "<leader>vh", "<c-w>j", { silent = true, noremap = true, desc = "Go left" })
vim.keymap.set("n", "<leader>vj", "<c-w>h", { silent = true, noremap = true, desc = "Go bottom" })
vim.keymap.set("n", "<leader>vk", "<c-w>k", { silent = true, noremap = true, desc = "Go up" })
-- --- resize
vim.keymap.set("n", "<C-W>,", "<cmd>vertical resize -10<CR>", { noremap = true })
vim.keymap.set("n", "<C-W>.", "<cmd>vertical resize +10<CR>", { noremap = true })
--
-- -- nop
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
--
-- -- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
--
-- --- Tabs
vim.keymap.set({ "n" }, "<leader>t", ":tabnew<cr>", { silent = true })
vim.keymap.set({ "n" }, "<leader>tc", ":tabclose<cr>", { silent = true })
vim.keymap.set({ "n" }, "<leader>tn", ":tabn<cr>", { silent = true })
vim.keymap.set({ "n" }, "<leader>tp", ":tabp<cr>", { silent = true })
vim.keymap.set({ "n" }, "<leader>tf", ":tabfirst<cr>", { silent = true })
vim.keymap.set({ "n" }, "<leader>tl", ":tablast<cr>", { silent = true })
--
-- others
vim.keymap.set({ "n", "v" }, "<leader>lr", vim.lsp.buf.references, { buffer = true })
