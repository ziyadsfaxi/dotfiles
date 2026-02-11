return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "stevearc/overseer.nvim",
    },
    optional = true,
    init = function()
      local dap = require("dap")
      local overseer = require("overseer")

      -- Enable DAP integration in overseer (to support launch.json's preLaunchTask)
      overseer.enable_dap()

      -- local phpPath = require("mason-registry").get_package("php-debug-adapter"):get_install_path()
      -- dap.adapters.php = {
      --   type = "executable",
      --   command = "node",
      --   args = { phpPath .. "/extension/out/phpDebug.js" },
      -- }

      -- C# since netcoredbg doesn't support arm64, we have to build it from source.
      -- current installed path is /usr/local/netcoredbg
      local netcoredbgPath = "/usr/local/netcoredbg"

      local netcoredbg_adapter = {
        type = "executable",
        command = netcoredbgPath,
        args = { "--interpreter=vscode" },
        options = {
          detached = false,
        },
      }

      dap.adapters.netcoredbg = netcoredbg_adapter -- needed for normal debugging
      dap.adapters.coreclr = netcoredbg_adapter -- needed for unit test debugging

      dap.defaults.cs.exception_breakpoints = { "uncaught" }
    end,
  },
}
