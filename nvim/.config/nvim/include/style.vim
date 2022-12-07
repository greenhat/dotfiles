set termguicolors

set background=light

" colorscheme solarized

" let g:gruvbox_contrast_light='hard'
" let g:gruvbox_italic=1
" let g:gruvbox_italicize_comments=1

lua << EOF
require("gruvbox").setup{
        undercurl = true,
        underline = true,
        bold = true,
        italic = true, -- will make italic comments and special strings
        strikethrough = true,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        contrast = "hard", -- can be "hard" or "soft"
        overrides = {},
}
EOF

autocmd vimenter * colorscheme gruvbox

" hi CocCodeLens guifg=LightGray
" autocmd vimenter * hi CocCodeLens guifg=LightGray
"
" type hints
" hi CocHintSign ctermfg=Gray
" autocmd vimenter * hi CocHintSign guifg=Gray guibg=LightGray
"
hi CocInlayHint guifg=LightGray guibg=GruvboxBg0
autocmd vimenter * hi CocInlayHint guifg=LightGray guibg=GruvboxBg0
" autocmd vimenter * hi CocHintSign ctermfg=Gray

hi CocHintVirtualText guifg=LightGray guibg=GruvboxBg0
autocmd vimenter * hi CocHintVirtualText guifg=LightGray guibg=GruvboxBg0

" Doc comments in Rust ///
hi SpecialComment guifg=Grey
autocmd vimenter * hi SpecialComment guifg=Grey

" temp workaround for https://github.com/neoclide/coc.nvim/issues/3980
hi default CocMenuSel       ctermbg=gray guibg=gray

" let g:airline_theme='solarized'
" autocmd vimenter * let g:airline_theme='gruvbox'
" autocmd vimenter * let g:airline_theme='solarized'
let g:airline_theme='base16_gruvbox_light_soft'
autocmd vimenter * let g:airline_theme='base16_gruvbox_light_soft'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
" let g:airline#extensions#grepper#enabled = 1
" let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#fzf#enabled = 1


" Label-mode minimizes the steps to jump to a location, using a clever interface
" similar to EasyMotion. If enabled, Sneak overlays text with "labels" which can
" be jumped-to by typing the label character
let g:sneak#label=1

" FZF in floating window 
" let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.5 } }
let g:fzf_layout = { 'down': '30%' }

" function! SetLinesForFirefox(timer)
"     set lines=48 columns=110 laststatus=0
" endfunction


if exists('g:started_by_firenvim')
        " set guifont=Iosevka\ Fixed:h20
        " call timer_start(1000, function("SetLinesForFirefox"))
endif

lua << EOF
-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  ensure_installed = {"lua", "rust", "scala", "toml", "bash", "c", "cmake", "comment", "cpp", "css", "dockerfile", "html", "java", "javascript", "jsdoc", "json", "kotlin", "python", "regex", "typescript", "yaml" },
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
        ['aA'] = '@call.outer',
        ['iA'] = '@call.inner',
        ['aC'] = '@conditional.outer',
        ['iC'] = '@conditional.inner',
        ['ab'] = '@block.outer',
        ['ib'] = '@block.inner',
        ['ia'] = '@parameter.inner',
        ['aa'] = '@parameter.outer',
        ['as'] = '@statement.outer',
        ['aS'] = '@scopename.inner',
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
EOF
