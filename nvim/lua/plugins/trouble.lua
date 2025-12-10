return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    modes = {
      diagnostics = {
        -- Used for rzls.nvim
        filter = function(items)
          return vim.tbl_filter(function(item)
            return not string.match(item.basename, [[%__virtual.cs$]])
          end, items)
        end,
      },
    },
  },
}
