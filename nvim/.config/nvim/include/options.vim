" Always expand tabs to spaces.
set expandtab

" This causes neovim to use the system clipboard for all yanking operations,
" instead of needing to use the '+' or '*' registers explicitly.
set clipboard+=unnamedplus

" There's no need to do syntax highlighting past this many columns. The default
" of 3000 is a bit and degrades performance.
set synmaxcol=200

" While typing a search, start highlighting results.
set incsearch

" When scrolling, always keep the cursor N lines from the edges.
set scrolloff=3

" turn on syntax highlighting
syntax enable

set ignorecase	" ignore case when using a search pattern
set smartcase	" override 'ignorecase' when pattern has upper case characters
set showcmd	" show (partial) command keys in the status line

" search down into subfolders
" provides tab completion for file related tasks
" set path+=**

" CoC
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" CoC. Some LSP servers have issues with backup files
set nobackup
set nowritebackup

" CoC
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" CoC. Don't give |ins-completion-menu| messages.
set shortmess+=c

" CoC
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif
set nonumber
set norelativenumber
set signcolumn=yes

" CoC
set tagfunc=CocTagFunc

" When a file has been detected to have been changed outside of Vim and it has not 
" been changed inside of Vim, automatically read it again. When the file has been deleted this is not done.
set autoread

" vim-test use runner
" see strategies - https://github.com/vim-test/vim-test
let test#strategy = "neovim"
let test#scala#runner = 'blooptest'
" let test#scala#runner = 'sbttest'

" FZF MRU plugin
" list files within current directory
let g:fzf_mru_relative = 1
" prevent fzf from sorting list while typing, it will keep list sorted by recency
let g:fzf_mru_no_sort = 1

" Grepper
" init default values
runtime plugin/grepper.vim
" set default options for tools
" case-insensitive
let g:grepper.git.grepprg .= 'i'

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

" org
let g:org_agenda_files = ['~/Sync/org/*.org']
let g:org_heading_shade_leading_stars = 0

" Auto save buffers when focus is lost
" This variant will silently ignore errors from the :wa command, but it does 
" mean any of your untitled buffers, buffers for read-only files, etc. will not be 
" saved just from losing focus, and you will not be notified of this.
:au FocusLost * silent! wa

" editorconfig plugin
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" editorconfig plugin
" Exclude regexp patterns for filetypes or filepaths
" let g:editorconfig_blacklist = {
"     \ 'filetype': ['git.*', 'fugitive'],
"     \ 'pattern': ['\.un~$']}

" disable automatic newline at the end of file
:set nofixendofline

" ALE
let g:ale_enabled = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_disable_lsp = 1
" open a window if list non-empty
let g:ale_open_list = 0 
let g:ale_lint_on_text_changed = 'never'

" don't steal focus to status line when stepping on the line with error
let g:ale_echo_cursor = 1
" show (one line) of the error as virtual text
let g:ale_virtualtext_cursor = 0
" show message in a preview window
let g:ale_cursor_detail = 0
" Use cargo check instead of build
" let g:ale_rust_cargo_use_check = 1
" Use cargo clippy instead of check
let g:ale_rust_cargo_use_clippy = 1
let g:airline#extensions#ale#enabled = 1

" always change to current file directory
" set autochdir

" CoC. Give more space for displaying messages.
set cmdheight=1

" Details:bp("buffer previous") moves us to a different buffer in the current
" window (bn would work, too), then bd # ("buffer delete" "alternate file")
" deletes the buffer we just moved away
command! Bd bp\|bd \#

command! -bang -bar -nargs=* Gpush execute 'Dispatch<bang> -dir=' .
      \ fnameescape(FugitiveGitDir()) 'git push' <q-args>

" Firenvim
" let g:firenvim_config = { 
"     \ 'globalSettings': {
"         \ 'alt': 'all',
"     \  },
"     \ 'localSettings': {
"         \ '.*': {
"             \ 'cmdline': 'neovim',
"             \ 'content': 'text',
"             \ 'priority': 0,
"             \ 'selector': 'textarea',
"             \ 'takeover': 'never',
"         \ },
"     \ }
" \ }

" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " .  <q-args>, 1, fzf#vim#with_preview(), <bang>0)

set jumpoptions+="stack"
set previewheight=24

let $FZF_DEFAULT_OPTS = '--bind alt-q:accept'
