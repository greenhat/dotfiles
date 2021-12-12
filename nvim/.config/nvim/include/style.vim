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


