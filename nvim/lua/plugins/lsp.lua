return {
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      config = function()
        -- custom highlights
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#ff0000" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#ffaa00" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "#00aaff" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "#00ffaa" })
      end,
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
          severity = { min = vim.diagnostic.severity.ERROR },
        },
        underline = true, -- underline diagnostics (all severities)
      },
    },
  },
}
