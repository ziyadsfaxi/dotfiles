-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.opt.foldmethod = "syntax"
-- vim.o.autoread = true

-- enable folding for C#
-- vim.cmd("autocmd FileType cs setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr() foldlevel=99")

-- if windows disable man
if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
  vim.g.loaded_man = 1
  vim.o.shell = "pwsh.exe"
  vim.o.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command"
  vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s"
  vim.o.shellpipe = "| %s"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""

  vim.defer_fn(function()
    vim.opt.shellslash = false
  end, 5000)
end

-- vim.lsp.inlay_hint.enable()
