call plug#begin(stdpath('data') . '/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"
" theme
Plug 'iCyMind/NeoSolarized'
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-commentary'
Plug 'justinmk/vim-sneak'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-signify'

Plug 'tpope/vim-surround'

Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-unimpaired'

Plug 'mhinz/vim-grepper'

Plug 'janko/vim-test'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

Plug 'tpope/vim-dispatch'

Plug 'francoiscabrol/ranger.vim'

Plug 'jceb/vim-orgmode'

Plug 'tpope/vim-speeddating'

Plug 'tpope/vim-repeat'

" for org-mode
Plug 'mattn/calendar-vim'

Plug 'jqno/jqno-extractvariable.vim'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

Plug 'editorconfig/editorconfig-vim'
" Plug 'sgur/vim-editorconfig'

Plug 'dense-analysis/ale'

Plug 'tpope/vim-abolish'

Plug 'ledger/vim-ledger'

Plug 'mhinz/vim-crates'

" Plug 'chaoren/vim-wordmotion'

" This must be called before importing any Lua modules added above.
call plug#end()

