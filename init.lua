--
-- NVIM CONFIGS
-- AUTHOR: sadotsoy
--

-- Global keys for plugins
_G.keys = require('config.plugins_keys')

-- `claude-3.7-sonnet`, `gpt-4o`, ``
_G.ai_model = "gpt-4o"

-- PLUGIN MANAGER
require('config.lazy')

-- Keymaps
require('config.keymaps')

-- AutoCmd
require('config.autocmd.init')

-- Set colorscheme
-- colorschemes
-- + DARK
-- ++ catppuccin, cyberdream, kanagawa, tokyonight
-- + LIGHT
-- ++ yui
vim.cmd.colorscheme('catppuccin')
