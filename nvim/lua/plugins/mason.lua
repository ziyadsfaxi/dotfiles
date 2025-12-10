return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "phpactor",
      "cspell",
      "php-debug-adapter",
      "roslyn",
      "csharpier",
      "rzls",
      "netcoredbg",
      "html-lsp",
    },
    registries = {
      "github:mason-org/mason-registry",
      "github:crashdummyy/mason-registry",
    },
  },
}
