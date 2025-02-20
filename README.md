```lua
----
-- NVIM CONFIGS *`_paa pooossaaaar_`*
---- (Ssdot Soy)
-------
```

# NVIM CONFIG

This configuration utilizes [`lazy.nvim`](https://github.com/folke/lazy.nvim) to manage the plugins and keymaps. The configuration is written in lua and is organized in a modular way.

## [Keymaps](#keymaps)

- [Files](#files)

  - [FileNavigation](#file-navigation)
  - [Splits](#splits)
  - [FileResize](#file-resize)
  - [Folds](#folds)
  - [Tabs](#tabs)
  - [Marks](#marks)

- [Coding Keymaps](#coding-keymaps)

  - [Lua](#lua-keymaps)
  - [JS,TS](#js-keymaps)

- [Plugins Keymaps](#plugins-keymaps)

  - [Snacks](#snacks)
  - [Git](#git)
  - [Treesitter](#treesitter)
  - [mason](#mason)
  - [Neotree](#neotree)
  - [fzf](#fzf)
  - [grugfar](#grugfar)
  - [flash](#flash)
  - [todocomment](#todocomment)
  - [markdown](#markdown)
  - [lsp](#lsp-keymaps)
  - [Lazy Nvim](#lazy-nvim)
  - [whichkey](#which-key)
  - [Neo gen](#neo-gen)
  - [Conform](#conform)
  - [Oil](#oil)
  - [Copilot](#copilot)

- [Plugins](#plugins)

  - [UI](#ui)
  - [Coding](#coding)
  - [LSP](#lsp)
  - [Editor](#editor)
  - [Linting](#linting)
  - [Lang](#lang)
  - [Formatting](#formatting)
  - [cholorscheme](#colorscheme)
  - [todo](#todo)
  - [Git](#git-pugins)

## Keymaps

### Files

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `QQ` | close buffer (force!) | `n` |
| `WW` | write buffer | `n` |
| `E` | go to final `$` | `n` |
| `B` | go to start `^` | `n` |
| `ss` | turn off search highlighting | `n` |
| `<leader>o` | Only file | `n` |

</details>

### File Navigation

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `]]` | Next reference | `n` |
| `[[` | Prev reference | `n` |

</details>

### Splits

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `vv` | Vertical split | `n` |
| `vn` | Horizontal split | `n` |

</details>

### File Resize

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `<Left>` | Vertical resize -10 | `n` |
| `<Right>` | Vertical resize +10 | `n` |

</details>

### Folds

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `zR` | Open all folds | `n` |
| `zM` | Close all folds | `n` |

</details>

### Tabs

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `<leader>t` | New tab | `n` |
| `<leader>tc` | Tab close | `n` |
| `<leader>tn` | Tab next | `n` |
| `<leader>tp` | Tab prev | `n` |
| `<leader>tf` | Tab first | `n` |
| `<leader>tl` | Tab last | `n` |

</details>

### Marks

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `dm{key}` | Delete mark {key} | `n` |

</details>

## Coding Keymaps

### Lua Keymaps

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `<leader>x` | Execute current lua line | `n` |
| `<leader><leader>x` | Execute the current file | `n` |

</details>

### TS Keymaps

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `<leader>ci` | Add missing imports | `n` |
| `<leader>cx` | Remove unused imports | `n` |

</details>

## Plugins Keymaps

### Snacks

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `<leader>z` | Toggle zen mode | `n` |
| `<leader>Z` | Toggle zen Zoom | `n` |
| `<leader>.` | Toggle scratch buffer | `n` |
| `<leader>S` | Select scratch buffer | `n` |
| `<leader>n` | Notification history | `n` |
| `<leader>cd` | Run debug (lua) | `n` |
| `<leader>bd` | Buff delete | `n` |
| `<leader>rF` | Rename file | `n` |
| `<leader>un` | Notification hide | `n` |
| `<c-t>` | Toggle terminal | `n` |
| `<leader>N` | Neovim news | `n` |

</details>

### Git

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `<leader>gB` | Git browse | `n` |
| `<leader>gb` | Git blame line | `n` |
| `<leader>gf` | Git file history | `n` |
| `<leader>gu` | Git ui (lazygit) | `n` |
| `<leader>gl` | Git log file | `n` |
| `<leader>gc` | Git commits | `n` |
| `<leader>gs` | Git status | `n` |
| `<leader>gvd` | Git diff vertical split | `n` |
| `<leader>gd` | Git diff | `n` |

</details>

### Treesitter

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `<c-space>` | Increment selection | `n` |
| `<bs>` | Decrement selection | `n` |

</details>

### Mason

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `<leader>cm` | Open mason | `n` |

</details>

### Neotree

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `<leader>ee` | Explorer (root) | `n` |
| `<leader>ef` | Explorer (cwd) | `n` |

</details>

### Fzf

<details>
<summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `<leader>,` | Switch buffer | `n` |
| `<leader>/` | Live grep | `n` |
| `<leader>:` | Command history | `n` |
| --- Finds --- | | |
| `<leader>e` | Find files (root) | `n` |
| `<leader>fF` | Find files (cwd) | `n` |
| `<leader>fg` | Find git files | `n` |
| `<leader>fr` | Find recent files | `n` |
| --- Searchs --- | | |
| `<leader>s"` | Search recent files | `n` |
| `<leader>sa` | Search autocmds | `n` |
| `<leader>sb` | Search grep current buffer | `n` |
| `<leader>sC` | Search commands | `n` |
| `<leader>sd` | Search document diagnostics | `n` |
| `<leader>sD` | Search diagnostics workspace | `n` |
| `<leader>sh` | Search help spaces | `n` |
| `<leader>sH` | Search highlight groups | `n` |
| `<leader>sj` | Search jumps | `n` |
| `<leader>sk` | Search keymaps | `n` |
| `<leader>sl` | Search loclist | `n` |
| `<leader>sM` | Search man pages | `n` |
| `<leader>sm` | Search marks | `n` |
| `<leader>sR` | Search resume | `n` |
| `<leader>sq` | Search quickfix | `n` |

</details>

### Grugfar

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `<leader>sr` | Search and replace | `n`, `v` |

</details>

### Flash

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `s` | Search label | `n`, `x`, `o` |
| `S` | Flash Treesitter | `n`, `x`, `o` |
| `r` | Remote flash | `o` |
| `R` | Tresitter search | `o`, `x` |
| `<c-s>` | Toggle flash search | `c` |

</details>

### Todocomment

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `]t` | Next todo comment | `n` |
| `[t` | Prev todo comment | `n` |
| `<leader>st` | Search todos | `n` |
| `<leader>sT` | Search Todo,FIX,FIXME and bug | `n` |

</details>

### Markdown

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `<leader>cx` | Toggle markdown preview | `n`, `v` |

</details>

### Lsp keymaps

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `<leader>rn` | Rename buffer | `n` |
| `<leader>ca` | Code action | `n` |
| `K` | Hover documentation | `n` |
| `<C-k>` | Signature documentation | `n` |
| `gd` | Go to definition | `n` |
| `gD` | Go to declaration | `n` |
| `gI` | Go to implementation | `n` |
| `<leader>D` | Type definition | `n` |
| --- Folders --- | | |
| `<leader>wa` | Workspace add | `n` |
| `<leader>wr` | Workspace remove | `n` |
| `<leader>wl` | Workspace list folder | `n` |
| --- Diagnostics --- | | |
| `<leader>cl` | Code line diagnostic | `n` |
| `]d` | Next diagnostic | `n` |
| `[d` | Prev diagnostic | `n` |
| `]e` | Next error | `n` |
| `[e` | Prev error | `n` |
| `]w` | Next warning | `n` |
| `[w` | Prev warning | `n` |

</details>

### Lazy Nvim

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `<leader>l` | Open Lazy | `n` |

</details>

### Which key

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `<leader>?` | Buffer local keymaps | `n` |

</details>

### Neo gen

<details>
<summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `<leader>cn` | Generate annotations | `n` |

</details>

### Conform

<details>
<summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `<leader>cf` | Format buffer | `all` |

</details>

### Oil

<details>

<summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `-` | Open parent directory | |
| `<space>-` | Open parent floating window | |

</details>

### Copilot

<details>
  <summary>Keymaps</summary>

| Keymap | Description | Mode |
| ------ | ----------- | ---- |
| `<leader>ah` | Help actions | |
| `<leader>ap` | Prompt actions | |
| `<leader>ae` | Explain code | |
| `<leader>at` | Generate tests | |
| `<leader>ar` | Review code | |
| `<leader>aR` | Refactor code | |
| `<leader>an` | Better naming | |
| `<leader>ad` | Debug info | |
| `<leader>af` | Fix diagnostic | |
| `<leader>a?` | Select models | |
| `<leader>av` | Toggle Copilot chat | |
| `<leader>ax` | Inline chat | |
| `<leader>ai` | Ask input | |
| `<leader>am` | Generate commit message from staged | |
| `<leader>aq` | Quick chat | |

</details>

## Plugins

### UI

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

### Coding

- [ts-comments](https://github.com/folke/ts-comments.nvim) To enhance Neovim's native comments.
- [blink.cmp](https://github.com/Saghen/blink.cmp) Performant, batteries-included completion plugin for Neovim
- [lazydev](https://github.com/folke/lazydev.nvim) LuaLS setup for Neovim

### LSP

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [mason.nvim](https://github.com/williamboman/mason.nvim) Cmdline tools and lsp server

### Editor

- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) Manage the file system and other tree like structures
- [fzf-lua](https://github.com/ibhagwan/fzf-lua)
- [grug-far](https://github.com/MagicDuck/grug-far.nvim) findAn'd reeplace
- [flash](https://github.com/folke/flash.nvim) Navigatee the code with MdaFukkkaa laayeers
- [gitings](https://github.com/lewis6991/gitsigns.nvim)
- [todo-comments](https://github.com/folke/todo-comments.nvim) Higlight, list an search (Todo/Fix/Fixme/Bug/\\etc): comments
- [whichkeys](https://github.com/folke/which-key.nvim) Temporaaal paaa knowwlodgear daaa keybindings

### Linting

- [nvim-lint](https://github.com/mfussenegger/nvim-lint)

### Lang

- **Markdown**
  - [preview](https://github.com/iamcco/markdown-preview.nvim)
- **Kdl**
  - [syntax khlght](https://github.com/imsnif/kdl.vim)

### Colorscheme

- [catpuccin](https://github.com/catppuccin/nvim)

### Todo

- Keymaps table

### Git Pugins

- [Fugitive](https://github.com/tpope/vim-fugitive)
- [Diffview](https://github.com/sindrets/diffview.nvim)
