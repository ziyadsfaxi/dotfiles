return {
  "nvim-neotest/neotest",
  dependencies = {
    "V13Axel/neotest-pest",
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-pest"),
      },
    })
  end,
}
