return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "phpactor",
      "cspell",
      "csharpier",
      "php-debug-adapter",
      "roslyn",
    },
    registries = {
      "github:mason-org/mason-registry",
      "github:crashdummyy/mason-registry",
    },
  },
}
