return {
  "folke/snacks.nvim",

  opts = {
    picker = {
      files = {
        hidden = true,
        git_ignore = true,
        exclude = {
          "vendor",
          "node_modules",
          "dist",
          ".idea",
          "*.lock",
          ".cache",
        },
      },
    },
  },
  keys = {
    {
      "<leader><space>",
      function()
        Snacks.picker.buffers({
          current = false,
          sort_lastused = true,
        })
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
