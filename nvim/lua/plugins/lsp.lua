return {
  "neovim/nvim-lspconfig",
  -- event = "VeryLazy",
  opts = {
    servers = {
      tailwindcss = {
        filetypes_exclude = { "css", "sass" },
      },

      intelephense = {
        commands = {
          IntelephenseIndex = {
            function()
              vim.lsp.buf.execute_command({ command = "intelephense.index.workspace" })
            end,
          },
        },
      },

      volar = {
        init_options = {
          vue = {
            hybridMode = true,
          },
        },
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      },

      ts_ls = {
        enabled = false,
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = LazyVim.get_pkg_path("vue-language-server", "/node_modules/@vue/language-server"),
              languages = { "javascript", "typescript", "vue" },
            },
          },
        },
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
          "vue",
        },
      },
    },
  },
}
