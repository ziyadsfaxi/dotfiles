return {
  "folke/snacks.nvim",

  opts = {},
  keys = {
    {
      "<leader><space>",
      function()
        Snacks.picker.buffers({ current = false })
      end,
      desc = "Buffers",
    },
    {
      "<leader>sf",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>T",
      function()
        Snacks.terminal.toggle()
      end,
      desc = "Toggle Terminal",
    },
  },
}
