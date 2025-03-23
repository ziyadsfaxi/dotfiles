return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  opts = {
    servers = {
      tailwindcss = {
        filetypes_exclude = { "css", "sass", "php" },
      },

      intelephense = {
        enabled = false,
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
        -- on_attach = function(client, bufnr)
        --   client.server_capabilities.documentFormattingProvider = false
        --   client.server_capabilities.documentRangeFormattingProvider = false
        -- end,
      },

      vtsls = {
        enabled = false,
      },

      ts_ls = {
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = LazyVim.get_pkg_path("vue-language-server", "/node_modules/@vue/language-server"),
              languages = { "vue" },
            },
          },
        },

        settings = {
          typescript = {

            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },

        filetypes = {
          "javascript",
          "typescript",
          "vue",
        },
      },
    },
  },
}
