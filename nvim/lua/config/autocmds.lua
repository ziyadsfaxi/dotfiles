-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })
-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--   pattern = "*.cshtml",
--   command = "set filetype=html.cshtml.razor",
-- })
--
-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--   pattern = "*.razor",
--   command = "set filetype=html.cshtml.razor",
-- })

-- Auto reload file if changed outside of Neovim
vim.api.nvim_create_augroup("AutoRead", { clear = true })
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  group = "AutoRead",
  pattern = "*",
  command = "checktime",
})
