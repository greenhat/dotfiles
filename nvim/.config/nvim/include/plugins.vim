call plug#begin(stdpath('data') . '/plugged')
Plug 'ellisonleao/gruvbox.nvim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"
" theme
" Plug 'iCyMind/NeoSolarized'
" Plug 'altercation/vim-colors-solarized'
" Plug 'lifepillar/vim-solarized8'
" Plug 'morhetz/gruvbox'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Or build from source code by using yarn: https://yarnpkg.com
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

Plug 'tpope/vim-commentary'
Plug 'justinmk/vim-sneak'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-signify'

Plug 'tpope/vim-surround'

" Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-unimpaired'

" Plug 'mhinz/vim-grepper'

" Plug 'janko/vim-test'

" " Build the extra binary if cargo exists on your system.
" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
" let g:clap_theme = 'solarized_light'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'pbogut/fzf-mru.vim'

" Plug 'tpope/vim-dispatch'

Plug 'francoiscabrol/ranger.vim'

Plug 'tpope/vim-speeddating'

Plug 'tpope/vim-repeat'

" for org-mode
" Plug 'mattn/calendar-vim'

" Plug 'jqno/jqno-extractvariable.vim'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Plug 'subnut/nvim-ghost.nvim', {'do': ':call nvim_ghost#installer#install()'}

Plug 'editorconfig/editorconfig-vim'
" Plug 'sgur/vim-editorconfig'

" Plug 'dense-analysis/ale'

Plug 'tpope/vim-abolish'

Plug 'ledger/vim-ledger'

Plug 'mhinz/vim-crates'

" Plug 'chaoren/vim-wordmotion'

Plug 'jiangmiao/auto-pairs'

Plug 'ruanyl/vim-gh-line'

" breaks vim-sneak 's' 
" Plug 'maxbrunsfeld/vim-yankstack'

" Plug 'junegunn/vim-peekaboo'

Plug 'cespare/vim-toml'

" Plug 'bfredl/nvim-miniyank'

" Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'github/copilot.vim'

" Plug 'nvim-orgmode/orgmode'

" Plug 'svermeulen/vim-cutlass'

Plug 'stsewd/fzf-checkout.vim'

" This must be called before importing any Lua modules added above.
call plug#end()

packadd cfilter
