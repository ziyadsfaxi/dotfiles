-- for some reason, snacks keeps overriding this keymap, so we need to set time out
-- vim.defer_fn(function()
--   vim.keymap.set("n", "<leader><space>", function()
--     Snacks.picker.buffers({ sort_lastused = true, current = false })
--   end, { desc = "Buffers" })
-- end, 2000)

return {
  "folke/snacks.nvim",

  opts = {},
  keys = {
    {
      "<leader><space>",
      function()
        Snacks.picker.buffers()
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
      "<leader>,",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Smart Find Files",
    },
  },
}
