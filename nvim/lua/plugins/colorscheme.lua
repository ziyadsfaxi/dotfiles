return {
  {
    "loctvl842/monokai-pro.nvim",
    opts = {
      override = function(c)
        return {
          NonText = { fg = "#696D77" },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro-octagon",
    },
  },
}
