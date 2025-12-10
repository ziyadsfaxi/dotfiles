return {
  "stevearc/overseer.nvim",
  ---@module 'overseer'
  ---@type overseer.SetupOpts
  opts = {
    -- disable here to lazyload DAP. it's reenabled in the dap config.
    dap = false,
  },

  config = function(_, opts)
    local overseer = require("overseer")
    require("overseer").setup(opts)
  end,
}
