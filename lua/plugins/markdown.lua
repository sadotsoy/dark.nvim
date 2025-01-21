return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      require("lazy").load({ plugins = { "markdown-preview.nvim" } })
      vim.fn["mkdp#util#install"]()
    end,
    keys = keys.markdown,
  },
  {
    -- Make sure to set this up properly if you have lazy=true
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      file_types = { "Avante" },
    },
    ft = { "Avante" },
  },
}
