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

-- Set colorscheme
-- colorschemes
-- + DARK
-- ++ catppuccin
-- + LIGHT
-- ++ yui
vim.cmd.colorscheme("catppuccin")
