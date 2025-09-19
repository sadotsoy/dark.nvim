# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a comprehensive Neovim configuration built with Lua, using `lazy.nvim` as the plugin manager. The configuration is modular and focuses on modern development workflows with AI integration.

## Development Commands

### Formatting
```bash
stylua . --config-path stylua.toml  # Format all Lua files
```

### Plugin Management
```bash
nvim                                # Launch Neovim (plugins auto-install via lazy.nvim)
:Lazy                              # Open plugin manager UI
:Lazy update                       # Update all plugins
:Lazy clean                        # Remove unused plugins
```

### Testing Configuration
```bash
nvim --headless +qa               # Test basic startup
nvim -u NONE +qa                  # Test without config
```

## Architecture & Structure
### Core Configuration Files
- `init.lua` - Entry point that sets global variables, loads lazy.nvim, keymaps, and autocmds
- `lua/config/lazy.lua` - Bootstrap lazy.nvim and configure plugin loading
- `lua/config/options.lua` - Global Neovim options and settings
- `lua/config/plugins_keys.lua` - Centralized keymap definitions for all plugins

### Plugin Organization
- `lua/plugins/` - Plugin specifications organized by category:
  - `ai/` - AI-related plugins (copilot, codecompanion, coderclaude, avante)
  - `languages/` - Language-specific configurations
  - Individual files for categories (editor.lua, lsp.lua, git.lua, etc.)
- Core plugins: `snacks.nvim` provides picker, explorer, and various QoL features

### Utility Modules
- `lua/util/` - Helper utilities:
  - `colorscheme/` - Theme customizations
  - `editor.lua`, `lsp.lua`, `maps.lua` - Core functionality helpers
  - `gstore.lua` - Debug utilities for global state

### Key Global Variables
- `_G.keys` - Centralized keymap definitions loaded from `config.plugins_keys`
- `_G.ai_model` - Default AI model setting (currently "gpt-4o")

### Plugin Loading Strategy
The configuration uses lazy.nvim's import system:
1. Main spec imports from `plugins/` directory
2. Subdirectories auto-imported via `plugins/init.lua`
3. AI plugins, languages, and file managers are modular

### AI Integration Architecture
Multiple AI providers are configured:
- **Copilot**: GitHub Copilot integration with chat and suggestions
- **CodeCompanion**: Claude-based coding assistance
- **CoderClaude**: Direct Claude Code integration
- **Avante**: AI-powered code editing and chat interface

All AI keymaps are prefixed with `<leader>a` and defined in the centralized keymap system.

### Keymap System
Centralized in `lua/config/plugins_keys.lua`:
- Plugin-specific keymaps organized by plugin name
- Consistent leader key mappings (`<space>` as leader)
- AI commands under `<leader>a`
- File operations under `<leader>f`
- Git operations under `<leader>g`
- Search operations under `<leader>s`

Main interface provided by Snacks picker:
- `<leader><space>` - Smart file finder
- `<leader>,` - Buffer switcher
- `<leader>/` - Live grep
- `<leader>e` - File explorer

### Theme Configuration
- Default: Catppuccin Mocha
- Alternatives: Kanagawa, Tokyo Night, Yui (light)
- Custom overrides in `util/colorscheme/`
- Set via `vim.cmd.colorscheme('catppuccin')` in init.lua

## Configuration Standards

### Code Style
- Uses stylua for formatting with 2-space indentation
- Single quotes preferred for strings
- 120 character line width
- Sort requires enabled

### Plugin Configuration Pattern
Each plugin file follows this structure:
```lua
return {
  "plugin/name",
  config = function()
    -- plugin setup
  end,
  keys = _G.keys.plugin_name,  -- Reference centralized keymaps
  -- other lazy.nvim options
}
```

### Keymap Definitions
All keymaps use the centralized system with this structure:
```lua
plugin_name = {
  { "key", desc = "Description", function() -- action end },
  -- mode, ft, and other options supported
}
```
