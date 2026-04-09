return {
  {
    'coder/claudecode.nvim',
    dependencies = { 'folke/snacks.nvim' },
    -- Default path after `claude migrate-installer`. Remove or set to `which claude` output if you use global npm or native binary.
    opts = {
      terminal_cmd = vim.fn.expand('~/.local/bin/claude'),
    },
    config = true,
    keys = keys.claudecode,
  },
}
