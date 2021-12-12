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
        augroup vim_crates
                autocmd!
                autocmd BufRead Cargo.toml call crates#toggle()
        augroup end
endif

augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end
