return {
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        tailwindcss = {
          filetypes_exclude = { "css", "sass", "php" },
        },
      },
      diagnostics = {
        virtual_text = {
          severity = { min = vim.diagnostic.severity.ERROR },
        },
        signs = {
          severity = { min = vim.diagnostic.severity.WARN },
        },
        underline = true, -- underline diagnostics (all severities)
      },
    },
  },
}
