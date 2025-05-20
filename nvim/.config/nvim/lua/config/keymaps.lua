-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map({ "i", "x", "n", "s" }, "<M-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- unmap the lazyvim window navigation in favor of <M-hjkl> mapped to nvim-tmux-navigation
vim.keymap.del({ "n" }, "<C-h>")
vim.keymap.del({ "n" }, "<C-j>")
vim.keymap.del({ "n" }, "<C-k>")
vim.keymap.del({ "n" }, "<C-l>")

map({ "n", "x" }, "<leader>gy", function()
  Snacks.gitbrowse({
    open = function(url)
      vim.fn.setreg("+", url)
    end,
  })
end, { desc = "Git Browse (copy)" })

-- readline like keymaps on macos
map({ "i" }, "<M-BS>", "<C-w>", { desc = "delete word backward" })

-- -- Move to window using the <cmd> hjkl keys
-- map("n", "<M-h>", "<C-w>h", { desc = "Go to Left Window" })
-- map("n", "<M-j>", "<C-w>j", { desc = "Go to Lower Window" })
-- map("n", "<M-k>", "<C-w>k", { desc = "Go to Upper Window" })
-- map("n", "<M-l>", "<C-w>l", { desc = "Go to Right Window" })

map(
  "n",
  "<Leader>xc",
  ":call setreg('+', expand('%:.') .. ':' .. line('.'))<CR>",
  { desc = "Copy the current file path" }
)
