return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "phpactor",
      "cspell",
      "csharpier",
      "netcoredbg",
    },
    registries = {
      "github:mason-org/mason-registry",
      "github:crashdummyy/mason-registry",
      "php-debug-adapter",
    },
  },
}
