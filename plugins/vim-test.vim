" vim-tests (unit testing in vim)
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-t> :TestFile<CR>
nmap <silent> t<C-l> :TestLast<CR>
let test#strategy = {
    \ 'nearest': 'neovim',
    \ 'file':    'dispatch',
\}
