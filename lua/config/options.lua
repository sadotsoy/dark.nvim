--
-- NVIM OPTIONS
--

local opt = vim.opt

opt.hlsearch = true -- Set highlight on search

-- Make line numbers default
vim.wo.number = true
opt.relativenumber = true

opt.breakindent = true -- Enable break indent

opt.undofile = true -- Save undo history

-- Decrease update time
opt.updatetime = 250
vim.wo.signcolumn = "yes"

opt.clipboard = "unnamedplus" --vim.cmd()

opt.autowrite = true -- Enable auto write
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2 -- Concealer for Neorg
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldcolumn = "1" -- '0' is not bad
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- Wrap lines at convenient points
opt.list = true -- Show some invisible characters (tabs...
opt.showmode = false -- hide the mode
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.ruler = false -- Disable the default ruler
opt.scrolloff = 8 -- Lines of context
opt.sidescrolloff = 8 -- Columns of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en", "es" }
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.undofile = true
opt.undolevels = 10000

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
