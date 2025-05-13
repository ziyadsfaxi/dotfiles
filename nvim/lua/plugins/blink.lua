return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      default = { "copilot" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          kind = "Copilot",
          score_offset = -1,
          async = true,
        },
      },
    },
  },
}
