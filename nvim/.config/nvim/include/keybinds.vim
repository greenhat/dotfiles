let mapleader=" "       " leader is space
let maplocalleader=" "

" Hitting escape twice should clear any search highlights.
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
nnoremap <silent> <ESC> :nohlsearch<CR>

" CoC -----------------------------------------------------------------------------
" Use <tab> and <S-tab> to navigate completion list: >
" function! s:check_back_space() abort
"         let col = col('.') - 1
"         return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" Insert <tab> when previous text is space, refresh completion if not.
" inoremap <silent><expr> <TAB>
"                         \ coc#pum#visible() ? coc#pum#next(1):
"                         \ <SID>check_back_space() ? "\<Tab>" :
"                         \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
else
        inoremap <silent><expr> <c-@> coc#refresh()
endif

" To make <CR> to confirm selection of selected complete item or notify
" coc.nvim
" to format on enter, use: >
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
                        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Map <tab> for trigger completion, completion confirm, snippet expand and
" jump
" like VSCode: 

" inoremap <silent><expr> <TAB>
"                         \ coc#pum#visible() ? coc#_select_confirm() :
"                         \ coc#expandableOrJumpable() ?
"                         \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"                         \ <SID>check_back_space() ? "\<TAB>" :
"                         \ coc#refresh()

" function! s:check_back_space() abort
"         let col = col('.') - 1
"         return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" let g:coc_snippet_next = '<tab>'


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gd <C-]>
" nmap <silent> gd :call CocAction('jumpDefinition', 'drop')<CR>
nmap <silent> gvd :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gp :pclose<CR><C-W>}
" nmap <silent> gp <C-W>}
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> go :<C-u>call CocAction('showOutgoingCalls')<CR>
nmap <silent> gn :<C-u>call CocAction('showIncomingCalls')<CR>

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,scala,rust setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>la  <Plug>(coc-codeaction-selected)
nmap <leader>la  <Plug>(coc-codeaction-selected)

nmap <leader>a  <Plug>(coc-codeaction-cursor)
" Apply AutoFix to problem on the current line.
nmap <leader>lf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Trigger for code actions
" Make sure `"codeLens.enable": true` is set in your coc config
nnoremap <leader>ll :<C-u>call CocActionAsync('codeLensAction')<CR>

" nnoremap <leader>di :<C-u>call CocActionAsync('diagnosticInfo')<CR>

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>e  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>le  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>lc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>j  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>lj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>lk  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>lp  :<C-u>CocListResume<CR>

" nnoremap <silent> <leader>e       :<C-u>CocFzfList diagnostics<CR>
" " nnoremap <silent> <leader>b       :<C-u>CocFzfList diagnostics --current-buf<CR>
" nnoremap <silent> <leader>lc       :<C-u>CocFzfList commands<CR>
" nnoremap <silent> <leader>le       :<C-u>CocFzfList extensions<CR>
" " nnoremap <silent> <leader>l       :<C-u>CocFzfList location<CR>
" nnoremap <silent> <leader>o       :<C-u>CocFzfList outline<CR>
" nnoremap <silent> <leader>j       :<C-u>CocFzfList symbols<CR>
" nnoremap <silent> <leader>lp       :<C-u>CocFzfListResume<CR>

" " Toggle panel with Tree Views
" nnoremap <silent> <leader>v :<C-u>CocCommand metals.tvp<CR>
" " Toggle Tree View 'metalsBuild'
" nnoremap <silent> <leader>vb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" " Toggle Tree View 'metalsCompile'
" nnoremap <silent> <leader>vc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" " Reveal current current class (trait or object) in Tree View 'metalsBuild'
" nnoremap <silent> <leader>vf :<C-u>CocCommand metals.revealInTreeView metalsBuild<CR>

" Terminal
" ------------------------------------------------------------------------
" map <Esc> to exit terminal-mode excluding fzf dialogs
" tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

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
" https://github.com/junegunn/fzf.vim/issues/233
nnoremap <silent> <leader>f :execute system('git rev-parse --is-inside-work-tree') =~ 'true' ? 'GFiles' : 'Files'<CR>
nnoremap <silent> <leader>F :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>c :Commands<CR>
nnoremap <silent> <leader>; :History<CR>
nnoremap <silent> <leader>h :Helptags<CR>
nnoremap <silent> <leader>vb :Helptags<CR>

" Live rigpreg via https://github.com/junegunn/fzf.vim#example-advanced-ripgrep-integration
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
nnoremap <silent> <leader>sp :RG<CR>
nnoremap <silent> <leader>sw :Rg <C-R>=expand("<cword>")<CR><CR>

" FZF MRU
" nnoremap <silent> <Leader>ff :FZFMru<cr>

" close current window
" nnoremap <C-l> <C-w>c
" inoremap <C-l> <Esc><C-w>c
" tnoremap <C-l> <C-\><C-N><C-w>c

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
map <silent> <leader>qr :sp <bar> Ranger<CR>
map <silent> <leader>qR :sp <bar> RangerWorkingDirectory<CR>

" search for visually selected text with //
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" vim-extract-variable plugin
nmap <leader>re <Plug>(extractVariableNormal)
vmap <leader>re <Plug>(extractVariableVisual)

inoremap <C-S> <Esc>:w<cr>gi
nnoremap <C-S> :w<cr>

" Copy link to a clipboard instead of opening a browser:
let g:gh_open_command = 'fn() { echo "$@" | wl-copy; }; fn '

" fix gx once and for all 
" via https://github.com/vim/vim/issues/4738
nnoremap <silent> gx :execute 'silent! !xdg-open ' . shellescape(expand('<cWORD>'), 1)<cr>

nnoremap <silent> <leader>zr :source $MYVIMRC<cr>
" imap jj <Esc>

" map p <Plug>(miniyank-autoput)
" map P <Plug>(miniyank-autoPut)
" map <leader>n <Plug>(miniyank-cycle)
" map <leader>N <Plug>(miniyank-cycleback)

nnoremap <leader>vp :G push<cr>

" remap ex-scroll Ctrl-D to Delete
inoremap <C-d> <Del>

