return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      vue = { "prettier" },
      php = { "pint" },
      javascript = { "eslint_d", stop_after_first = true },
      typescript = { "eslint_d", stop_after_first = true },
      typescriptreact = { "eslint_d", stop_after_first = true },
    },
  },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      desc = "Format Buffer",
    },
  },
}
