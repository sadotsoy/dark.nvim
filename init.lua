--
-- NVIM CONFIGS
-- AUTHOR: sadotsoy
--

-- Global keys for plugins
_G.keys = require("config/keys")

-- PLUGIN MANAGER
require("config.lazy")

-- Keymaps
require("keymaps")

-- AutoCmd
require('config.autocmd')

-- Set colorscheme
-- colorschemes
-- + DARK
-- ++ catppuccin, cyberdream, kanagawa
-- + LIGHT
-- ++ yui
vim.cmd.colorscheme("kanagawa")
