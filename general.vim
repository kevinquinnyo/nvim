syntax on           " Syntax highlighting
set hidden          " Allow files to remain open without saving
set number nu       " Line numbers
set autoindent      " Auto indenting
set smartindent     " Smart indenting
"set relativenumber  " Line numbers count away from current position
"set paste           " Paste mode so it maintains whitespace when copy/paste
" set cursorline    " Color the cursorline if you like that

" Some basic PSR code style rules
set tabstop=4           " Tab width
set softtabstop=4       " Soft tab width
set shiftwidth=4        " Shift width
set expandtab           " Use spaces instead of tabs

set t_Co=256

" Cycle through buffers quickly
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" quick edit of this file
map <Leader>ve :tabnew ~/.config/nvim/init.vim<CR>

" multiple vim instance yank/paste tmp file hack
vmap <leader>y :w! /tmp/vitmp<CR>
nmap <leader>p :r! cat /tmp/vitmp<CR>

filetype plugin indent on " use the file type plugins

colorscheme gruvbox
set background=dark

" hardmode - disable arrow keys
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>
