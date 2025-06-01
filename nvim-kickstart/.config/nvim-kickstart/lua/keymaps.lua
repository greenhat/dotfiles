-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set(
  'n',
  '<leader>qx',
  vim.diagnostic.setloclist,
  { desc = 'Open diagnostic [Q]uickfix list' }
)

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- -- Keybinds to make split navigation easier.
-- --  Use CTRL+<hjkl> to switch between windows
-- --
-- --  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

local map = vim.keymap.set

map({ 'i', 'x', 'n', 's' }, '<M-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })
map({ 'i', 'x', 'n', 's' }, '<D-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

-- map({ 'n', 'x' }, '<leader>gy', function()
--   Snacks.gitbrowse {
--     open = function(url)
--       vim.fn.setreg('+', url)
--     end,
--   }
-- end, { desc = 'Git Browse (copy)' })

-- readline like keymaps on macos
map({ 'i' }, '<M-BS>', '<C-w>', { desc = 'delete word backward' })

-- -- Move to window using the <cmd> hjkl keys
-- map("n", "<M-h>", "<C-w>h", { desc = "Go to Left Window" })
-- map("n", "<M-j>", "<C-w>j", { desc = "Go to Lower Window" })
-- map("n", "<M-k>", "<C-w>k", { desc = "Go to Upper Window" })
-- map("n", "<M-l>", "<C-w>l", { desc = "Go to Right Window" })

map(
  'n',
  '<Leader>xc',
  ":call setreg('+', expand('%:.') .. ':' .. line('.'))<CR>",
  { desc = 'Copy the current file path' }
)

map('n', '<Leader>qq', '<cmd>qa<cr><esc>', { desc = 'Quit' })

map('n', '<Leader><tab>s', '<cmd>tab split<cr>', { desc = 'open in new tab' })

map('n', '<Leader>bd', '<cmd>bprevious <bar> bdelete #<CR>', { desc = 'close buffer' })
map('n', '<Leader>bo', '<cmd>%bd|e#<CR>', { desc = 'close all but the current buffer' })

-- vim: ts=2 sts=2 sw=2 et
