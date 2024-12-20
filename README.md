```lua
----
-- NVIM CONFIGS *`_paa pooossaaaar_`*
---- (Ssdot Soy)
-------
```

# NVIM CONFIG

This configuration utilizes [`lazy.nvim`](https://github.com/folke/lazy.nvim) to manage plugins and
follows the recommended settings from [`LazyVim`](http://www.lazyvim.org/#-learn).

- [Keymaps](#keymaps)
  - [Files](#files)
  - [Splits](#splits)
  - [Folds](#folds)
  - [Tabs](#tabs)
- [UI](#ui)
- [Coding](#coding)
- [LSP](#lsp)
- [Editor](#editor)
- [Linting](#linting)
- [Lang](#lang)
- [Formatting](#formatting)
- [cholorscheme](#colorscheme)
- [todo](#todo)

## Keymaps

- ### Files

  | Keymap | Description | Mode |
  | ------ | ----------- | ---- |
  | `QQ` | close buffer (force!) | `n` |
  | `qq` | close buffer | `n` |
  | `WW` | write buffer | `n` |
  | `E` | go to final `$` | `n` |
  | `B` | go to start `^` | `n` |
  | `ss` | turn off search highlighting | `n` |

- ### Splits

  | Keymap | Description | Mode |
  | ------ | ----------- | ---- |
  | `vv` | Vertical split | `n` |
  | `vn` | Horizontal split | `n` |
  | `<C-l>` | Go to right | `n` |
  | `<C-h>` | Go to left | `n` |
  | `<C-j>` | Go to bottom | `n` |
  | `<C-k>` | Go to up | `n` |
  | `<C-W>.` | Vertical resize +10 | `n` |
  | `<C-W>,` | Vertical resize -10 | `n` |

- ### Folds

  | Keymap | Description | Mode |
  | ------ | ----------- | ---- |
  | `zR` | Open all folds | `n` |
  | `zM` | Close all folds | `n` |

- ### Tabs

  | Keymap | Description | Mode |
  | ------ | ----------- | ---- |
  | `<leader>t` | New tab | `n` |
  | `<leader>tc` | Tab close | `n` |
  | `<leader>tn` | Tab next | `n` |
  | `<leader>tp` | Tab previous | `n` |
  | `<leader>tf` | Tab first | `n` |
  | `<leader>tl` | Tab last | `n` |

## UI

- [Snacks](https://github.com/folke/snacks.nvim) 🍿 A collection of small QoL plugins for Neovim
  - Enabled
    - bigfile
    - debug
    - indent
    - lazygit (needs to be installed on Osystem)
    - notifier
    - quickfile
    - scope
    - statuscolumn
    - words
    - zen

## Coding

- [ts-comments](https://github.com/folke/ts-comments.nvim) To enhance Neovim's native comments.
- [mini.nvim](https://github.com/echasnovski/mini.nvim) Nice collection of plugins
  - [mini.surround](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-surround.md) Fast and feature-rich surround actions
  - [mini.cursorword](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-cursorword.md) Automatic highlighting of word under cursor
  - [mini.pairs](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-pairs.md) Minimal and fast autopairs
- [blink.cmp](https://github.com/Saghen/blink.cmp) Performant, batteries-included completion plugin for Neovim
- [lazydev](https://github.com/folke/lazydev.nvim) LuaLS setup for Neovim

## LSP

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [mason.nvim](https://github.com/williamboman/mason.nvim) Cmdline tools and lsp server

## Editor

- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) Manage the file system and other tree like structures
- [fzf-lua](https://github.com/ibhagwan/fzf-lua)
- [grug-far](https://github.com/MagicDuck/grug-far.nvim) findAn'd reeplace
- [flash](https://github.com/folke/flash.nvim) Navigatee the code with MdaFukkkaa laayeers
- [gitings](https://github.com/lewis6991/gitsigns.nvim)
- [todo-comments](https://github.com/folke/todo-comments.nvim) Higlight, list an search (Todo/Fix/Fixme/Bug/\\etc): comments
- [whichkeys](https://github.com/folke/which-key.nvim) Temporaaal paaa knowwlodgear daaa keybindings

## Linting

- [nvim-lint](https://github.com/mfussenegger/nvim-lint)

## Lang

- **Markdown**
  - [preview](https://github.com/iamcco/markdown-preview.nvim)
- **Kdl**
  - [syntax khlght](https://github.com/imsnif/kdl.vim)

## Formatting

- [conformmmmm](https://github.com/stevearc/conform.nvim)

## Colorscheme

- [catpuccin](https://github.com/catppuccin/nvim)

## Todo

- Keymaps table
