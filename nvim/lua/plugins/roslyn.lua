return {
  "seblyng/roslyn.nvim",
  ---@module 'roslyn.config'
  ---@type RoslynNvimConfig
  opts = {
    -- your configuration comes here; leave empty for default settings
  },
  ft = { "cshtml", "razor", "cs" },
  dependencies = {
    {
      "tris203/rzls.nvim",
      config = true,
    },
    {
      "jlcrochet/vim-razor",
    },
  },
  config = function()
    local rzls_path = vim.fn.expand("~/.local/share/nvim/mason/packages/rzls/libexec")
    vim.lsp.config("roslyn", {
      cmd = {
        "roslyn",
        "--stdio",
        "--logLevel=Information",
        "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
        "--razorSourceGenerator=" .. vim.fs.joinpath(rzls_path, "Microsoft.CodeAnalysis.Razor.Compiler.dll"),
        "--razorDesignTimePath=" .. vim.fs.joinpath(rzls_path, "Targets", "Microsoft.NET.Sdk.Razor.DesignTime.targets"),
        "--extension",
        vim.fs.joinpath(rzls_path, "RazorExtension", "Microsoft.VisualStudioCode.RazorExtension.dll"),
      },
      handlers = require("rzls.roslyn_handlers"),
      settings = {},
    })
    vim.lsp.enable("roslyn")
  end,
  init = function()
    vim.filetype.add({
      extension = {
        razor = "razor",
        cshtml = "razor",
      },
    })
  end,
}
