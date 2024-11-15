-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.g.lazyvim_picker = "fzf-lua"

vim.opt.relativenumber = false
vim.opt.number = false

--- wrapping makes lines jiggly when typing
vim.opt.wrap = false

vim.g.markdown_syntax_conceal = 0
vim.wo.conceallevel = 0

-- Disable blink-cmp-copilot (Copilot completion in blink-cmp)
vim.g.ai_cmp = false
