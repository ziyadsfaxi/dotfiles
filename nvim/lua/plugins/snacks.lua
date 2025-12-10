return {
  "folke/snacks.nvim",

  opts = {
    picker = {
      files = {
        hidden = true,
        exclude = {
          "vendor",
          "node_modules",
          "dist",
          ".idea",
          "*.lock",
          ".cache",
        },
      },
      sources = {
        explorer = {
          hidden = true,
          git_ignore = true,
          exclude = {
            "**/*__virtual.cs",
          },
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
