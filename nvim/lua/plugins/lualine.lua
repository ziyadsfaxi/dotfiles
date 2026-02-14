return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- This is a function that gets the existing lualine options
    -- and lets you modify them.
    local lualine_c = opts.sections.lualine_c
    local lualine_z = opts.sections.lualine_z

    -- Add the tmux windows to the middle section (lualine_c)
    table.insert(lualine_c, {
      require("tmux-status").tmux_windows,
      cond = require("tmux-status").show,
    })

    -- Add search count before clock
    table.insert(lualine_z, 1, {
      "searchcount",
      cond = function()
        return vim.v.hlsearch == 1
      end,
    })

    -- Add the tmux session name to the right section (lualine_z)
    -- You might want to remove the existing clock or other components
    -- if you find it too cluttered.
    table.insert(lualine_z, {
      require("tmux-status").tmux_session,
      cond = require("tmux-status").show,
    })

    -- You can also add other components like tmux_datetime or tmux_battery
    -- table.insert(lualine_z, {
    --   require("tmux-status").tmux_datetime,
    --   cond = require("tmux-status").show,
    -- })

    return opts
  end,
}
