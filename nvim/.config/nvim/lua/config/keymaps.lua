-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map({ "i", "x", "n", "s" }, "<M-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- unmap move line up and down
vim.keymap.del({ "i", "x", "n", "s" }, "<M-j>")
vim.keymap.del({ "i", "x", "n", "s" }, "<M-k>")
