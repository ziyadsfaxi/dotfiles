-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del("n", "<leader>cd")

vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set("n", "<leader>ba", function()
  Snacks.bufdelete.all()
end, { desc = "Delete All Buffers" })

vim.keymap.set({ "n", "x" }, "<leader>gy", function()
  local file_path = vim.fn.expand("%:p")
  local line_num = vim.fn.line(".")
  local link_text = string.format("%s:%d", file_path, line_num)
  vim.fn.setreg("+", link_text)
  print("Copied local file link: " .. link_text)
end, { desc = "Copy local file link" })

vim.keymap.set("n", "<leader>aa", function()
  local pane_count = vim.fn.system("tmux list-panes | wc -l")
  pane_count = tonumber(vim.trim(pane_count))

  if pane_count and pane_count > 1 then
    vim.fn.system("tmux select-pane -R && tmux split-window -vb claude")
  else
    vim.fn.system("tmux split-window -h claude")
  end
end, { desc = "Open Claude CLI in tmux pane" })
