return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "phpactor",
      "cspell",
      "php-debug-adapter",
      "roslyn",
      "csharpier",
      "html-lsp",
    },
    registries = {
      "github:mason-org/mason-registry",
      "github:crashdummyy/mason-registry",
    },
  },
}
