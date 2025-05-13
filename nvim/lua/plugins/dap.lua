return {
  "mfussenegger/nvim-dap",
  optional = true,
  opts = function()
    local dap = require("dap")

    local phpPath = require("mason-registry").get_package("php-debug-adapter"):get_install_path()
    dap.adapters.php = {
      type = "executable",
      command = "node",
      args = { phpPath .. "/extension/out/phpDebug.js" },
    }

    -- C# since netcoredbg doesn't support arm64, we have to build it from source.
    -- current installed path is /usr/local/netcoredbg
    local netcoredbgPath = "/usr/local/netcoredbg"

    -- if not dap.adapters["netcoredbg"] then
    require("dap").adapters["netcoredbg"] = {
      type = "executable",
      command = netcoredbgPath,
      args = { "--interpreter=vscode" },
      options = {
        detached = false,
      },
    }
    -- end
  end,
}
