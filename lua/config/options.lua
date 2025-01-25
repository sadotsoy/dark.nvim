local set = vim.o
local opt = vim.opt

-- Search
opt.hlsearch = true -- Set highlight on search
opt.smartcase = true -- Don't ignore case with capitals
opt.ignorecase = true

-- Spelling
opt.spelllang = { "en_us", "es_mx" }

-- Splits
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current

-- INDENT/TABS
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Insert indents automatically
opt.tabstop = 2 -- Number of spaces tabs count for
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.breakindent = true -- Enable break indent
vim.g.markdown_recommended_style = 0 -- Fix markdown indentation settings

-- Line Numbers
vim.wo.number = true
opt.relativenumber = true

-- Undo
opt.undofile = true -- Save undo history
opt.undolevels = 10000

-- Update time
opt.updatetime = 250

-- Sign column
vim.wo.signcolumn = "yes"
opt.signcolumn = "yes" -- Always show the sign column, otherwise it would shift the text each time
-- Reserve space for at least two signs
set.signcolumn = "yes:2"

-- Clipboard
opt.clipboard = "unnamedplus"

-- Write
opt.autowrite = true -- Enable auto write
opt.confirm = true -- Confirm to save changes before exiting modified buffer

-- Conceal level
opt.conceallevel = 2 -- Concealer for Neorg

-- Cursor
vim.o.guicursor = table.concat({
	"n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
	"i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
	"r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100",
}, ",")

-- Fill chars
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

-- Folds
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldcolumn = "1" -- '0' is not bad

-- Grep
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

-- Incremental substitute
opt.inccommand = "nosplit" -- preview incremental substitute

-- Statusline
opt.laststatus = 3 -- global statusline

-- Editing
opt.cursorline = true -- Enable highlighting of the current line
opt.linebreak = true -- Wrap lines at convenient points
opt.list = true -- Show some invisible characters (tabs...
opt.ruler = false -- Disable the default ruler
opt.completeopt = "menu,menuone,noselect,popup"

-- Modes | Cmd
opt.showcmd = false -- hide the cmd
opt.showmode = false -- hide the mode

-- Popup
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup

-- Scroll
opt.scroll = 5
opt.scrolloff = 8 -- Lines of context
opt.sidescrolloff = 8 -- Columns of context

-- Sessions
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

-- Colors
opt.termguicolors = true -- True color support
opt.background = "dark"

-- Mouse
opt.mouse = "n" -- only enable mouse clicks for normal mode

-- Ignore these directories/files while expanding `find` searches
opt.wildignore:append({
  "*.o",
  "*.pyc",
  "*/.git/*",
  "*/node_modules/*",
  "*pycache*",
  "*~",
  "*.gif",
  "*.avi",
  "*.ico",
  "*.jpeg",
  "*.jpg",
  "*.png",
  "*.wav",
})
