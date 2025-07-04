-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.g.lazyvim_picker = "fzf-lua"

-- vim.opt.relativenumber = false
-- vim.opt.number = false

--- wrapping makes lines jiggly when typing? no, seems like no line numbers in the gutter makes it jiggly
-- vim.opt.wrap = true

vim.g.markdown_syntax_conceal = 0
vim.wo.conceallevel = 0

-- Disable blink-cmp-copilot (Copilot completion in blink-cmp)
vim.g.ai_cmp = false

vim.opt.laststatus = 2

-- vim.cmd([[
--  hi! link StatusLine Normal
--  hi! link StatusLineNC Normal
--  set statusline=%{repeat('─',winwidth('.'))}
--  ]])

-- remove "-" for trailing whitespace
vim.opt.listchars = {
  tab = "> ",
  trail = " ",
  nbsp = "+",
}

vim.g.snacks_animate = false

vim.opt.sidescrolloff = 0

-- `config` in the plugin does not work, so do it here
vim.g.firenvim_config = {
  -- config values, like in my case:
  localSettings = {
    [".*"] = {
      takeover = "never",
    },
  },
}
-- set background (needed for firenvim)
vim.opt.background = "light"

vim.opt.autoread = true

-- if vim.g.started_by_firenvim == true or vim.fn.has("mac") then
--   -- leave default clipboard for firenvim
-- else
--   if vim.env.TMUX ~= nil then
--     local copy = { "tmux", "load-buffer", "-w", "-" }
--     local paste = { "bash", "-c", "tmux refresh-client -l && sleep 0.05 && tmux save-buffer -" }
--     vim.g.clipboard = {
--       name = "tmux",
--       copy = {
--         ["+"] = copy,
--         ["*"] = copy,
--       },
--       paste = {
--         ["+"] = paste,
--         ["*"] = paste,
--       },
--       cache_enabled = 0,
--     }
--   else
--     -- use OSC 52 (otherwise the default will be wl-copy on wayland)
--     vim.g.clipboard = {
--       name = "OSC 52",
--       copy = {
--         ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
--         ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
--       },
--       paste = {
--         ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
--         ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
--       },
--     }
--   end
-- end
