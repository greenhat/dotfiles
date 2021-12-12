call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"
" theme
" Plug 'iCyMind/NeoSolarized'
" Plug 'altercation/vim-colors-solarized'
" Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-commentary'
Plug 'justinmk/vim-sneak'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-signify'

Plug 'tpope/vim-surround'

" Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-unimpaired'

Plug 'mhinz/vim-grepper'

" Plug 'janko/vim-test'

" " Build the extra binary if cargo exists on your system.
" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
" let g:clap_theme = 'solarized_light'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

Plug 'tpope/vim-dispatch'

Plug 'francoiscabrol/ranger.vim'

Plug 'jceb/vim-orgmode'

Plug 'tpope/vim-speeddating'

Plug 'tpope/vim-repeat'

" for org-mode
" Plug 'mattn/calendar-vim'

" Plug 'jqno/jqno-extractvariable.vim'

" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

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

" This must be called before importing any Lua modules added above.
call plug#end()



" Show line numbers.
set nonumber
set norelativenumber

" Always expand tabs to spaces.
set expandtab

" Keep a buffer around even when abandoned.
" Without this, jump-to-definition in LSP clients seems to complain if the
" file hasn't been saved. In other words, let us go to other buffers even if
" the current one isn't saved.
set hidden

" This causes neovim to use the system clipboard for all yanking operations,
" instead of needing to use the '+' or '*' registers explicitly.
set clipboard+=unnamedplus
" set clipboard+=unnamed  " use the clipboards of vim and win
" set paste               " Paste from a windows or from vim
" set go+=a               " Visual selection automatically copied to the clipboard

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

" CoC. Some LSP servers have issues with backup files
set nobackup
set nowritebackup

" CoC. You will have a bad experience with diagnostic messages with the default 4000.
set updatetime=300

" CoC. Don't give |ins-completion-menu| messages.
set shortmess+=c

" CoC. Always show signcolumns
set signcolumn=yes

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

set shell=zsh

set foldmethod=syntax
set nofoldenable

" org
let g:org_agenda_files = ['~/Documents/org/*.org']
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
let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }




let mapleader=" "       " leader is space
let maplocalleader=" "

" Hitting escape twice should clear any search highlights.
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>

" CoC -----------------------------------------------------------------------------
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Used in the tab autocompletion for coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" OLD
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType scala setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>aa  <Plug>(coc-codeaction-cursor)
" Apply AutoFix to problem on the current line.
nmap <leader>cq  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Trigger for code actions
" Make sure `"codeLens.enable": true` is set in your coc config
nnoremap <leader>cl :<C-u>call CocActionAsync('codeLensAction')<CR>

nnoremap <leader>ci :<C-u>call CocActionAsync('diagnosticInfo')<CR>

" Show all diagnostics
nnoremap <silent> <leader>cd  :<C-u>CocList diagnostics<cr>
" Manage extensions
" nnoremap <silent> <leader>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>cp  :<C-u>CocListResume<CR>

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Toggle panel with Tree Views
nnoremap <silent> <leader>v :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <leader>vb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <leader>vc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Reveal current current class (trait or object) in Tree View 'metalsBuild'
nnoremap <silent> <leader>vf :<C-u>CocCommand metals.revealInTreeView metalsBuild<CR>

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Terminal
" ------------------------------------------------------------------------
" map <Esc> to exit terminal-mode
tnoremap <Esc> <C-\><C-n>

" To simulate |i_CTRL-R| in terminal-mode:
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" To use `ALT+{h,j,k,l}` to navigate windows from any mode:
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Git Signify 
nnoremap <silent> <leader>hd :SignifyHunkDiff<cr>
nnoremap <silent> <leader>hu :SignifyHunkUndo<cr>

" hunk text object
omap ih <plug>(signify-motion-inner-pending)
xmap ih <plug>(signify-motion-inner-visual)
omap ah <plug>(signify-motion-outer-pending)
xmap ah <plug>(signify-motion-outer-visual)

" Grepper
" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>

" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Open Grepper-prompt for a particular grep-alike tool
nnoremap <Leader>g :Grepper -tool git<CR>
nnoremap <Leader>G :Grepper -tool rg<CR>

" FZF
nnoremap <silent> <leader>fa :GFiles<CR>
nnoremap <silent> <leader>fA :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>

" FZF MRU
nnoremap <silent> <Leader>ff :FZFMru<cr>

" close current window
nnoremap <C-l> <C-w>c
inoremap <C-l> <Esc><C-w>c
tnoremap <C-l> <C-\><C-N><C-w>c

" vim-test
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

" Quickfix
nmap <silent> <leader>qc :cclose<CR>

" ranger
let g:ranger_map_keys = 0
map <silent> <leader>fr :sp <bar> Ranger<CR>
map <silent> <leader>fR :sp <bar> RangerWorkingDirectory<CR>

" search for visually selected text with //
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" vim-extract-variable plugin
nmap <leader>re <Plug>(extractVariableNormal)
vmap <leader>re <Plug>(extractVariableVisual)

" ALE
nmap <silent> <leader>qd <Plug>(ale_detail)

inoremap <C-S> <Esc>:update<cr>gi
nnoremap <C-S> :update<cr>

" Copy link to a clipboard instead of opening a browser:
let g:gh_open_command = 'fn() { echo "$@" | wl-copy; }; fn '

" fix gx once and for all 
" via https://github.com/vim/vim/issues/4738
nnoremap <silent> gx :execute 'silent! !xdg-open ' . shellescape(expand('<cWORD>'), 1)<cr>




set termguicolors

set background=light

" colorscheme solarized

let g:gruvbox_contrast_light='hard'
let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=1
autocmd vimenter * colorscheme gruvbox

hi CocCodeLens guifg=LightGray
autocmd vimenter * hi CocCodeLens guifg=LightGray
" type hints
hi CocHintSign guifg= LightGray
autocmd vimenter * hi CocHintSign guifg= LightGray
" Doc comments in Rust ///
hi SpecialComment guifg=Grey
autocmd vimenter * hi SpecialComment guifg=Grey

" let g:airline_theme='solarized'
autocmd vimenter * let g:airline_theme='gruvbox'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#grepper#enabled = 1
let g:airline#extensions#hunks#enabled = 1


" Label-mode minimizes the steps to jump to a location, using a clever interface
" similar to EasyMotion. If enabled, Sneak overlays text with "labels" which can
" be jumped-to by typing the label character
let g:sneak#label=1

" FZF in floating window 
" let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.5 } }


" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

" to get comment highlighting in jsonc
autocmd FileType json syntax match Comment +\/\/.\+$+

" disable completion in markdown
autocmd FileType markdown let b:coc_suggest_disable = 1 

" Trigger auto loading changes from files on disk into buffers (if they are not edited)
" By default, CursorHold is triggered after the cursor remains still for 4 seconds, and is configurable via updatetime.
" au CursorHold,CursorHoldI * checktime

" vim-crates
if has('nvim')
  autocmd BufRead Cargo.toml call crates#toggle()
endif

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif

imap jj <Esc>
