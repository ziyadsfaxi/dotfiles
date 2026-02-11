return {
  "rest-nvim/rest.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      client = {
        curl = {
          args = { "--insecure" },
        },
      },
    },
    keys = {
      { "<leader>rr", "<cmd>Rest run<cr>", desc = "Run HTTP Request" },
      { "<leader>rl", "<cmd>Rest last<cr>", desc = "Run Last Request" },
    },
  },
}
