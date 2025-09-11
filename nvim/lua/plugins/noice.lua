return {
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        progress = {
          -- Added this because Roslyn doesn't send token in the progress.
          enabled = false,
        },
      },
    },
  },
}
