-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

-- send-to-term 
vim.g.send_disable_mapping = true
-- vim-togglelist
vim.g.toggle_list_no_mappings = true

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'nvim-lua/plenary.nvim'
  -- Themes
  -- use 'joshdick/onedark.vim' -- Theme inspired by Atom
  -- use 'ishan9299/nvim-solarized-lua'
  use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  ---
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'

  -- https://github.com/b3nj5m1n/kommentary/issues/41
  -- does not support dot command

  use 'tpope/vim-surround'
  -- use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  -- UI to select things (files, grep results, open buffers...)
  -- use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } }
  use { '$HOME/src/work/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } }


  -- use { 'ibhagwan/fzf-lua',
  use { '$HOME/src/my/fzf-lua',
    requires = {
      'vijaymarupudi/nvim-fzf',
      'kyazdani42/nvim-web-devicons' } -- optional for icons
  }

  use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }
  -- Add indentation guides even on blank lines
  -- use 'lukas-reineke/indent-blankline.nvim'
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  -- use 'kabouzeid/nvim-lspinstall'
  use 'hrsh7th/nvim-compe' -- Autocompletion plugin
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'tpope/vim-dispatch'
  use 'kevinhwang91/rnvimr'
  use 'windwp/nvim-autopairs'

  -- use 'justinmk/vim-sneak'
    use 'ggandor/lightspeed.nvim'

  use 'tpope/vim-unimpaired'
  use 'milkypostman/vim-togglelist'
  use 'mhinz/vim-crates'
  use { 'ruifm/gitlinker.nvim', requires = 'nvim-lua/plenary.nvim', }
  use { 'simrat39/rust-tools.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' }, { 'nvim-telescope/telescope.nvim'} }}
  use 'scalameta/nvim-metals'
  use 'mtikekar/nvim-send-to-term'
  use 'editorconfig/editorconfig-vim'

  -- use 'tversteeg/registers.nvim'

  -- use 'gfanto/fzf-lsp.nvim'
  use '$HOME/src/my/fzf-lsp.nvim'

end)

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

vim.g.rnvimr_vanilla = true

--Set statusbar
-- vim.g.lightline = {
--   colorscheme = 'solarized',
--   active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
--   component_function = { gitbranch = 'fugitive#head' },
-- }
require('lualine').setup({
    -- options = { theme = 'solarized' }
    options = { theme = 'gruvbox_light', icons_enabled = 1 },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
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

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

----Remap for dealing with word wrap
--vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
--vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

--Map blankline
-- vim.g.indent_blankline_char = '┊'
-- vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
-- vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
-- vim.g.indent_blankline_char_highlight = 'LineNr'
-- vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Gitsigns
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
}

-- Telescope
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
--Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader>tt', [[<cmd>lua require('telescope.builtin').builtin()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>b',  [[<cmd>lua require('telescope.builtin').buffers({sort_lastused = true, ignore_current_buffer = true})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b',  [[<cmd>lua require('fzf-lua').buffers()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>fa', [[<cmd>lua require('telescope.builtin').git_files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fa', [[<cmd>lua require('fzf-lua').files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', [[<cmd>lua require('fzf-lua').help_tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fA', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>gp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gp', [[<cmd>lua require('fzf-lua').live_grep()<CR>]], { noremap = true, silent = true })
-- via https://github.com/nvim-telescope/telescope.nvim/issues/708
-- vim.api.nvim_set_keymap('n', '<leader>gw', [[<cmd>lua require('telescope.builtin').grep_string({search = vim.fn.expand("<cword>")})<cr>]], {})
vim.api.nvim_set_keymap('n', '<leader>gw', [[<cmd>lua require('fzf-lua').grep_cword()<cr>]], {})
vim.api.nvim_set_keymap('n', '<leader>gW', [[<cmd>lua require('fzf-lua').grep_cWORD()<cr>]], {})
vim.api.nvim_set_keymap('v', '<leader>gv', [[<cmd>lua require('fzf-lua').grep_visual()<cr>]], {})
-- vim.api.nvim_set_keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cc', [[<cmd>lua require('telescope.builtin').commands()<CR>]], { noremap = true, silent = true })

-- This will load fzy_native and have it override the default file sorter
-- require('telescope').load_extension('fzy_native')

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- Y yank until the end of line
-- vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

-- LSP settings
local nvim_lsp = require 'lspconfig'
local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', [[<cmd>lua require('telescope.builtin').lsp_implementations()<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', [[<cmd>lua require('fzf-lua').lsp_implementations()<CR>]], opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', [[<cmd>Implementations<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua require("fzf-lua").lsp_references()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>References<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', [[<cmd>lua require('telescope.builtin').lsp_code_actions({layout_config = {width = 0.3, height = 0.2}})<CR>]], opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', [[<cmd>lua require('fzf-lua').lsp_code_actions({layout_config = {width = 0.3, height = 0.2}})<CR>]], opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>E', [[<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics({ line_width = 90 })<CR>]], opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', [[<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics({ default_text = ':error:', line_width = 90, only_cwd = true })<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', [[<cmd>lua require('fzf-lua').lsp_workspace_diagnostics({workspace_diag_only_cwd = true})<CR>]], opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', [[<cmd>lua require'fzf_lsp'.diagnostic(0, { bufnr = "*", workspace_diag_only_cwd = true })<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ql', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>o', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>o', [[<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>o', [[<cmd>DocumentSymbols<CR>]], opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>s', [[<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>s', [[<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>]], opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>s', [[<cmd>WorkspaceSymbols<CR>]], opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>s', [[<cmd>lua require('fzf-lua').lsp_workspace_symbols()<CR>]], opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

  -- require "lsp_signature".on_attach()  -- Note: add in lsp client on-attach
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Enable the following language servers
local servers = { 'clangd', 'rust_analyzer', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
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

-- Utility functions for compe and luasnip
-- local t = function(str)
--   return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end

-- local check_back_space = function()
--   local col = vim.fn.col '.' - 1
--   if col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' then
--     return true
--   else
--     return false
--   end
-- end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
-- local luasnip = require 'luasnip'

-- _G.tab_complete = function()
--   if vim.fn.pumvisible() == 1 then
--     return t '<C-n>'
--   elseif luasnip.expand_or_jumpable() then
--     return t '<Plug>luasnip-expand-or-jump'
--   elseif check_back_space() then
--     return t '<Tab>'
--   else
--     return vim.fn['compe#complete']()
--   end
-- end

-- _G.s_tab_complete = function()
--   if vim.fn.pumvisible() == 1 then
--     return t '<C-p>'
--   elseif luasnip.jumpable(-1) then
--     return t '<Plug>luasnip-jump-prev'
--   else
--     return t '<S-Tab>'
--   end
-- end

-- -- Map tab to the above tab complete functiones
-- vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', { expr = true })
-- vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', { expr = true })
-- vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
-- vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })

-- Map compe confirm and complete functions
-- vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
vim.api.nvim_set_keymap('i', "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })

-- Gpush for fugitive
vim.cmd [[ command! -bang -bar -nargs=* Gpush execute 'Dispatch<bang> -dir=' .  fnameescape(FugitiveGitDir()) 'git push' <q-args> ]]

-- Ctrl-S to "save"
vim.api.nvim_set_keymap('i', '<C-S>', '<Esc> :update<cr>gi', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-S>', ':update<cr>', { noremap = true })

-- Hitting escape twice should clear any search highlights.
vim.api.nvim_set_keymap('n', '<ESC><ESC>', ':nohlsearch<CR>', { noremap = true, silent = true})
-- run on this config loading to avoid highlight on reload
vim.cmd[[:nohlsearch]]

-- map <Esc> to exit terminal-mode
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', { noremap = true, silent = true})
vim.cmd[[tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi']]

-- To use `ALT+{h,j,k,l}` to navigate windows from any mode:
-- vim.api.nvim_set_keymap('t', '<A-h>', '<C-\\><C-n><C-w>h', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('t', '<A-j>', '<C-\\><C-n><C-w>j', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('t', '<A-k>', '<C-\\><C-n><C-w>k', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('t', '<A-l>', '<C-\\><C-n><C-w>l', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('i', '<A-h>', '<C-\\><C-n><C-w>h', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('i', '<A-j>', '<C-\\><C-n><C-w>j', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('i', '<A-k>', '<C-\\><C-n><C-w>k', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('i', '<A-l>', '<C-\\><C-n><C-w>l', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', { noremap = true, silent = true})

vim.cmd[[

augroup sway
autocmd!
autocmd FocusGained * silent execute "!sh -c 'sleep 0.01 && swaymsg unbindsym Mod1+h, unbindsym Mod1+j, unbindsym Mod1+k, unbindsym Mod1+l' &"
autocmd FocusLost * silent execute '!swaymsg bindsym Mod1+h focus left , bindsym Mod1+j focus down, bindsym Mod1+k focus up, bindsym Mod1+l focus right'
autocmd VimLeave * silent execute '!swaymsg bindsym Mod1+h focus left , bindsym Mod1+j focus down, bindsym Mod1+k focus up, bindsym Mod1+l focus right'
augroup end

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

-- fix gx once and for all (via https://github.com/vim/vim/issues/4738)
vim.api.nvim_set_keymap('n', 'gx', ':execute "silent! !xdg-open " . shellescape(expand("<cWORD>"), 1)<cr>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', 'gx', ':execute "silent! !open " . shellescape(expand("<cWORD>"), 1)<cr>', {noremap = true, silent = true})

-- close current window
-- nnoremap <C-l> <C-w>c
-- inoremap <C-l> <Esc><C-w>c
-- tnoremap <C-l> <C-\><C-N><C-w>c

-- https://github.com/windwp/nvim-autopairs
require('nvim-autopairs').setup()

vim.api.nvim_set_keymap('n', '<leader>fr', ':RnvimrToggle<CR>', {noremap = true, silent = true})

-- Label-mode minimizes the steps to jump to a location, using a clever interface
-- similar to EasyMotion. If enabled, Sneak overlays text with "labels" which can
-- be jumped-to by typing the label character
-- vim.cmd('let g:sneak#label=1')

-- toggle quickfix
vim.api.nvim_set_keymap('n', '<leader>qq', ':call ToggleQuickfixList()<CR>', { noremap = true, silent = true })

require('gitlinker').setup({
        mappings = "<leader>gh"
})
vim.cmd([[augroup cursor ]])
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

vim.cmd([[augroup custom_tab ]])
vim.cmd([[autocmd!]])
vim.cmd[[autocmd FileType lua lua vim.o.shiftwidth = 2 ]]
vim.cmd[[autocmd FileType lua lua vim.o.tabstop = 2 ]]
vim.cmd([[augroup end ]])


-- vim-crates
vim.cmd([[augroup vimcrates]])
vim.cmd([[autocmd!]])
vim.cmd[[autocmd BufRead Cargo.toml call crates#toggle()]]
vim.cmd([[augroup end ]])

vim.cmd[[set guifont=Iosevka\ Fixed:h7:b]]

-- Scala Metals

-- Without doing this, autocommands that deal with filetypes prohibit messages from being shown... and since we heavily rely on this, this must be set.
-- https://github.com/scalameta/nvim-metals
vim.opt_global.shortmess:remove("F"):append("c")

-- Metals LSP
vim.cmd([[augroup lsp]])
vim.cmd([[autocmd!]])
vim.cmd([[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
vim.cmd([[autocmd FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]])
vim.cmd([[augroup end]])
-- Need for symbol highlights to work correctly
vim.cmd([[hi! link LspReferenceText CursorColumn]])
vim.cmd([[hi! link LspReferenceRead CursorColumn]])
vim.cmd([[hi! link LspReferenceWrite CursorColumn]])

metals_config = require("metals").bare_config

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
vim.api.nvim_set_keymap('n', ';', '<cmd>lua repeat_ft(false)<cr>',
  {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', ';', '<cmd>lua repeat_ft(false)<cr>',
  {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ',', '<cmd>lua repeat_ft(true)<cr>',
  {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', ',', '<cmd>lua repeat_ft(true)<cr>',
  {noremap = true, silent = true})

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
  lsp = {
    workspace_diag_only_cwd = true,
  }
}
