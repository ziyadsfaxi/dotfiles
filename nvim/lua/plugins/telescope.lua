local builtin = require("telescope.builtin")
return {
  "nvim-telescope/telescope.nvim",
  enabled = false,
  keys = {
    { "<leader><space>", false },
    { "<leader>sf", builtin.find_files, desc = "Find Files" },

    { "<leader>fb", false },
    {
      "<leader><space>",
      function()
        builtin.buffers({ sort_mru = true, sort_lastused = true, ignore_current_buffer = true })
      end,
      desc = "Find Buffers",
    },
  },

  opts = {
    defaults = {
      hidden = true,
    },
  },
}
