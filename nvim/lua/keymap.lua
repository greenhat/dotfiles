---@diagnostic disable: lowercase-global
-- keymappings, keybindings

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local remap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Vim
remap('n', '<leader>zr', '<cmd>lua reload"keymap"<CR>', opts)
-- remap('n', '<leader>c', [[<cmd>lua require('telescope.builtin').commands()<CR>]], opts)
remap('n', '<leader>c', [[<cmd>:Commands<CR>]], opts)
remap('n', '<leader>;', [[<cmd>:History:<CR>]], opts)

remap('n', '<leader>tt', [[<cmd>lua require('telescope.builtin').builtin()<CR>]], opts)
-- remap('n', '<leader>b',  [[<cmd>lua require('telescope.builtin').buffers({sort_lastused = true, ignore_current_buffer = true})<CR>]], opts)
remap('n', '<leader>b',  [[<cmd>lua require('fzf-lua').buffers()<CR>]], opts)
-- remap('n', '<leader>fa', [[<cmd>lua require('telescope.builtin').git_files()<CR>]], opts)
remap('n', '<leader>fa', [[<cmd>lua require('fzf-lua').files()<CR>]], opts)
-- remap('n', '<leader>fh', [[<cmd>lua require('fzf-lua').help_tags()<CR>]], opts)
remap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], opts)
remap('n', '<leader>fA', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], opts)

-- Search
remap('n', '<leader>sp', [[<cmd>lua require('fzf-lua').live_grep()<CR>]], opts)
remap('n', '<leader>sw', [[<cmd>lua require('fzf-lua').grep_cword()<cr>]], {})
remap('n', '<leader>sW', [[<cmd>lua require('fzf-lua').grep_cWORD()<cr>]], {})
remap('v', '<leader>sv', [[<cmd>lua require('fzf-lua').grep_visual()<cr>]], {})

-- VCS
remap('n', '<leader>vp', [[<cmd>G push<cr>]], {})
-- remap('n', '<leader>vb', "<CMD>lua require'fzf-lua'.git_branches()<CR>", {})
remap('n', '<leader>vb', "<CMD>lua require'telescope.builtin'.git_branches()<CR>", {})
-- remap('n', '<leader>vc', "<CMD>lua require'telescope.builtin'.git_commits()<CR>", {})
-- remap('n', '<leader>vC', "<CMD>lua require'telescope.builtin'.git_bcommits()<CR>", {})
-- remap('n', '<leader>vc', "<CMD>lua require'fzf-lua'.git_commits()<CR>", {})
-- remap('n', '<leader>vC', "<CMD>lua require'fzf-lua'.git_bcommits()<CR>", {})
remap('n', '<leader>vc', "<CMD>Commits<CR>", {})
remap('n', '<leader>vC', "<CMD>BCommits<CR>", {})

-- LSP
remap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
remap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
remap('n', 'gp', '<Cmd>RustParentModule<CR>', opts)
remap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- remap( 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
-- remap( 'n', 'gi', [[<cmd>lua require('telescope.builtin').lsp_implementations()<CR>]], opts)
remap('n', 'gi', [[<cmd>lua require('fzf-lua').lsp_implementations()<CR>]], opts)
-- remap( 'n', 'gi', [[<cmd>Implementations<CR>]], opts)
remap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
remap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
-- remap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
-- remap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
-- remap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
remap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
remap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- remap( 'n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
remap('n', 'gr', '<cmd>lua require("fzf-lua").lsp_references()<CR>', opts)
-- remap( 'n', 'gr', '<cmd>References<CR>', opts)
-- remap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
-- remap('v', '<leader>a', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
remap('n', '<leader>a', [[<cmd>lua require('telescope.builtin').lsp_code_actions({layout_config = {width = 0.3, height = 0.2}})<CR>]], opts)
remap('x', '<leader>a', [[<esc><cmd>lua require('telescope.builtin').lsp_range_code_actions({layout_config = {width = 0.3, height = 0.2}})<CR>]], opts)
-- remap( 'n', '<leader>a', [[<cmd>lua require('fzf-lua').lsp_code_actions({layout_config = {width = 0.3, height = 0.2}})<CR>]], opts)
-- remap( 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
-- remap( 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
remap('n', '<leader>E', [[<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics({ line_width = 90 })<CR>]], opts)
-- remap( 'n', '<leader>e', [[<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics({ default_text = ':error:', line_width = 90, only_cwd = true })<CR>]], opts)
remap('n', '<leader>e', [[<cmd>lua require('fzf-lua').lsp_workspace_diagnostics({cwd_only = true})<CR>]], opts)
-- remap( 'n', '<leader>e', [[<cmd>lua require'fzf_lsp'.diagnostic(0, { bufnr = "*", workspace_diag_only_cwd = true })<CR>]], opts)
remap('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
remap('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
-- remap('n', '<leader>ql', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
remap( 'n', '<leader>O', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
remap('n', '<leader>o', [[<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>]], opts)
-- remap('n', '<leader>J', [[<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>]], opts)
remap('n', '<leader>j', [[<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>]], opts)
-- remap( 'n', '<leader>s', [[<cmd>WorkspaceSymbols<CR>]], opts)
-- remap('n', '<leader>j', [[<cmd>lua require('fzf-lua').lsp_workspace_symbols()<CR>]], opts)
remap('n', '<leader>J', [[<cmd>lua require('fzf-lua').lsp_live_workspace_symbols()<CR>]], opts)
remap('n', '<leader>lr', '<cmd>RustRunnables<CR>', opts)

-- lightspeed
-- To keep using `;` and `,` in the native way
function repeat_ft(reverse)
  local ls = require'lightspeed'
  ls.ft['instant-repeat?'] = true
  ls.ft:to(reverse, ls.ft['prev-t-like?'])
end
remap('n', ';', '<cmd>lua repeat_ft(false)<cr>', opts)
remap('x', ';', '<cmd>lua repeat_ft(false)<cr>', opts)
remap('n', ',', '<cmd>lua repeat_ft(true)<cr>', opts)
remap('x', ',', '<cmd>lua repeat_ft(true)<cr>', opts)


-- Ctrl-S to "save"
remap('i', '<C-S>', '<Esc> :update<cr>gi', opts)
remap('n', '<C-S>', ':update<cr>', opts)

-- Map compe confirm and complete functions
-- remap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
-- remap('i', "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })
remap('i', "<CR>", [[compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))]], { expr = true })
remap('i', '<c-space>', 'compe#complete()', { expr = true })

-- Hitting escape twice should clear any search highlights.
remap('n', '<ESC><ESC>', ':nohlsearch<CR>', opts)

-- map <Esc> to exit terminal-mode
remap('t', '<ESC>', '<C-\\><C-n>', opts)
vim.cmd[[tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi']]

-- fix gx once and for all (via https://github.com/vim/vim/issues/4738)
remap('n', 'gx', ':execute "silent! !xdg-open " . shellescape(expand("<cWORD>"), 1)<cr>', opts)

remap('n', '<leader>fr', ':RnvimrToggle<CR>', opts)

-- toggle quickfix
remap('n', '<leader>qq', ':call ToggleQuickfixList()<CR>', opts)

-- nvim-send-to-term
vim.cmd[[
nmap <leader>mm <Plug>SendLine
nmap <leader>m <Plug>Send
vmap <leader>m <Plug>Send
]]

-- close current window
vim.cmd[[
nnoremap <C-l> <C-w>c
inoremap <C-l> <Esc><C-w>c
tnoremap <C-l> <C-\><C-N><C-w>c
]]

remap('n', '<leader>gh', '<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>', opts)
remap('v', '<leader>gh', ':lua require"gitlinker".get_buf_range_url("v")<cr>', opts)

vim.cmd[[imap jj <Esc>]]
