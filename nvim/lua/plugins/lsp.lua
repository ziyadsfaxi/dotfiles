return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  opts = {
    servers = {
      tailwindcss = {
        filetypes_exclude = { "css", "sass", "php" },
      },
    },
  },
}
