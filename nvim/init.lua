---@diagnostic disable: lowercase-global
-- Paq bootstrap
local install_path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

require'utils'

-- Disable providers we do not care a about
-- vim.g.loaded_python_provider  = 0
vim.g.loaded_ruby_provider    = 0
vim.g.loaded_perl_provider    = 0
vim.g.loaded_node_provider    = 0

-- Disable some in built plugins completely
local disabled_built_ins = {
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'logipat',
  'rrhelper',
  'spellfile_plugin',
  'matchit',
   --'matchparen',
}
for _, plugin in pairs(disabled_built_ins) do
  vim.g['loaded_' .. plugin] = 1
end

--Incremental live completion
vim.o.inccommand = 'nosplit'

--Set highlight on search
vim.o.hlsearch = true

--Make line numbers default
vim.wo.number = false

--Do not save when switching buffers
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.cmd [[set undofile]]

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- This causes neovim to use the system clipboard for all yanking operations,
-- instead of needing to use the '+' or '*' registers explicitly.
vim.cmd("set clipboard+=unnamedplus")

-- Always expand tabs to spaces.
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- While typing a search, start highlighting results.
vim.o.incsearch = true

vim.o.ignorecase = true	-- ignore case when using a search pattern
vim.o.smartcase = true	-- override 'ignorecase' when pattern has upper case character

-- When scrolling, always keep the cursor N lines from the edges.
vim.o.scrolloff = 3

-- When a file has been detected to have been changed outside of Vim and it has not
-- been changed inside of Vim, automatically read it again. When the file has been deleted this is not done.
vim.o.autoread = true

-- disable automatic newline at the end of file
vim.o.fixendofline = false

-- vim-togglelist
vim.g.toggle_list_no_mappings = true

-- nvim-send-to-term
vim.g.send_disable_mapping = true

require('paq') {
  "savq/paq-nvim";                  -- Let Paq manage itself
  'wbthomason/packer.nvim';
  'nvim-lua/plenary.nvim';
  'neovim/nvim-lspconfig';

  'rktjmp/lush.nvim';
  'npxbr/gruvbox.nvim';

  'tpope/vim-fugitive';
  'tpope/vim-commentary';
  'tpope/vim-repeat';
  'tpope/vim-unimpaired';

  'tpope/vim-surround';
  'nvim-lua/popup.nvim';
  'nvim-lua/plenary.nvim';
  'nvim-telescope/telescope.nvim';

  'vijaymarupudi/nvim-fzf';
  'kyazdani42/nvim-web-devicons';
  'ibhagwan/fzf-lua';

  'hoob3rt/lualine.nvim';

  'lewis6991/gitsigns.nvim';

  'nvim-treesitter/nvim-treesitter';
  'nvim-treesitter/nvim-treesitter-textobjects';

  'hrsh7th/nvim-compe';
  -- 'L3MON4D3/LuaSnip';

  'kevinhwang91/rnvimr';

  'windwp/nvim-autopairs';
  'ggandor/lightspeed.nvim';
  'milkypostman/vim-togglelist';

  'mhinz/vim-crates';

  'ruifm/gitlinker.nvim';

  'simrat39/rust-tools.nvim';

  'scalameta/nvim-metals';

  'mtikekar/nvim-send-to-term';

  'editorconfig/editorconfig-vim';

  -- {as = 'fzf-lsp', url = 'file://$HOME/src/my/fzf-lsp.nvim'};
}

-- load local plugins
vim.o.runtimepath = vim.o.runtimepath .. ",~/src/my/fzf-lsp.nvim"

require('gitlinker').setup({ mappings = "<leader>gh" })

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.o.background = "light"
-- vim.g.onedark_terminal_italics = 2
-- vim.cmd [[colorscheme onedark]]
-- vim.cmd [[colorscheme solarized-high]]
vim.cmd [[colorscheme gruvbox]]
-- vim.cmd [[let g:gruvbox_contrast_light="soft"]]
-- vim.cmd [[let g:gruvbox_contrast_light="medium"]]
vim.cmd [[let g:gruvbox_contrast_light="hard"]]

-- ignore ranger rifle file
vim.g.rnvimr_vanilla = true

require('nvim-autopairs').setup()

-- keymappings, keybindings

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local remap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Vim
remap('n', '<leader>zr', '<cmd>source $MYVIMRC<CR>', opts)
remap('n', '<leader>c', [[<cmd>lua require('telescope.builtin').commands()<CR>]], opts)
remap('n', '<leader>;', [[<cmd>lua require('telescope.builtin').command_history()<CR>]], opts)

remap('n', '<leader>tt', [[<cmd>lua require('telescope.builtin').builtin()<CR>]], opts)
-- remap('n', '<leader>b',  [[<cmd>lua require('telescope.builtin').buffers({sort_lastused = true, ignore_current_buffer = true})<CR>]], opts)
remap('n', '<leader>b',  [[<cmd>lua require('fzf-lua').buffers()<CR>]], opts)
-- remap('n', '<leader>fa', [[<cmd>lua require('telescope.builtin').git_files()<CR>]], opts)
remap('n', '<leader>fa', [[<cmd>lua require('fzf-lua').files()<CR>]], opts)
remap('n', '<leader>fh', [[<cmd>lua require('fzf-lua').help_tags()<CR>]], opts)
remap('n', '<leader>fA', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], opts)
-- remap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], opts)
-- remap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], opts)
-- remap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], opts)
-- remap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], opts)
-- remap('n', '<leader>gp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)
remap('n', '<leader>sp', [[<cmd>lua require('fzf-lua').live_grep()<CR>]], opts)
-- via https://github.com/nvim-telescope/telescope.nvim/issues/708
-- remap('n', '<leader>gw', [[<cmd>lua require('telescope.builtin').grep_string({search = vim.fn.expand("<cword>")})<cr>]], {})
remap('n', '<leader>sw', [[<cmd>lua require('fzf-lua').grep_cword()<cr>]], {})
remap('n', '<leader>sW', [[<cmd>lua require('fzf-lua').grep_cWORD()<cr>]], {})
remap('v', '<leader>sv', [[<cmd>lua require('fzf-lua').grep_visual()<cr>]], {})
-- remap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], opts)
-- remap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], opts)

-- VCS
remap('n', '<leader>vp', [[<cmd>G push<cr>]], {})
-- remap('n', '<leader>vb', "<CMD>lua require'fzf-lua'.git_branches()<CR>", {})
remap('n', '<leader>vb', "<CMD>lua require'telescope.builtin'.git_branches()<CR>", {})

-- LSP
remap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
remap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
remap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- remap( 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
-- remap( 'n', 'gi', [[<cmd>lua require('telescope.builtin').lsp_implementations()<CR>]], opts)
remap('n', 'gi', [[<cmd>lua require('fzf-lua').lsp_implementations()<CR>]], opts)
-- remap( 'n', 'gi', [[<cmd>Implementations<CR>]], opts)
remap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
remap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
remap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
remap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
remap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
remap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
remap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- remap( 'n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
remap('n', 'gr', '<cmd>lua require("fzf-lua").lsp_references()<CR>', opts)
-- remap( 'n', 'gr', '<cmd>References<CR>', opts)
-- remap( 'n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
remap('n', '<leader>a', [[<cmd>lua require('telescope.builtin').lsp_code_actions({layout_config = {width = 0.3, height = 0.2}})<CR>]], opts)
-- remap( 'n', '<leader>a', [[<cmd>lua require('fzf-lua').lsp_code_actions({layout_config = {width = 0.3, height = 0.2}})<CR>]], opts)
-- remap( 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
-- remap( 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
remap('n', '<leader>E', [[<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics({ line_width = 90 })<CR>]], opts)
-- remap( 'n', '<leader>e', [[<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics({ default_text = ':error:', line_width = 90, only_cwd = true })<CR>]], opts)
remap('n', '<leader>e', [[<cmd>lua require('fzf-lua').lsp_workspace_diagnostics({workspace_diag_only_cwd = true})<CR>]], opts)
-- remap( 'n', '<leader>e', [[<cmd>lua require'fzf_lsp'.diagnostic(0, { bufnr = "*", workspace_diag_only_cwd = true })<CR>]], opts)
remap('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
remap('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
remap('n', '<leader>ql', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
-- remap( 'n', '<leader>o', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
remap('n', '<leader>O', [[<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>]], opts)
remap('n', '<leader>o', [[<cmd>DocumentSymbols<CR>]], opts)
-- remap( 'n', '<leader>s', [[<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>]], opts)
remap('n', '<leader>L', [[<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>]], opts)
-- remap( 'n', '<leader>s', [[<cmd>WorkspaceSymbols<CR>]], opts)
remap('n', '<leader>l', [[<cmd>lua require('fzf-lua').lsp_workspace_symbols()<CR>]], opts)

-- Ctrl-S to "save"
remap('i', '<C-S>', '<Esc> :update<cr>gi', opts)
remap('n', '<C-S>', ':update<cr>', opts)

-- Map compe confirm and complete functions
-- remap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
remap('i', "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })
remap('i', '<c-space>', 'compe#complete()', { expr = true })

-- Hitting escape twice should clear any search highlights.
remap('n', '<ESC><ESC>', ':nohlsearch<CR>', opts)
-- run on this config loading to avoid highlight on reload
vim.cmd[[:nohlsearch]]

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

---------------------------------------------------------------------------------------------------

require('lualine').setup({
    -- options = { theme = 'solarized' }
    options = { theme = 'gruvbox_light', icons_enabled = 1 },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'b:gitsigns_status'},
        lualine_c = {{'filename', file_status = true, path = 1}},
        -- lualine_x = {'encoding', 'fileformat', 'filetype'},
        -- lualine_x = {{'filetype', colored = true}},
        lualine_x = {},
        lualine_y = {
            {
                'diagnostics',
                sources = {'nvim_lsp'},
                sections = {'error', 'warn', 'info', 'hint'},
                symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'}
            }
        },
        lualine_z = {'location'}
    },
})

require('gitsigns').setup {
  signs = {
    add = { hl = 'GitSignsAdd', text = '|' },
    change = { hl = 'GitSignsChange', text = '|' },
    delete = { hl = 'GitSignsDelete', text = '_' },
    topdelete = { hl = 'GitSignsDelete', text = '‾' },
    changedelete = { hl = 'GitSignsChange', text = '~' },
  },
  numhl = false,
  linehl = false,
  keymaps = {
	  -- Default keymap options
	  noremap = true,
	  buffer = true,

	  ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
	  ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

	  ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
	  ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
	  ['n <leader>hS'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
	  ['n <leader>hu'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
	  ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
	  ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
	  ['n <leader>hd'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
	  ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

	  -- Text objects
	  ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
	  ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
  },
  watch_index = {
    interval = 1000,
    follow_files = true
  },
}

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
    --     ['<C-u>'] = false,
    --     ['<C-d>'] = false,
      },
    },
    layout_strategy = 'vertical',
    file_sorter =  require('telescope.sorters').get_fzy_sorter,
    file_ignore_patterns = {},
    generic_sorter =  require('telescope.sorters').get_fzy_sorter,
  },
  pickers = {
  buffers = {
    mappings = {
      i = {
        ["<c-d>"] = require("telescope.actions").delete_buffer,
        -- -- or right hand side can also be the name of the action as string
        -- ["<c-d>"] = "delete_buffer",
      },
      n = {
        ["<c-d>"] = require("telescope.actions").delete_buffer,
      }
    }
  }
  }
}

vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

vim.cmd[[
augroup vim_crates
autocmd!
autocmd BufRead Cargo.toml call crates#toggle()
augroup end
]]

-- LSP settings
local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Enable the following language servers
local servers = { 'clangd', 'rust_analyzer', 'tsserver' }
for _, lsp in ipairs(servers) do
  require'lspconfig'[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Example custom server
-- local sumneko_root_path = vim.fn.getenv("HOME").."/.local/bin/sumneko_lua" -- Change to your sumneko root installation
-- local sumneko_binary = sumneko_root_path .. '/bin/linux/lua-language-server'
local sumneko_binary = 'lua-language-server'

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').sumneko_lua.setup {
  -- cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
  cmd = { sumneko_binary },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  ensure_installed = {"lua", "rust", "scala", "toml", "bash", "c", "cmake", "comment", "cpp", "css", "dockerfile", "html", "java", "javascript", "jsdoc", "json", "kotlin", "python", "regex", "swift", "typescript", "yaml" },
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['aC'] = '@conditional.outer',
        ['iC'] = '@conditional.inner',
        ['ab'] = '@block.outer',
        ['ib'] = '@block.inner',
        ['ia'] = '@parameter.inner',
        ['as'] = '@statement.outer',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noinsert'

-- Compe setup
require('compe').setup {
  source = {
    path = true,
    nvim_lsp = true,
    -- luasnip = true,
    buffer = true,
    calc = false,
    nvim_lua = false,
    vsnip = false,
    ultisnips = false,
  },
}


-- Gpush for fugitive
-- vim.cmd [[ command! -bang -bar -nargs=* Gpush execute 'Dispatch<bang> -dir=' .  fnameescape(FugitiveGitDir()) 'git push' <q-args> ]]

vim.cmd[[
augroup sway
autocmd!
autocmd FocusGained * silent execute '!sleep 0.1 && swaymsg unbindsym Mod1+h, unbindsym Mod1+j, unbindsym Mod1+k, unbindsym Mod1+l'
autocmd VimEnter * silent execute '!swaymsg unbindsym Mod1+h, unbindsym Mod1+j, unbindsym Mod1+k, unbindsym Mod1+l'
autocmd FocusLost * silent execute '!swaymsg bindsym Mod1+h focus left , bindsym Mod1+j focus down, bindsym Mod1+k focus up, bindsym Mod1+l focus right'
autocmd VimLeave * silent execute '!swaymsg bindsym Mod1+h focus left , bindsym Mod1+j focus down, bindsym Mod1+k focus up, bindsym Mod1+l focus right'
augroup end
]]

vim.cmd[[

function! SwayOrSplitSwitch(wincmd, direction)
  let previous_winnr = winnr()
  silent! execute "wincmd " . a:wincmd
  if previous_winnr == winnr()
    call system("swaymsg focus " . a:direction)
  endif
endfunction

nnoremap <silent> <A-h> :call SwayOrSplitSwitch('h', 'left')<cr>
nnoremap <silent> <A-j> :call SwayOrSplitSwitch('j', 'down')<cr>
nnoremap <silent> <A-k> :call SwayOrSplitSwitch('k', 'up')<cr>
nnoremap <silent> <A-l> :call SwayOrSplitSwitch('l', 'right')<cr>

inoremap <silent> <A-h> <C-\><C-n>: call SwayOrSplitSwitch('h', 'left')<cr>
inoremap <silent> <A-j> <C-\><C-n>: call SwayOrSplitSwitch('j', 'down')<cr>
inoremap <silent> <A-k> <C-\><C-n>: call SwayOrSplitSwitch('k', 'up')<cr>
inoremap <silent> <A-l> <C-\><C-n>: call SwayOrSplitSwitch('l', 'right')<cr>
    
tnoremap <silent> <A-h> <C-\><C-n>: call SwayOrSplitSwitch('h', 'left')<cr>
tnoremap <silent> <A-j> <C-\><C-n>: call SwayOrSplitSwitch('j', 'down')<cr>
tnoremap <silent> <A-k> <C-\><C-n>: call SwayOrSplitSwitch('k', 'up')<cr>
tnoremap <silent> <A-l> <C-\><C-n>: call SwayOrSplitSwitch('l', 'right')<cr>
]]


vim.cmd([[augroup lsp_cursor_highlight ]])
vim.cmd([[autocmd!]])
vim.cmd([[autocmd CursorHold   * lua vim.lsp.buf.document_highlight()]])
vim.cmd([[autocmd CursorHoldI  * lua vim.lsp.buf.document_highlight()]])
vim.cmd([[autocmd CursorMoved  * lua vim.lsp.buf.clear_references()]])
vim.cmd([[autocmd CursorMovedI * lua vim.lsp.buf.clear_references()]])
vim.cmd([[augroup end ]])

require('rust-tools').setup({
  tools = { -- rust-tools options
  -- automatically set inlay hints (type hints)
  -- There is an issue due to which the hints are not applied on the first
  -- opened file. For now, write to the file to trigger a reapplication of
  -- the hints or just run :RustSetInlayHints.
  -- default: true
  autoSetHints = true,

  -- whether to show hover actions inside the hover window
  -- this overrides the default hover handler so something like lspsaga.nvim's hover would be overriden by this
  -- default: true
  hover_with_actions = true,

  -- These apply to the default RustRunnables command
  runnables = {
    -- whether to use telescope for selection menu or not
    -- default: true
    use_telescope = true

    -- rest of the opts are forwarded to telescope
  },

  -- These apply to the default RustSetInlayHints command
  inlay_hints = {
    -- wheter to show parameter hints with the inlay hints or not
    -- default: true
    show_parameter_hints = true,

    -- prefix for parameter hints
    -- default: "<-"
    parameter_hints_prefix = "<- ",

    -- prefix for all the other hints (type, chaining)
    -- default: "=>"
    other_hints_prefix = "=> ",

    -- whether to align to the lenght of the longest line in the file
    max_len_align = false,

    -- padding from the left if max_len_align is true
    max_len_align_padding = 1,

    -- whether to align to the extreme right or not
    right_align = false,

    -- padding from the right if right_align is true
    right_align_padding = 7
  },

  hover_actions = {
    -- the border that is used for the hover window
    -- see vim.api.nvim_open_win()
    border = {
      {"╭", "FloatBorder"}, {"─", "FloatBorder"},
      {"╮", "FloatBorder"}, {"│", "FloatBorder"},
      {"╯", "FloatBorder"}, {"─", "FloatBorder"},
      {"╰", "FloatBorder"}, {"│", "FloatBorder"}
    },

    -- whether the hover action window gets automatically focused
    -- default: false
    auto_focus = false
  }
},


-- all the opts to send to nvim-lspconfig
-- these override the defaults set by rust-tools.nvim
-- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
server = {
  -- example at https://github.com/simrat39/rust-tools.nvim/issues/28
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    allow_incremental_sync = true,
    debounce_text_changes = 500,
  },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        command = "clippy"
      },
      assist = {
        importGranularity = "item",
        importEnforceGranularity = true
      }
    },
  },
}
})

-- format on save
vim.cmd([[augroup autoformat ]])
vim.cmd([[autocmd!]])
vim.cmd[[autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 100)]]
vim.cmd[[autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)]]
vim.cmd[[autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)]]
vim.cmd([[augroup end ]])

-- vim.cmd[[set guifont=Iosevka\ Fixed:h7:b]]

-- Scala Metals

-- Without doing this, autocommands that deal with filetypes prohibit messages from being shown... and since we heavily rely on this, this must be set.
-- https://github.com/scalameta/nvim-metals
vim.opt_global.shortmess:remove("F"):append("c")

-- Metals LSP
vim.cmd([[augroup lsp]])
vim.cmd([[autocmd!]])
vim.cmd([[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
vim.cmd([[autocmd FileType scala,sbt lua require("metals").initialize_or_attach(metals_config())]])
vim.cmd([[augroup end]])

-- Need for symbol highlights to work correctly
vim.cmd([[hi! link LspReferenceText CursorColumn]])
vim.cmd([[hi! link LspReferenceRead CursorColumn]])
vim.cmd([[hi! link LspReferenceWrite CursorColumn]])

function metals_config()
  -- TODO: called on every file open
  local metals_config = require("metals").bare_config

  -- Example of settings
  metals_config.settings = {
    showImplicitArguments = true,
    excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
  }

  -- Example of how to ovewrite a handler
  metals_config.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = { prefix = "" },
  })

  -- I *highly* recommend setting statusBarProvider to true, however if you do,
  -- you *have* to have a setting to display this in your statusline or else
  -- you'll not see any messages from metals. There is more info in the help
  -- docs about this
  -- metals_config.init_options.statusBarProvider = "on"

  metals_config.capabilities = capabilities
  metals_config.on_attach = on_attach
  return metals_config
end


-- fzf lua
require'fzf-lua'.setup {
  winopts = {
    -- map C-c to Esc
    -- window_on_create = function()
    --   vim.cmd("set winhl=Normal:Normal")  -- popup bg to match normal windows
    --   vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", "<C-c>", { nowait = true, silent = true })
    -- end
  },
  fzf_layout = 'default',
  preview_layout = 'vertical',
  lsp = {
    workspace_diag_only_cwd = true,
  }
}

