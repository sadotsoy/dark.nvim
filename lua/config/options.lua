-- Shortcut for vim global option
local opt = vim.opt

vim.g.markdown_recommended_style = 0 -- Fix markdown indentation settings

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

local global_options = {
  -- Search
  hlsearch       = true,
  smartcase      = true,
  ignorecase     = true,
  -- Spelling
  spelllang      = { "en_us", "es_mx" },
  -- Splits
  splitbelow     = true, -- Put new windows below current
  splitkeep      = "screen",
  splitright     = true, -- Put new window right of current
  -- Indent / Tabs
  expandtab      = true, -- Use spaces instead of tabs
  smartindent    = true, -- Insert indents automatically
  tabstop        = 2,    -- Number of spaces tabs count stop
  shiftround     = true, -- Round indent
  shiftwidth     = 2,    -- Size of an indent
  breakindent    = true, -- Enable break indent
  -- Line numbers
  number         = true,
  relativenumber = true,
  -- Undo
  undofile       = true, -- Save undo history
  undolevels     = 10000,
  -- Update time
  updatetime     = 250,
  -- Sign column
  signcolumn     = "yes:2", -- Reserve space for at least two signs
  -- Clipboard
  clipboard      = "unnamedplus",
  -- Write
  autowrite      = true, -- Enable auto write
  confirm        = true, -- Confirm to save changes before existing modified buffer
  -- Conceal level
  conceallevel   = 2,    -- Concealer for Neorg
  -- Cursor
  guicursor      = table.concat({
    "n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
    "i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
    "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100",
  }, ","),
  -- Fill chars
  fillchars      = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
  },
  -- Folds
  foldlevel      = 99,
  foldlevelstart = 99,
  foldenable     = true,
  foldcolumn     = "1", -- `0` is not bad
  -- Grep
  grepformat     = "%f:%l:%c:%m",
  grepprg        = "rg --vimgrep",
  -- Incremental substitute
  inccommand     = "nosplit", -- preview incremental substitute
  -- Statusline
  laststatus     = 3,         -- global Statusline
  -- Editing
  cursorline     = true,      -- Enable highlighting of the current line
  linebreak      = true,      -- Wrap lines at convenient points
  list           = true,      -- Show some invisible characters (tabs..
  ruler          = false,     -- Disable the deault ruler
  completeopt    = "menu,menuone,noselect,popup",
  -- Modes / Cmd
  showcmd        = false, -- hide the cmd
  showmode       = false, -- hide the mode
  -- Popup
  pumblend       = 10,    -- Popup blend
  pumheight      = 10,    -- Maximum number of entries in a popup
  -- Scroll
  scroll         = 5,
  scrolloff      = 8, -- Lines of context
  sidescrolloff  = 8, -- Columns of context
  -- Sessions
  sessionoptions = {
    "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds",
  },
  -- Colors
  termguicolors  = true, -- True color support
  background     = "dark",
  -- Mouse
  mouse          = "n", -- Only enable mouse clicks for normal mode
}

-- Set each option
for option, value in pairs(global_options) do
  opt[option] = value
end
