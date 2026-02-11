return {
  {
    "gbprod/phpactor.nvim",
    ft = "php",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      install = {
        -- path = vim.fn.stdpath("data") .. "/opt/",
        -- branch = "master",
        bin = "~/.local/share/nvim/mason/bin/phpactor",
        -- php_bin = "php",
        -- composer_bin = "composer",
        -- git_bin = "git",
        check_on_startup = "none",
      },
      lspconfig = {
        enabled = false,
      },
    },
  },
}
